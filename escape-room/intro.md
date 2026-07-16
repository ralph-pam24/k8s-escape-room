# 🔒 Kubernetes Escape Room: The Locked Facility

You wake up inside a mysterious facility known as **The Kubernetes Escape Complex**.

A voice echoes through the intercom:

> *"The exit door is locked. Five critical systems have failed throughout the facility.
> To escape, you must restore each system and recover the hidden objects that will
> grant access to the next area.
> Every object represents a component of the facility — and a component of Kubernetes.
> Solve all five challenges and the final exit door will unlock."*

---

## 🗺️ Facility Map

| # | Room | Hidden Object | Kubernetes Resource |
|---|------|---------------|---------------------|
| 1 | Reception Desk | Reception Access Card | **Service** |
| 2 | Blueprint Cabinet | Facility Blueprint | **ConfigMap** |
| 3 | Archive Warehouse | Storage Expansion Plan | **PVC** |
| 4 | Security Vault | Level 5 Security Badge | **Secret** |
| 5 | Security Gate | Exit Door Activation | **NetworkPolicy** |

---

## ⏱️ Rules

- **Time limit:** 20 minutes
- **Players:** Solo
- Fix each broken resource in order.
- Each step has an automated verifier — solve it and the door opens to the next room.

The cluster is being prepared now. When it's ready, click **START** to enter Room 1.
