#!/bin/bash
# Room 5 - Security Gate (NetworkPolicy)
# Passes when control-panel successfully reaches exit-door.
for i in 1 2 3; do
  LOG=$(kubectl -n exit logs deploy/control-panel --tail=40 2>/dev/null)
  if echo "$LOG" | grep -q "EXIT-UNLOCK-OMEGA"; then
    echo "You have escaped the facility. All rooms solved!"
    exit 0
  fi
  sleep 3
done
echo "The exit door is still unreachable. Fix the NetworkPolicy to allow control-panel to reach exit-door."
exit 1