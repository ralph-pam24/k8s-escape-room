# 🔐 Room 4 — Security Vault (Secret)

Return to your **browser game** for the story. This panel lists the cluster resources for this room.

## 📦 Resources in play

| Kind | Namespace | Name |
|------|-----------|------|
| Namespace | — | `security` |
| Deployment | `security` | `vault-client` |
| Secret | `security` | `vault-credentials` |

The `vault-client` pod cannot start. Investigate the pod, get it into a stable Running state, then follow the instructions it prints.

## ✅ Verification command

Once the pod is Running, follow the instructions in the pod logs to open the vault:

```bash
kubectl -n security logs deploy/vault-client --tail=20
```{{exec}}

After opening the vault and receiving the badge, click **CHECK**.