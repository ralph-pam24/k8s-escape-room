#!/bin/bash
# Room 2 - Blueprint Cabinet (ConfigMap)
# Verifies by checking pod logs for the code word.
# On success, deploys Room 3.

for i in 1 2 3; do
  LOG=$(kubectl -n engineering logs deploy/storage-door-controller --tail=40 2>/dev/null)
  if echo "$LOG" | grep -qi "BLUEPRINT-B7-DELTA"; then
    BASE=https://raw.githubusercontent.com/ralph-pam24/k8s-escape-room/main/escape-room/assets/manifests
    kubectl apply -f $BASE/scenario-3-pvc.yaml >/dev/null 2>&1
    echo "✅ Room 2 solved. Room 3 is ready — click Next Step."
    exit 0
  fi
  sleep 2
done

echo "❌ Blueprint Cabinet still locked. Check the pod logs and add the missing ConfigMap key."
exit 1