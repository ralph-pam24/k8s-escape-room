#!/bin/bash
# =====================================================================
# background.sh - runs BEFORE the player sees Step 1.
# Deploys the broken state for all 5 scenarios.
# =====================================================================
set -e

until kubectl get nodes 2>/dev/null | grep -q " Ready"; do
  sleep 2
done

MANIFESTS=/opt/escape-room
mkdir -p "$MANIFESTS"
cp /root/assets/manifests/*.yaml "$MANIFESTS/" 2>/dev/null || true

# Install Calico so NetworkPolicies are enforced (Scenario 5)
if ! kubectl get pods -n kube-system 2>/dev/null | grep -q calico; then
  kubectl apply -f https://raw.githubusercontent.com/projectcalico/calico/v3.27.0/manifests/calico.yaml >/dev/null 2>&1 || true
fi

kubectl apply -f "$MANIFESTS/scenario-1-service.yaml"
kubectl apply -f "$MANIFESTS/scenario-2-configmap.yaml"
kubectl apply -f "$MANIFESTS/scenario-3-pvc.yaml"
kubectl apply -f "$MANIFESTS/scenario-4-secret.yaml"
kubectl apply -f "$MANIFESTS/scenario-5-networkpolicy.yaml"

cat >> /root/.bashrc <<'EOF'
alias k=kubectl
export do="--dry-run=client -o yaml"
EOF

echo "done" > /opt/.escape-room-ready
