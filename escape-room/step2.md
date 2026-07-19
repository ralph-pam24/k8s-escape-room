# 📐 Room 2 — Blueprint Cabinet (ConfigMap)

Return to your **browser game** for the story. This panel lists the cluster resources for this room.

## 📦 Resources in play

| Kind | Namespace | Name |
|------|-----------|------|
| Namespace | — | `engineering` |
| Deployment | `engineering` | `storage-door-controller` |
| ConfigMap | `engineering` | `facility-blueprint` |

## 🔍 Where to start

Check the controller's logs — it will tell you exactly what it needs:

```bash
kubectl -n engineering logs deploy/storage-door-controller --tail=10
```{{exec}}

## ✅ Verification command

Once you've fixed the ConfigMap, run:

```bash
kubectl -n engineering logs deploy/storage-door-controller --tail=25
```{{exec}}

If the logs show the **success message**, click **CHECK**.