# Deployment ACPS — Auto-pull via Cloudflare Tunnel SSH

Dokumen ini menjelaskan cara ACPS di-deploy, terutama mode **auto-pull otomatis** yang memicu `deploy.sh` di server.

## Ringkasan dua mode

| Mode | Kapan | Cara |
|---|---|---|
| Manual | Sesekali / dev | `npm run build` → rsync isi `dist/` ke web root (lihat `deploy.sh`) |
| Otomatis | Setiap push ke `main` | GitHub Actions SSH lewat **Cloudflare Tunnel** → jalankan `deploy.sh` |

## Arsitektur auto-deploy

Server ACPS **tidak membuka port 22** ke internet. SSH dari GitHub Actions masuk lewat **Cloudflare Tunnel**:

```
push ke branch "main"
      │
      ▼
GitHub Actions  .github/workflows/deploy-production.yml
      │  • install cloudflared
      │  • siapkan SSH key (secret ACPS_SSH_KEY_B64)
      │  • ssh via ProxyCommand="cloudflared access ssh --hostname deploy.acps.my.id"
      ▼
Cloudflare Tunnel (acps-tunnel)
      │  deploy.acps.my.id → ssh://localhost:22   (ingress config.yml)
      ▼
deploy.sh  (DI SERVER)
      │  git pull (hard reset ke origin/main)
      │  npm ci
      │  npm run build        → dist/
      ▼
sudo rsync dist/ → web root (/var/www/acps)
```

### Kenapa hostname `deploy.acps.my.id` (bukan `ssh.acps.my.id`)
- `ssh.acps.my.id` dipakai manusia dan dilindungi **Cloudflare Access** (login browser) — GitHub Actions headless tidak bisa lewat.
- `deploy.acps.my.id` khusus CI, **tanpa** Access policy — autentikasi hanya **SSH key ed25519** (secret `ACPS_SSH_KEY_B64`). Tidak ada port publik yang terbuka; hanya Cloudflare yang tahu IP server.

## Secret GitHub yang wajib diisi

| Secret | Isi |
|---|---|
| `ACPS_SSH_KEY_B64` | Private key SSH (OpenSSH, `id_ed25519`) yang public key-nya di `~/.ssh/authorized_keys` server (komentar `acps-deploy-ci`); di-encode base64 (`base64 -w0 id_ed25519`) |
| `ACPS_DEPLOY_USER` | User SSH server (contoh: `gynkoz`) |
| `ACPS_DEPLOY_HOST` | **Tidak wajib** lagi — workflow memakai hostname tetap `deploy.acps.my.id` |

## Persiapan server (sekali)

1. Tambah ingress di `/etc/cloudflared/config.yml` (SEBELUM catch-all 404):
   ```yaml
   - hostname: deploy.acps.my.id
     service: ssh://localhost:22
   ```
2. Route DNS: `sudo cloudflared tunnel route dns acps-tunnel deploy.acps.my.id`
3. Restart: `sudo systemctl restart cloudflared` (tunggu sampai `active`; bisa 30–60s)
4. Repo di `~/acps-project` (diakses via symlink `~/services/acps-web`), `deploy.sh` live di root repo (untracked, aman dari hard-reset).
5. Pasang public key CI ke `~/.ssh/authorized_keys`.
6. Test manual: `cloudflared access ssh --hostname deploy.acps.my.id` (ProxyCommand) → harus connect tanpa prompt Access.

## File terkait

| File | Peran |
|---|---|
| `.github/workflows/deploy-production.yml` | Workflow auto-deploy (install cloudflared → ssh via tunnel → deploy.sh) |
| `deploy/deploy.sh` | Template skrip server-side (git pull + build + rsync) |
| `deploy.sh` (server, untracked) | Versi live deploy.sh, path disesuaikan utk server ini |

## Catatan
- `deploy.sh` memakai `git checkout -B main origin/main` (hard reset) sehingga web root identik remote — aman utk static site (`node_modules/`, `dist/`, `.astro/` di-gitignore).
- **Pitfall:** IP publik server dinamis & port 22 tidak di-forward → SSH langsung ke IP **pasti gagal** (timeout). Wajib lewat tunnel. Menambahkan secret `ACPS_DEPLOY_HOST` tidak membantu karena masalahnya port tertutup, bukan host.
- `deploy.sh` memakai `sudo rsync` (web root dimiliki www-data); pastikan user deploy punya sudo NOPASSWD.

