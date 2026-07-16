#!/bin/bash
SIZE=$(kubectl -n archive get pvc archive-rack -o jsonpath='{.status.capacity.storage}' 2>/dev/null)
LOG=$(kubectl -n archive logs deploy/archive-writer --tail=10 2>/dev/null)
NUM=$(echo "$SIZE" | grep -oE '[0-9]+')
UNIT=$(echo "$SIZE" | grep -oE '[A-Za-z]+')
case "$UNIT" in
  Gi) MI=$((NUM*1024)) ;;
  Mi) MI=$NUM ;;
  *)  MI=0 ;;
esac
if [ "$MI" -ge 500 ] && echo "$LOG" | grep -q "\[OK\] Stored record"; then
  echo "🔓 Storage racks expanded. Security Office access records recovered."
  exit 0
fi
echo "❌ Storage not yet expanded ($SIZE) or writer still failing. Patch the PVC and restart the deployment."
exit 1
