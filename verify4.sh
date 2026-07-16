#!/bin/bash
LOG=$(kubectl -n security logs deploy/vault-client --tail=15 2>/dev/null)
if echo "$LOG" | grep -q "Vault opened. Level 5 Security Badge released."; then
  echo "🔓 Vault opened. Level 5 Security Badge in hand."
  exit 0
fi
echo "❌ Authentication still failing. Update the Secret password to 'level5-badge' and restart the client."
exit 1
