#!/bin/bash

echo "" >> alice_output.txt
echo "=== Alice Session 2 (New Session) ===" >> alice_output.txt
echo "" >> alice_output.txt

echo "User: What do you remember about me?" >> alice_output.txt
response=$(curl -s -X POST http://127.0.0.1:9090/invocation \
  -H "Content-Type: application/json" \
  -d '{"user_id": "alice_user", "run_id": "alice-session-2", "query": "What do you remember about me?"}' \
  | python3 -c "import sys,json; print(json.load(sys.stdin)['response'])")
echo "Agent: $response" >> alice_output.txt
echo "" >> alice_output.txt

echo "User: What project am I working on?" >> alice_output.txt
response=$(curl -s -X POST http://127.0.0.1:9090/invocation \
  -H "Content-Type: application/json" \
  -d '{"user_id": "alice_user", "run_id": "alice-session-2", "query": "What project am I working on?"}' \
  | python3 -c "import sys,json; print(json.load(sys.stdin)['response'])")
echo "Agent: $response" >> alice_output.txt
echo "" >> alice_output.txt
