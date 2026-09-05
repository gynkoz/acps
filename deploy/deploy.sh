#!/usr/bin/env bash
# deploy.sh — ACPS: auto-pull + build statis (dijalankan oleh GitHub Actions via SSH)
#
# Skrip ini dijalankan DI SERVER oleh workflow .github/workflows/deploy-production.yml
# setiap ada push ke branch "main". Ia bertugas:
#   1. menarik perubahan terbaru dari repo
#   2. membangun ulang situs statis (Astro -> dist/)
#   3. mensinkronkan hasil build ke web root (acps.my.id)
#
# CARA PAKAI:
#  1. Clone repo ke server, mis. di ~/services/acps-web
#  2. Salin skrip ini ke ~/services/acps-web/deploy.sh
#  3. chmod +x ~/services/acps-web/deploy.sh
#  4. Sesuaikan 3 variabel di bawah, lalu set secret GitHub (lihat catatan bawah)
#  5. Jalankan skrip sekali manual untuk memastikan berjalan:  ./deploy.sh
#
# Jika mengikuti konvensi kurivox (workflow sudah menyebut path tetap), pastikan
# path pada workflow sama dengan lokasi deploy.sh di server.

set -euo pipefail

# ============ KONFIGURASI (sesuaikan dengan server Anda) ============
APP_DIR="/home/$USER/services/acps-web"     # folder repo di server
WEB_ROOT="/var/www/acps.my.id/html"          # root web yang menyajikan isi dist/
GIT_BRANCH="main"                            # branch sumber produksi
# ====================================================================

echo "==> Deploy ACPS dimulai: $(date -Is)"

cd "$APP_DIR"

echo "==> Mengambil perubahan terbaru dari branch '$GIT_BRANCH'"
# Hard reset agar web root selalu identik dengan repo remote (aman utk static site)
git fetch --prune origin "$GIT_BRANCH"
git checkout -B "$GIT_BRANCH" "origin/$GIT_BRANCH"

echo "==> Memasang dependency (bila ada perubahan lockfile)"
# Memakai CI untuk produksi yang deterministik; hapus flag bila pakai devDeps build
npm ci

echo "==> Membangun situs statis"
npm run build

echo "==> Sinkronisasi dist/ -> $WEB_ROOT"
# rsync lebih disukai (hanya kirim file berubah); pastikan rsync terpasang di server
rsync -a --delete dist/ "$WEB_ROOT/"

echo "==> Deploy ACPS selesai: $(date -Is)"
