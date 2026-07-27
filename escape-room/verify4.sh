#!/bin/bash
# Room 4 - Security Vault (Secret)
# The reward is delivered via `/vault/open <user> <pass>`, not pod logs.
# This verifier confirms the fix by:
#   1. Reading the expected creds from the vault-credentials Secret
#   2. Running /vault/open inside the pod with those creds
#   3. Checking the output contains the code word
# This only succeeds if the player fixed the Secret mount (pod Running)
# AND the vault-credentials Secret exists with the right values.

for i in 1 2 3; do
  # Pod must be Running (Secret mount fixed) before exec works
  U=$(kubectl -n security get secret vault-credentials -o jsonpath='{.data.username}' 2>/dev/null | base64 -d 2>/dev/null)
  P=$(kubectl -n security get secret vault-credentials -o jsonpath='{.data.password}' 2>/dev/null | base64 -d 2>/dev/null)

  if [ -n "$U" ] && [ -n "$P" ]; then
    OUT=$(kubectl -n security exec deploy/vault-client -- /vault/open "$U" "$P" 2>/dev/null)
    if echo "$OUT" | grep -qi "LEVEL5-GRANTED-XR"; then
      BASE=https://raw.githubusercontent.com/ralph-pam24/k8s-escape-room/main/escape-room/assets/manifests
      kubectl apply -f $BASE/scenario-5-networkpolicy.yaml >/dev/null 2>&1
      echo "Room 4 solved. Room 5 is ready - click Next Step."
      exit 0
    fi
  fi
  sleep 3
done

echo "Vault still sealed. Fix the Secret mount so the pod runs, then open the vault as instructed by the pod logs."
exit 1