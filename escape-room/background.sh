#!/bin/bash
# =====================================================================
# background.sh - prepares cluster + deploys ONLY Room 1.
# Subsequent rooms are deployed by their verifier scripts as the
# player progresses.
# =====================================================================
exec > /var/log/background.log 2>&1
set -x
echo "[$(date)] background.sh starting"

# Wait for cluster ready
for i in {1..60}; do
  if kubectl get nodes 2>/dev/null | grep -q " Ready"; then
    break
  fi
  sleep 3
done

BASE=https://raw.githubusercontent.com/ralph-pam24/k8s-escape-room/main/escape-room/assets/manifests

# Install Calico (needed for Room 5's NetworkPolicy). Doing it now so
# the CNI has time to stabilize by the time Room 5 arrives.
kubectl apply -f https://raw.githubusercontent.com/projectcalico/calico/v3.27.0/manifests/calico.yaml || true

# Deploy ONLY Room 1
kubectl apply -f $BASE/scenario-1-service.yaml

cat >> /root/.bashrc <<'EOF'
alias k=kubectl
export do="--dry-run=client -o yaml"
EOF

echo "[$(date)] background.sh done"
echo "done" > /opt/.escape-room-ready