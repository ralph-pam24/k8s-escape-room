# 🛎️ Room 1 — Reception Desk (Service)

Return to your **browser game** for the story. This panel lists the cluster resources for this room.

## 📦 Resources in play

| Kind | Namespace | Name |
|------|-----------|------|
| Namespace | — | `reception` |
| Deployment | `reception` | `reception-app` |
| Pod | `reception` | `visitor` |
| Service | `reception` | `reception-desk` |

The application pods are running, but the `visitor` pod cannot reach the reception service. Investigate why traffic is not being delivered and restore access.

## ✅ Verification command

```bash
kubectl -n reception exec visitor -- curl -s reception-desk
```{{exec}}

If you reach the application and see the **success message**, click **CHECK**.