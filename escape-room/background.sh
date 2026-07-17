#!/bin/bash
# =====================================================================
# background.sh - deploys the broken state for all 5 rooms.
# Pulls manifests from GitHub raw so no local file copy is needed.
# =====================================================================
exec > /var/log/background.log 2>&1
set -x
echo "[$(date)] background.sh starting"

# Wait for cluster to be ready
for i in {1..60}; do
  if kubectl get nodes 2>/dev/null | grep -q " Ready"; then
    break
  fi
  sleep 3
done

BASE=https://raw.githubusercontent.com/ralph-pam24/k8s-escape-room/main/escape-room/assets/manifests

# Install Calico so NetworkPolicies are enforced (Scenario 5)
kubectl apply -f https://raw.githubusercontent.com/projectcalico/calico/v3.27.0/manifests/calico.yaml || true

# Apply all 5 broken scenarios
kubectl apply -f $BASE/scenario-1-service.yaml
kubectl apply -f $BASE/scenario-2-configmap.yaml
kubectl apply -f $BASE/scenario-3-pvc.yaml
kubectl apply -f $BASE/scenario-4-secret.yaml
kubectl apply -f $BASE/scenario-5-networkpolicy.yaml

cat >> /root/.bashrc <<'EOF'
alias k=kubectl
export do="--dry-run=client -o yaml"
EOF

echo "[$(date)] background.sh done"
echo "done" > /opt/.escape-room-ready