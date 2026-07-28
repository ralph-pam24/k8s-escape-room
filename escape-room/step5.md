# 🚪 Room 5 — Security Gate Control Panel (NetworkPolicy)

Return to your **browser game** for the story. This panel lists the cluster resources for this room.

## 📦 Resources in play

| Kind | Namespace | Name |
|------|-----------|------|
| Namespace | — | `exit` |
| Deployment | `exit` | `exit-door` |
| Service | `exit` | `exit-door` |
| Deployment | `exit` | `control-panel` |
| NetworkPolicy | `exit` | `exit-door-lockdown` |

The `control-panel` pod cannot reach the `exit-door` controller.

The applications are healthy and the Service is correct, but traffic between the two pods is being blocked. Investigate what is blocking communication and restore the connection.

## ✅ Verification command

```bash
kubectl -n exit logs deploy/control-panel --tail=35
```{{exec}}

If the logs show a **connection established** message and the code word, click **CHECK**.