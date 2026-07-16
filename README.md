# Kubernetes Escape Room — Killercoda Scenario

A 5-room interactive escape game that teaches Kubernetes troubleshooting:
**Service → ConfigMap → PVC → Secret → NetworkPolicy**.

## 📁 Repo Layout

```
k8s-escape-room/
├── index.json              # Killercoda scenario metadata
├── intro.md                # Story intro shown before Step 1
├── finish.md               # Victory screen after Step 5
├── background.sh           # Runs on the node BEFORE the player starts
├── step1.md ... step5.md   # One markdown per room (story + hints)
├── verify1.sh ... verify5.sh  # Auto-check scripts run when player clicks CHECK
└── assets/
    └── manifests/
        ├── scenario-1-service.yaml
        ├── scenario-2-configmap.yaml
        ├── scenario-3-pvc.yaml
        ├── scenario-4-secret.yaml
        └── scenario-5-networkpolicy.yaml
```

## 🚀 How to publish

1. Push this folder to your Killercoda GitHub repo.
2. In Killercoda Creator profile → Scenarios → connect the repo.
3. Save & preview. Killercoda reads `index.json` automatically.

## 🧠 Scenario design summary

| # | Room | Namespace | Bug | Fix |
|---|------|-----------|-----|-----|
| 1 | Reception Desk | `reception` | Service selector doesn't match pod labels | Set selector to `app: reception` |
| 2 | Blueprint Cabinet | `engineering` | ConfigMap wrong name & missing key | Provide `facility-blueprint` CM with `BLUEPRINT_CODE=ENG-WING-OPEN` |
| 3 | Archive Warehouse | `archive` | 50Mi PVC full | Patch PVC to ≥500Mi + restart pod |
| 4 | Security Vault | `security` | Secret password is `guest`, expected `level5-badge` | Recreate secret with correct password |
| 5 | Security Gate | `exit` | NetworkPolicy denies all ingress | Allow ingress from `app: control-panel` on TCP 5678 |
