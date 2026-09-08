#!/bin/bash
set -e

INSTANCE_ID="i-04633b12ae8be26b1"

CMD_ID=$(aws ssm send-command \
  --instance-ids "$INSTANCE_ID" \
  --document-name "AWS-RunShellScript" \
  --parameters file://params.json \
  --query "Command.CommandId" --output text)

echo "Command ID: $CMD_ID"
sleep 25

aws ssm get-command-invocation \
  --command-id "$CMD_ID" \
  --instance-id "$INSTANCE_ID" \
  --query "{Status:Status,Output:StandardOutputContent,Error:StandardErrorContent}"
