#!/bin/bash
LOG=$(kubectl -n exit logs deploy/control-panel --tail=15 2>/dev/null)
if echo "$LOG" | grep -q "ALL FACILITY SYSTEMS RESTORED"; then
  echo "🚪 THE FINAL EXIT DOOR IS OPEN. YOU HAVE ESCAPED THE FACILITY!"
  exit 0
fi
echo "❌ Control panel still can't reach the exit door. Fix the NetworkPolicy ingress rule."
exit 1
