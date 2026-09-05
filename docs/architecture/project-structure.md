# Architecture: Struktur Project ACPS

## Ringkasan
Project **Astro 5** (output statis). Struktur dirancang agar **bisa menampung banyak aplikasi** — setiap aplikasi = satu folder di `src/pages/`. Ada **design system futuristik** di `src/layouts/Layout.astro` (tema + i18n + animasi) yang dipakai semua halaman.

> ⚠️ Perubahan besar v2.0: migrasi dari HTML statis manual ke **Astro**. Sekarang butuh `npm install` + `npm run build`; hasil deploy ada di folder `dist/`.

## Diagram struktur
```
acps/
├── astro.config.mjs          ← konfigurasi Astro (output: static)
├── package.json              ← script: dev / build / preview
├── tsconfig.json
├── src/
│   ├── i18n.ts               ← kamus teks ID & EN (satu-satunya sumber terjemahan)
│   ├── layouts/
│   │   └── Layout.astro      ← design system: tema futuristik, i18n, animasi, kontrol
│   └── pages/
│       ├── index.astro       ← halaman utama (hub ACPS, daftar aplikasi)
│       └── kasirku/
│           ├── index.astro   ← landing KasirKu
│           ├── privacy.astro ← Kebijakan Privasi
│           └── terms.astro   ← Syarat & Ketentuan
├── docs/                     ← dokumentasi (lihat docs/README.md)
├── .github/workflows/        ← auto-deploy: deploy-production.yml (pola kurivox)
├── deploy/                   ← deploy.sh (template utk server) + README setup
├── .agents/skills/doc-flow/  ← workflow dokumentasi (wajib)
└── dist/                     ← hasil build (gitignored; ini yang di-upload ke hosting)
```

## Build & deploy
```bash
npm install
npm run build     # menghasilkan dist/
```
Upload **isi `dist/`** ke root web server (`public_html`/`/var/www/html`). Tidak ada runtime server — hasil akhirnya HTML+CSS+JS statis.

Ada dua cara deploy; detail lengkap di [docs/architecture/deployment.md](deployment.md) dan `deploy/README.md`:
1. **Manual**: build `npm run build`, lalu upload isi `dist/` ke web root.
2. **Otomatis (pola kurivox)**: `.github/workflows/deploy-production.yml` memicu push ke `main`, lalu SSH ke server menjalankan `deploy.sh` (git pull + `npm ci` + `npm run build` + rsync `dist/` ke web root). Secret GitHub: `ACPS_SSH_KEY_B64`, `ACPS_DEPLOY_USER`, `ACPS_DEPLOY_HOST`.

## URL hasil build (format directory)
| Halaman | URL |
|---|---|
| Home | `https://acps.my.id/` |
| KasirKu | `https://acps.my.id/kasirku/` |
| Privacy | `https://acps.my.id/kasirku/privacy/` |
| Terms | `https://acps.my.id/kasirku/terms/` |

> Catatan: privacy & terms kini berupa folder `index.html` (`/kasirku/privacy/`), bukan `privacy.html`. Untuk OAuth consent screen Google, isi URL tanpa trailing slash (`https://acps.my.id/kasirku/privacy`) — server akan menyajikan `privacy/index.html`.

## Fitur lintas-halaman (Layout.astro)
- **i18n**: default HTML = Bahasa Indonesia (SEO/crawler-friendly). Pengunjung non-Indonesia otomatis English (deteksi `navigator.language` + timezone). Toggle manual 🇬🇧/🇮🇩 di `localStorage['acps-lang']`.
- **Tema**: dark default futuristik + light, toggle 🌙/☀️ di `localStorage['acps-theme']`, fallback `prefers-color-scheme`. Anti-FOUC via inline script sebelum paint.
- **Animasi**: scroll reveal (IntersectionObserver + fallback langsung untuk elemen terlihat), tilt 3D kartu, glow kursor radial, aurora drift, grid perspektif bergerak, bintang twinkle, scan-line, page transition (View Transitions via `ClientRouter`), kontrol persist antar halaman (`data-astro-transition-persist`).
- **Aksesibilitas**: `prefers-reduced-motion` mematikan animasi; `<noscript>` memastikan konten tetap terlihat tanpa JS.

## Aturan penambahan aplikasi baru
1. Buat folder di `src/pages/<nama>/` dengan `index.astro` (+ halaman legal bila perlu), import `Layout` dari `../../layouts/Layout.astro`.
2. Tambah kunci teks di `src/i18n.ts` (kamus `id` DAN `en` — keduanya wajib).
3. Tambah kartu di seksi `.apps` pada `src/pages/index.astro`.
4. Buat `docs/features/<nama>.md` + daftarkan di `docs/README.md`.

## Identitas
- Pemilik: **Andreafif Cyto Prasadana Sutrisno** — proyek pribadi (bukan tim).
- Email publik: `andre.afif35@gmail.com`.
