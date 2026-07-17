#!/bin/bash
# Room output contains the full success message + code word.
# Verifier just checks the code word is reachable, then deploys Room 2.

for i in 1 2 3; do
  OUT=$(kubectl -n reception exec visitor -- curl -s --max-time 8 reception-desk 2>/dev/null)
  if echo "$OUT" | grep -qi "RECEPTION-OPEN-42"; then
    BASE=https://raw.githubusercontent.com/ralph-pam24/k8s-escape-room/main/escape-room/assets/manifests
    kubectl apply -f $BASE/scenario-2-configmap.yaml >/dev/null 2>&1
    echo "✅ Room 1 solved. Room 2 is ready — click Next Step."
    exit 0
  fi
  sleep 2
done

echo "❌ Visitor cannot reach the Reception Desk yet. Fix the Service."
exit 1