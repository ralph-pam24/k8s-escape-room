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

Once you've opened the vault, run:

```bash
kubectl -n security logs deploy/vault-client --tail=40
```{{exec}}

If the logs show the **success message with the code word**, click **CHECK**.