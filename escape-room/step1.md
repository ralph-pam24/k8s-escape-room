# 🛎️ Room 1 — Reception Desk (Service)

You push open a heavy door and enter a **cluttered office lobby**.
Computers hum, filing cabinets overflow with paperwork, and storage boxes
block the walkway. Somewhere in this mess is the **Reception Desk** —
and inside its drawer, the **Reception Access Card**.

## 📖 Story

The facility's visitor routing system has failed.
Employees are working in their offices, but visitors are being directed
to the wrong locations. Because nobody reaches the correct department,
the **Reception Access Card dispenser** cannot be accessed.

Restore the routing system to unlock the drawer.

## 🧩 The Problem

- Application pods are running ✅
- The `reception-desk` Service exists ✅
- But visitors (`visitor` pod) cannot reach the app ❌

The **Service is routing traffic incorrectly**.

## 🔍 Investigate

```
kubectl -n reception get pods --show-labels
kubectl -n reception get svc reception-desk -o yaml
kubectl -n reception exec visitor -- curl -s --max-time 3 reception-desk
```

## 🎯 Objective

Make this command return:

```
Welcome to the Reception Desk. Access Card Dispenser: UNLOCKED
```

```
kubectl -n reception exec visitor -- curl -s reception-desk
```

> 💡 **Hint:** A Service uses `.spec.selector` to find its backend pods.
> Compare the Service's selector with the actual pod labels.

Click **CHECK** when you think the drawer is unlocked.
