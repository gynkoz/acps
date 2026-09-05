# Web ACPS — acps.my.id

Landing page profil + halaman aplikasi (termasuk KasirKu). Struktur dibuat agar bisa menampung banyak aplikasi ke depan. **Proyek pribadi Andreafif Cyto Prasadana Sutrisno.**

Dibangun dengan **Astro 5** (output statis) — tema futuristik penuh animasi, dwibahasa ID/EN otomatis, dark/light mode.

## Fitur
- 🌐 **Dwi-bahasa otomatis** — konten default Bahasa Indonesia; pengunjung dari luar Indonesia otomatis melihat English (deteksi bahasa browser + timezone). Toggle manual 🇬🇧/🇮🇩 persist antar halaman.
- 🌗 **Dark futuristik + light mode** — aurora glow, grid perspektif bergerak, bintang berkelip, scan-line; toggle 🌙/☀️ tersimpan di browser.
- ✨ **Animasi** — scroll reveal berjenjang, tilt 3D kartu, glow mengikuti kursor, page transition halus (View Transitions API).
- 📦 **Static output** — hasil build berupa HTML+CSS+JS murni, tanpa runtime server.

## Struktur folder
```
acps/
├── astro.config.mjs
├── src/
│   ├── i18n.ts               → kamus teks ID & EN
│   ├── layouts/Layout.astro  → design system (tema, i18n, animasi)
│   └── pages/
│       ├── index.astro       → halaman utama (profil ACPS, daftar aplikasi)
│       └── kasirku/
│           ├── index.astro   → landing KasirKu
│           ├── privacy.astro → Kebijakan Privasi KasirKu
│           └── terms.astro   → Syarat & Ketentuan KasirKu
├── .github/workflows/        → auto-deploy (deploy-production.yml, pola kurivox)
├── deploy/                   → deploy.sh (template server) + README setup
└── dist/                     → hasil build (yang di-upload ke hosting)
```

## Build
```bash
npm install
npm run build      # hasil di dist/
npm run dev        # development server (hot reload)
```

## URL yang diharapkan (dipakai di OAuth consent screen)
| Halaman | URL |
|---|---|
| Home page | `https://acps.my.id/kasirku` |
| Privacy policy | `https://acps.my.id/kasirku/privacy` |
| Terms of service | `https://acps.my.id/kasirku/terms` |
| Authorized domain | `acps.my.id` |

> Privacy & terms kini di-build sebagai folder (`/kasirku/privacy/index.html`). URL tanpa trailing slash tetap disajikan dengan benar oleh nginx/Apache.

## Cara deploy (home server / hosting)
Ada dua mode — dokumentasi lengkap: `docs/architecture/deployment.md` & `deploy/README.md`.

**Manual:** Jalankan `npm run build`, lalu upload **seluruh isi folder `dist/`** ke root web server (misal `public_html`, `www`, atau `/var/www/html` di home server).

**Otomatis (pola kurivox):** setiap push ke `main`, GitHub Actions SSH ke server dan menjalankan `deploy/deploy.sh` (git pull + build + rsync `dist/` ke web root). Siapkan secret `ACPS_SSH_KEY_B64`, `ACPS_DEPLOY_USER`, `ACPS_DEPLOY_HOST`.

Contoh nginx:
```
server {
    server_name acps.my.id;
    root /var/www/acps;
    index index.html;
}
```
Contoh Apache: taruh isi `dist/` di `htdocs` / `public_html`.

## Menambah aplikasi baru
1. Buat folder `src/pages/<nama>/` berisi `index.astro` (import `Layout`).
2. Tambahkan kartunya di `src/pages/index.astro` (seksi `.apps`).
3. Tambahkan kunci teks di kamus `id` & `en` pada `src/i18n.ts`.
4. Ikuti workflow dokumentasi: lihat `docs/README.md` dan skill `.agents/skills/doc-flow/SKILL.md`.

## Cara verifikasi setelah deploy
1. Buka `https://acps.my.id/kasirku/privacy` di browser (bukan incognito) — pastikan isi halaman tampil.
2. Pastikan HTTPS aktif (SSL cert). Kalau pakai Cloudflare: mode **Full (strict)**.
3. Setelah halaman bisa diakses publik, isi URL-nya di Google Cloud Console (OAuth consent screen → Branding) — lihat tabel di atas.

> Catatan: Google memverifikasi URL ini saat peninjauan aplikasi. Konten default halaman adalah Bahasa Indonesia dan tetap terbaca tanpa JavaScript (ada fallback `<noscript>`), jadi aman untuk crawler.

© 2026 Andreafif Cyto Prasadana Sutrisno · ACPS — proyek pribadi
