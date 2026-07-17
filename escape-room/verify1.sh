#!/bin/bash
# Room 1 - Reception Desk (Service)
# Verifies by running the same curl the player runs.
# The code word "RECEPTION-OPEN-42" only appears when the Service
# selector matches the reception-app Pod labels.

OUT=$(kubectl -n reception exec visitor -- curl -s --max-time 5 reception-desk 2>/dev/null)

if echo "$OUT" | grep -qi "RECEPTION-OPEN-42"; then
  cat <<'EOF'
✅ You've resolved the issue. The visitor can now reach the correct department.

In Kubernetes, a Service uses a label selector to forward traffic to
matching Pods. When the selector matches the Pod labels, traffic reaches
healthy backends and the application responds correctly.

Copy the CODE WORD from the curl output and paste it into the browser
game to unlock the next room.

Click "Next Step" below to enter Room 2.
EOF
  exit 0
fi

echo "❌ The visitor still cannot reach the Reception Desk."
echo "   Run:  kubectl -n reception exec visitor -- curl -s reception-desk"
echo "   Fix the Service so the response contains a Welcome message."
exit 1