# 🔐 Room 4 — Security Vault (Secret)

Newly accessible archives point to the **Security Office**. Behind
movable shelves you find a heavy **Security Vault**. It stores the
credentials needed to activate the next layer of security.

The vault exists — but the credentials inside are wrong.

## 📖 Story

The `vault-client` pod reads a password from a mounted Secret and
compares it with the token returned by the `auth-service`.
Right now, authentication is failing.

## 🧩 The Problem

- Storage works ✅
- Configuration is correct ✅
- Authentication to the backend **fails** ❌

The `vault-credentials` Secret currently holds the password **`guest`**,
but `auth-service` expects **`level5-badge`**.

## 🔍 Investigate

```
kubectl -n security get secret vault-credentials -o yaml
kubectl -n security logs deploy/vault-client --tail=5
kubectl -n security exec deploy/vault-client -- cat /etc/vault/password
```

## 🎯 Objective

Update the Secret so the client logs show:

```
[OK] Vault opened. Level 5 Security Badge released.
```

> 💡 **Hint:** Recreate the Secret with the correct password:
> ```
> kubectl -n security delete secret vault-credentials
> kubectl -n security create secret generic vault-credentials \
>   --from-literal=username=admin \
>   --from-literal=password=level5-badge
> kubectl -n security rollout restart deploy/vault-client
> ```

Click **CHECK** to open the vault.
