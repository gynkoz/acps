# Feature: Landing Page ACPS

## Tujuan
Halaman utama yang menjadi **hub/indeks** untuk semua aplikasi ACPS. Berfungsi sebagai base page — satu tempat menampilkan dan menautkan setiap aplikasi yang dikembangkan secara **pribadi** oleh Andreafif Cyto Prasadana Sutrisno.

## Lokasi file
- `src/pages/index.astro` (halaman)
- `src/layouts/Layout.astro` (tema, i18n, animasi)
- `src/i18n.ts` (kamus teks ID/EN)

## URL
- `https://acps.my.id/` (deployment)

## Perilaku
- Hero futuristik: badge "✦ ACPS · Personal Projects", judul gradient shimmer, tagline.
- Kontrol melayang (fixed, persist antar halaman): **toggle bahasa** 🇬🇧/🇮🇩 dan **toggle tema** 🌙/☀️.
- Grid `.apps`: kartu aplikasi (glassmorphism + tilt 3D + glow mengikuti kursor) dan kartu "segera hadir" dashed.
- Kartu KasirKu menaut ke `/kasirku/`.
- Footer: `© 2026 Andreafif Cyto Prasadana Sutrisno · ACPS — proyek pribadi`.

## Animasi
- Scroll reveal berjenjang (stagger) via IntersectionObserver.
- Page transition halus (View Transitions API + ClientRouter Astro).
- Latar: grid perspektif bergerak, 3 blob aurora melayang, bintang berkelip, scan-line vertikal.

## Fitur Bahasa (i18n)
- Konten HTML default = **Bahasa Indonesia** (crawler Google & reviewer melihat teks terbaca tanpa JS).
- Pengunjung non-Indonesia otomatis **English** (deteksi `navigator.language` + timezone Indonesia).
- Toggle manual disimpan di `localStorage['acps-lang']`, mengalahkan deteksi.
- `<title>`, meta description, dan `document.documentElement.lang` ikut berganti.

## Cara menambah aplikasi baru
1. Buat folder `src/pages/<nama>/` dengan `index.astro`.
2. Tambah kartu `<a class="card app-card tilt reveal" href="/<nama>/">` di seksi `.apps` `src/pages/index.astro`.
3. Tambah kunci teks di `src/i18n.ts` (kamus `id` dan `en`).
4. Buat `docs/features/<nama>.md` + update indeks `docs/README.md`.

## Catatan teknis
- Astro 5, output statis (`npm run build` → `dist/`).
- Tanpa dependency eksternal runtime (tanpa CDN); font memakai stack sistem.

## Status
- Aktif — v2.0 (redesign futuristik + Astro).
