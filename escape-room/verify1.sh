#!/bin/bash
# Room 1 - Reception Desk (Service)
# On success, deploys Room 2 resources so the next step is ready.

OUT=$(kubectl -n reception exec visitor -- curl -s --max-time 5 reception-desk 2>/dev/null)

if echo "$OUT" | grep -qi "RECEPTION-OPEN-42"; then
  # Deploy Room 2 in the background
  BASE=https://raw.githubusercontent.com/ralph-pam24/k8s-escape-room/main/escape-room/assets/manifests
  kubectl apply -f $BASE/scenario-2-configmap.yaml >/dev/null 2>&1

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