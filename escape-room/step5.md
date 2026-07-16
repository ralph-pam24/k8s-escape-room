# 🚪 Room 5 — Security Gate Control Panel (NetworkPolicy)

You now carry the **Reception Access Card**, the **Facility Blueprint**,
the **Storage Expansion Records**, and the **Level 5 Security Badge**.

The final door awaits. In the restricted control room a large panel
blinks red. The `control-panel` pod is trying to talk to the
`exit-door` pod — but every request times out.

## 📖 Story

Both applications are healthy. Both Services exist. The problem is a
**NetworkPolicy** blocking pod-to-pod traffic.

## 🧩 The Problem

A NetworkPolicy called `exit-door-lockdown` in namespace `exit`
selects the `exit-door` pod and has an **empty ingress rule** — which
means *deny all*. The control panel can't reach it.

## 🔍 Investigate

```
kubectl -n exit get netpol
kubectl -n exit get netpol exit-door-lockdown -o yaml
kubectl -n exit logs deploy/control-panel --tail=5
```

## 🎯 Objective

Fix the NetworkPolicy so `control-panel` (label `app=control-panel`)
can reach `exit-door` (label `app=exit-door`) on TCP **5678**.

The control-panel logs should print:

```
[OK] ALL FACILITY SYSTEMS RESTORED - FINAL EXIT DOOR UNLOCKED
```

> 💡 **Hint:** Replace the NetworkPolicy with something like:
> ```yaml
> apiVersion: networking.k8s.io/v1
> kind: NetworkPolicy
> metadata:
>   name: exit-door-lockdown
>   namespace: exit
> spec:
>   podSelector:
>     matchLabels:
>       app: exit-door
>   policyTypes: [Ingress]
>   ingress:
>     - from:
>         - podSelector:
>             matchLabels:
>               app: control-panel
>       ports:
>         - protocol: TCP
>           port: 5678
> ```
>
> Apply with `kubectl apply -f <file>.yaml`.

Click **CHECK** to unlock the final door.
