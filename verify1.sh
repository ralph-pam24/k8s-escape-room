#!/bin/bash
OUT=$(kubectl -n reception exec visitor -- curl -s --max-time 3 reception-desk 2>/dev/null)
if echo "$OUT" | grep -q "Access Card Dispenser: UNLOCKED"; then
  echo "🔓 Drawer unlocked. You picked up the Reception Access Card."
  exit 0
fi
echo "❌ The visitor still can't reach the correct department. Check the Service selector."
exit 1
