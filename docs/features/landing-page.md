# Feature: Landing Page ACPS

## Tujuan
Halaman utama (`index.html`) yang menjadi **hub/indeks** untuk semua aplikasi ACPS. Berfungsi sebagai base page — satu tempat untuk menampilkan dan menautkan setiap aplikasi yang dikembangkan secara **pribadi** oleh Andreafif Cyto Prasadana Sutrisno.

## Lokasi file
- `index.html` (root project)
- `assets/style.css` (design system bersama)
- `assets/app.js` (i18n + tema)

## URL
- `https://acps.my.id/` (deployment)

## Perilaku
- Hero: judul "ACPS" + tagline "Kumpulan aplikasi & layanan dari proyek pribadi saya".
- Kontrol di pojok kanan atas hero: **toggle bahasa** (🇬🇧/🇮🇩) dan **toggle tema** (🌙/☀️).
- Main: daftar kartu aplikasi dalam grid `.apps` (masing-masing `<a class="app-card">`).
  - Setiap kartu: emoji, nama aplikasi (`<h3>`), deskripsi singkat (`<p>`), badge "Buka →".
- Footer: `© 2026 Andreafif Cyto Prasadana Sutrisno · ACPS — proyek pribadi`.

## Fitur Bahasa (i18n)
- Konten HTML default = **Bahasa Indonesia** (agar crawler Google & reviewer melihat teks terbaca tanpa perlu JS).
- `assets/app.js` mendeteksi pengunjung: `navigator.language` diawali `id` ATAU timezone Indonesia → tetap ID; selain itu → **English**.
- Pilihan manual via tombol toggle disimpan di `localStorage` (`acps-lang`) dan mengalahkan deteksi.
- Teks ditandai `data-i18n` / `data-i18n-html`; `<title>` dan `document.documentElement.lang` ikut berubah.

## Cara menambah aplikasi baru
1. Buat subfolder baru di project (misal `app2/`) berisi `index.html`.
2. Di `index.html` root, tambahkan satu blok `<a class="app-card" href="app2/">...</a>` di dalam seksi `.apps`.
3. Tambahkan kunci i18n untuk teks baru di `assets/app.js` (kamus `id` dan `en`).
4. Buat/update dokumentasi feature untuk aplikasi tersebut.
5. Update indeks di `docs/README.md`.

## Catatan teknis
- HTML + CSS + JS murni, **tanpa dependency eksternal** (no build step, tanpa CDN).
- CSS & JS diekstrak ke `assets/` (bukan inline lagi) agar dipakai bersama semua halaman.
- Link kartu memakai path relatif (`kasirku/`) — benar untuk deployment di root server maupun subfolder.
- Design token di `:root` (light) dan `[data-theme="dark"]` (dark).

## Status
- Aktif dan digunakan sebagai halaman depan hub aplikasi.
