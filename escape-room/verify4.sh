#!/bin/bash
# Room 4 - Security Vault (Secret)
# Verifier passes when the pod logs contain the code word,
# which is only printed after /vault/open succeeds with correct creds.

for i in 1 2 3; do
  LOG=$(kubectl -n security logs deploy/vault-client --tail=60 2>/dev/null)
  if echo "$LOG" | grep -qi "LEVEL5-GRANTED-XR"; then
    BASE=https://raw.githubusercontent.com/ralph-pam24/k8s-escape-room/main/escape-room/assets/manifests
    kubectl apply -f $BASE/scenario-5-networkpolicy.yaml >/dev/null 2>&1
    echo "✅ Room 4 solved. Room 5 is ready — click Next Step."
    exit 0
  fi
  sleep 2
done

echo "❌ Vault still sealed. Fix the Secret mount, then open the vault as instructed by the pod logs."
exit 1