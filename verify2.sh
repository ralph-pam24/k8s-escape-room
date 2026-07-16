#!/bin/bash
LOG=$(kubectl -n engineering logs deploy/storage-door-controller --tail=20 2>/dev/null)
if echo "$LOG" | grep -q "Storage door unlocked with code: ENG-WING-OPEN"; then
  echo "🔓 Blueprint Cabinet opened. Facility Blueprint acquired."
  exit 0
fi
echo "❌ Controller still missing its instructions. Verify the ConfigMap name and BLUEPRINT_CODE=ENG-WING-OPEN."
exit 1
