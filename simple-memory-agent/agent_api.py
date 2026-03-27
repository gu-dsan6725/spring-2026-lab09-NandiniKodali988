from fastapi import FastAPI, HTTPException
from pydantic import BaseModel
from typing import Optional, Dict, Any
import uuid

from agent import Agent

app = FastAPI(
    title="Memory Agent API",
    description="Multi-tenant conversational agent with semantic memory",
    version="1.0.0"
)

# session cache: run_id -> Agent instance
_session_cache: Dict[str, Agent] = {}


def _get_or_create_agent(user_id: str, run_id: str) -> Agent:
    if run_id in _session_cache:
        return _session_cache[run_id]
    agent = Agent(user_id=user_id, run_id=run_id)
    _session_cache[run_id] = agent
    return agent


class InvocationRequest(BaseModel):
    user_id: str
    run_id: Optional[str] = None
    query: str
    metadata: Optional[Dict[str, Any]] = None


class InvocationResponse(BaseModel):
    response: str
    user_id: str
    run_id: str


@app.get("/ping")
def ping():
    return {"status": "ok", "message": "Memory Agent API is running"}


@app.post("/invocation", response_model=InvocationResponse)
def invocation(request: InvocationRequest):
    run_id = request.run_id or str(uuid.uuid4())[:8]

    try:
        agent = _get_or_create_agent(request.user_id, run_id)
        response = agent.chat(request.query)
        return InvocationResponse(
            response=response,
            user_id=request.user_id,
            run_id=run_id
        )
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))
