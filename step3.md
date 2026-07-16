# 📦 Room 3 — Archive Warehouse (PVC)

The Facility Blueprint marks a location: **Archive Warehouse - Storage
Expansion Area**. You arrive to find towering shelves packed floor to
ceiling. Boxes spill into the aisles. New records can't be filed —
everything has stopped.

An **Expansion Plan** is rumored to be hidden somewhere in the warehouse.

## 📖 Story

The archive writer keeps trying to store records but crashes with:

> `No space left on device`

## 🧩 The Problem

- Deployment `archive-writer` runs in namespace `archive` ✅
- It writes to a PVC called `archive-rack` ✅
- The PVC is only **50Mi** — full within seconds ❌

Expand the PVC so writes succeed again.

## 🔍 Investigate

```
kubectl -n archive get pvc
kubectl -n archive logs deploy/archive-writer --tail=10
kubectl get sc
```

## 🎯 Objective

Expand `archive-rack` to at least **500Mi** and confirm the writer is
successfully storing records again:

```
kubectl -n archive logs deploy/archive-writer --tail=5
# expected:
# [OK] Stored record N
```

> 💡 **Hint:** Patch the PVC:
> ```
> kubectl -n archive patch pvc archive-rack \
>   -p '{"spec":{"resources":{"requests":{"storage":"500Mi"}}}}'
> ```
> Then restart the pod so it picks up the new size:
> ```
> kubectl -n archive rollout restart deploy/archive-writer
> ```

Click **CHECK** to expand the shelves.
