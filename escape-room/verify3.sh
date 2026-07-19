#!/bin/bash
# Room 3 - Storage Rack Expansion Plan (PVC)
# Verifier passes when the reward file exists with the code word.
# On success, deploys Room 4.

for i in 1 2 3; do
  OUT=$(kubectl -n archive exec deploy/archive-writer -- cat /data/expansion-plan.txt 2>/dev/null)
  if echo "$OUT" | grep -qi "EXPANSION-9K-VAULT"; then
    BASE=https://raw.githubusercontent.com/ralph-pam24/k8s-escape-room/main/escape-room/assets/manifests
    kubectl apply -f $BASE/scenario-4-secret.yaml >/dev/null 2>&1
    echo "✅ Room 3 solved. Room 4 is ready — click Next Step."
    exit 0
  fi
  sleep 3
done

echo "❌ Storage rack still cannot fit the expansion plan. Investigate why the writer is failing."
exit 1