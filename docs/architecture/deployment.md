# Deployment ACPS — Auto-pull (pola kurivox)

Dokumen ini menjelaskan cara ACPS di-deploy, terutama mode **auto-pull otomatis** yang meniru pola repo `k-retek/kurivox-admin`.

## Ringkasan dua mode

| Mode | Kapan | Cara |
|---|---|---|
| Manual | Sesekali / dev | `npm run build` → upload isi `dist/` ke web root |
| Otomatis | Setiap push ke `main` | GitHub Actions SSH ke server → jalankan `deploy.sh` |

## Arsitektur auto-deploy

```
push ke branch "main"
      │
      ▼
GitHub Actions  .github/workflows/deploy-production.yml
      │  • siapkan SSH key  (secret: ACPS_SSH_KEY_B64)
      │  • ssh ACPS_DEPLOY_USER@ACPS_DEPLOY_HOST <path>/deploy.sh
      ▼
deploy.sh  (DI SERVER — template ada di deploy/deploy.sh)
      │  git pull (hard reset ke origin/main)
      │  npm ci
      │  npm run build        → dist/
      ▼
rsync dist/ → web root (mis. /var/www/acps.my.id/html)
```

Pembagian peran (sama seperti kurivox):
- **Workflow `.github/workflows/*.yml`** — versi di repo; fungsinya pemicu + SSH. Kurivox memicu push ke branch `production`; ACPS memicu push ke **`main`**.
- **`deploy.sh`** — di server, tidak ikut dieksekusi dari repo; yang melakukan auto-pull & build. Di kurivox skrip ini **tidak** disimpan di repo (hanya ada di server). Di ACPS disediakan **template** `deploy/deploy.sh` untuk disalin ke server agar Anda tidak perlu menulis dari nol.

## File terkait

| File | Peran |
|---|---|
| `.github/workflows/deploy-production.yml` | Workflow auto-deploy (pemicu push `main` → SSH + deploy.sh) |
| `deploy/deploy.sh` | Template skrip server-side (git pull + build + rsync) |
| `deploy/README.md` | Panduan setup server + secret GitHub |

## Secret GitHub yang wajib diisi

| Secret | Isi |
|---|---|
| `ACPS_SSH_KEY_B64` | Private key SSH (OpenSSH) yang public key-nya terdaftar di `authorized_keys` server; di-encode base64 (`base64 -w0 id_ed25519`) |
| `ACPS_DEPLOY_USER` | User SSH server |
| `ACPS_DEPLOY_HOST` | Host / IP server |

> Nama secret adalah padanan ACPS dari `KURIVOX_SSH_KEY_B64` / `KURIVOX_USER` / `KURIVOX_HOST` milik kurivox. Bila ingin persis sama pola kurivox, ganti nama `ACPS_*` pada workflow.

## Persiapan server (sekali)

Ikuti langkah di `deploy/README.md` — ringkasnya:
1. Clone repo ke `~/services/acps-web`.
2. Salin `deploy/deploy.sh` menjadi `./deploy.sh`, `chmod +x`.
3. Sesuaikan `WEB_ROOT` / path di `deploy.sh`.
4. Uji manual `./deploy.sh` sampai sukses.
5. Pasang secret GitHub sesuai tabel di atas.

## Catatan
- `deploy.sh` memakai `git checkout -B main origin/main` (hard reset) sehingga web root selalu identik dengan remote — aman untuk static site karena `node_modules/`, `dist/`, `.astro/` di-gitignore.
- Workflow hanya **menyiapkan file & skrip**; eksekusi & akses ke server dilakukan/ dimiliki oleh pemilik server.
