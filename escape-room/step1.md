# 🛎️ Room 1 — Reception Desk (Service)

Return to your **browser game** for the story. This panel lists the cluster resources and the verification command.

---

## 📦 Resources in play

| Kind | Namespace | Name |
|------|-----------|------|
| Namespace | — | `reception` |
| Deployment | `reception` | `reception-app` |
| Pod | `reception` | `visitor` |
| Service | `reception` | `reception-desk` |

---

## ✅ Verification command
kubectl -n reception exec visitor -- curl -s reception-desk

If you reach the application and see a **Welcome** message, click **CHECK** to verify.