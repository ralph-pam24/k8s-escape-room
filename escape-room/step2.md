# 📐 Room 2 — Blueprint Cabinet (ConfigMap)

Return to your **browser game** for the story. This panel lists the cluster resources for this room.

## 📦 Resources in play

| Kind | Namespace | Name |
|------|-----------|------|
| Namespace | — | `engineering` |
| Deployment | `engineering` | `storage-door-controller` |
| ConfigMap | `engineering` | `facility-blueprint` |

The storage-door controller pod is not healthy. Investigate the pod, identify the issue, and get it running.

## ✅ Verification command

```bash
kubectl -n engineering logs deploy/storage-door-controller --tail=25
```{{exec}}

If the logs show the **success message**, click **CHECK**.