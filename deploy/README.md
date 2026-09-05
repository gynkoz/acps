# Auto-deploy ACPS (pola kurivox)

ACPS memakai pola auto-deploy yang sama dengan repo `k-retek/kurivox-admin`:
sebuah **GitHub Actions workflow** memicu **`deploy.sh` di server** lewat SSH setiap ada push ke branch `main`. `deploy.sh` itulah yang melakukan auto-pull + build statis.

## Diagram

```
push ke branch "main"
      │
      ▼
GitHub Actions (.github/workflows/deploy-production.yml)
      │  siapkan SSH key (secret ACPS_SSH_KEY_B64)
      │  ssh user@host /path/deploy.sh
      ▼
deploy.sh DI SERVER
      │  git pull (hard reset ke origin/main)
      │  npm ci
      │  npm run build   -> dist/
      ▼
rsync dist/  ->  web root (acps.my.id)
```

Kode workflow versi di repo → pemicu + SSH.
Skrip `deploy.sh` versi di server → auto-pull & build (isi folder `deploy/` ini hanya **template** untuk disalin ke server).

## Persiapan sekali (di server)

```bash
# 1) Clone repo ke folder layanan
mkdir -p ~/services/acps-web && cd ~/services/acps-web
git clone https://github.com/gynkoz/acps.git .

# 2) Salin & beri izin skrip deploy
cp deploy/deploy.sh ./deploy.sh
chmod +x ./deploy.sh
nano deploy.sh   # sesuaikan: WEB_ROOT, pastikan APP_DIR benar, USER/GIT_BRANCH

# 3) Uji sekali manual (harus sukses)
./deploy.sh

# 4) Pastikan rsync terpasang (atau ganti langkah sinkronisasi)
which rsync || sudo apt install -y rsync
```

> Jika ssh ke server memakai user yang sama dengan `APP_DIR` (`~/$USER/services/acps-web`), baris ssh di workflow sudah cocok. Ubah path bila beda user.

## Secret GitHub (Settings → Secrets and variables → Actions)

| Secret | Isi |
|---|---|
| `ACPS_SSH_KEY_B64` | **Private key SSH** (OpenSSH, mis. `id_ed25519`) yang public key-nya sudah terdaftar di `~/.ssh/authorized_keys` server. Wajib di-encode base64: `base64 -w0 id_ed25519` lalu tempel. |
| `ACPS_DEPLOY_USER` | User SSH di server (contoh: `admin` atau `deploy`). |
| `ACPS_DEPLOY_HOST` | Host/IP server (contoh: `203.0.113.10`). |

> Jika mengikuti konvensi kurivox: nama secret ini menggantikan `KURIVOX_SSH_KEY_B64` / `KURIVOX_USER` / `KURIVOX_HOST`. Ganti nama-nama `ACPS_*` di workflow bila Anda lebih suka pola lain.

## Branch

Workflow memicu push ke **`main`**. Karena repo ini gitignored `node_modules/`, `dist/`, dan `.astro/`, menjalankan auto-pull di server hanya akan mengubah konten statis (aman, tidak menimpa hal lain).

## Referensi pola kurivox
- Workflow asal (private, k-retek): `.github/workflows/deploy-production.yml` — memicu push ke branch `production`, lalu ssh menjalankan `deploy.sh` server-side.
