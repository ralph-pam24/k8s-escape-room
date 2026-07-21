# 📦 Room 3 — Storage Rack (PVC)

Return to your **browser game** for the story. This panel lists the cluster resources for this room.

## 📦 Resources in play

| Kind | Namespace | Name |
|------|-----------|------|
| Namespace | — | `archive` |
| StorageClass | — | `expandable-storage` |
| PersistentVolumeClaim | `archive` | `archive-rack` |
| Deployment | `archive` | `archive-writer` |

The archive-writer workload is unstable and repeatedly restarting.
Investigate the application and restore archive operations.

## ✅ Verification command

Once the pod is stable, run:

```bash
kubectl -n archive exec deploy/archive-writer -- cat /data/expansion-plan.txt
```{{exec}}

If the file shows the **success message**, click **CHECK**.