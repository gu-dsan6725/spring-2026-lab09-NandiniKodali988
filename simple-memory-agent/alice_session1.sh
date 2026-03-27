#!/bin/bash

echo "=== Alice Session 1 ===" > alice_output.txt
echo "" >> alice_output.txt

echo "User: Hi, I'm Alice. I'm a software engineer." >> alice_output.txt
response=$(curl -s -X POST http://127.0.0.1:9090/invocation \
  -H "Content-Type: application/json" \
  -d '{"user_id": "alice_user", "run_id": "alice-session-1", "query": "Hi, I'\''m Alice. I'\''m a software engineer."}' \
  | python3 -c "import sys,json; print(json.load(sys.stdin)['response'])")
echo "Agent: $response" >> alice_output.txt
echo "" >> alice_output.txt

echo "User: I prefer Python for development." >> alice_output.txt
response=$(curl -s -X POST http://127.0.0.1:9090/invocation \
  -H "Content-Type: application/json" \
  -d '{"user_id": "alice_user", "run_id": "alice-session-1", "query": "I prefer Python for development."}' \
  | python3 -c "import sys,json; print(json.load(sys.stdin)['response'])")
echo "Agent: $response" >> alice_output.txt
echo "" >> alice_output.txt

echo "User: What programming languages do I like?" >> alice_output.txt
response=$(curl -s -X POST http://127.0.0.1:9090/invocation \
  -H "Content-Type: application/json" \
  -d '{"user_id": "alice_user", "run_id": "alice-session-1", "query": "What programming languages do I like?"}' \
  | python3 -c "import sys,json; print(json.load(sys.stdin)['response'])")
echo "Agent: $response" >> alice_output.txt
echo "" >> alice_output.txt

echo "User: I'm working on a FastAPI project." >> alice_output.txt
response=$(curl -s -X POST http://127.0.0.1:9090/invocation \
  -H "Content-Type: application/json" \
  -d '{"user_id": "alice_user", "run_id": "alice-session-1", "query": "I'\''m working on a FastAPI project."}' \
  | python3 -c "import sys,json; print(json.load(sys.stdin)['response'])")
echo "Agent: $response" >> alice_output.txt
echo "" >> alice_output.txt

echo "User: What have we discussed so far?" >> alice_output.txt
response=$(curl -s -X POST http://127.0.0.1:9090/invocation \
  -H "Content-Type: application/json" \
  -d '{"user_id": "alice_user", "run_id": "alice-session-1", "query": "What have we discussed so far?"}' \
  | python3 -c "import sys,json; print(json.load(sys.stdin)['response'])")
echo "Agent: $response" >> alice_output.txt
echo "" >> alice_output.txt

echo "Waiting 30s for Mem0 to process memories before Session 2..."
sleep 30
