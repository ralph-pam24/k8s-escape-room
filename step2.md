# 📐 Room 2 — Blueprint Cabinet (ConfigMap)

The Reception Access Card slides into the reader and the **Engineering
Wing** door hisses open. Inside: workstations covered with technical
manuals, wiring diagrams, and a large machine that controls the
facility's storage doors.

The machine has power. But its display keeps flashing:

> `[ERROR] Missing operating instructions. Door stays closed.`

A **Blueprint Cabinet** in the corner should hold the missing instructions.

## 📖 Story

The storage-door controller runs, but its configuration is incomplete.
Without the correct blueprint code, it refuses to operate.

## 🧩 The Problem

- Deployment `storage-door-controller` is running in namespace `engineering` ✅
- The pod expects to load config from a ConfigMap named **`facility-blueprint`** ❌
- The ConfigMap in the cluster has a different name **and** is missing a key.

The controller needs a key called **`BLUEPRINT_CODE`** with value **`ENG-WING-OPEN`**.

## 🔍 Investigate

```
kubectl -n engineering get cm
kubectl -n engineering describe deploy storage-door-controller
kubectl -n engineering logs deploy/storage-door-controller --tail=5
```

## 🎯 Objective

Make the pod's logs show:

```
[OK] Storage door unlocked with code: ENG-WING-OPEN
```

> 💡 **Hint:** You can either:
> - Rename/recreate the ConfigMap to match what the Deployment expects, **or**
> - Edit the Deployment to point to the existing ConfigMap.
> Either way — the key `BLUEPRINT_CODE=ENG-WING-OPEN` must exist.

After changes, force a fresh pod:

```
kubectl -n engineering rollout restart deploy/storage-door-controller
```

Click **CHECK** when the blueprint is in your hands.
