# 🛎️ Room 1 — Reception Desk (Service)

Return to your **browser game** for the story. This panel lists the cluster resources for this room.

## 📦 Resources in play

| Kind | Namespace | Name |
|------|-----------|------|
| Namespace | — | `reception` |
| Deployment | `reception` | `reception-app` |
| Pod | `reception` | `visitor` |
| Service | `reception` | `reception-desk` |

## ✅ Verification command

Click the command to run it in the terminal:

```bash
kubectl -n reception exec visitor -- curl -s reception-desk
```{{exec}}

