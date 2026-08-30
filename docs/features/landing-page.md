# Feature: Landing Page ACPS

## Tujuan
Halaman utama (`index.html`) yang menjadi **hub/indeks** untuk semua aplikasi ACPS. Berfungsi sebagai base page — satu tempat untuk menampilkan dan menautkan setiap aplikasi yang dikembangkan oleh Shandyawira.

## Lokasi file
- `index.html` (root project)

## URL
- `https://acps.my.id/` (deployment)

## Perilaku
- Header: judul "ACPS" + tagline "Kumpulan aplikasi & layanan".
- Main: daftar kartu aplikasi dalam grid `.apps` (masing-masing `<a class="app-card">`).
  - Setiap kartu: emoji, nama aplikasi (`<h3>`), deskripsi singkat (`<p>`), badge "Buka →".
- Footer: `© 2026 Shandyawira · ACPS`.

## Cara menambah aplikasi baru
1. Buat subfolder baru di project (misal `app2/`) berisi `index.html`.
2. Di `index.html` root, tambahkan satu blok `<a class="app-card" href="/app2/">...</a>` di dalam seksi `.apps`.
3. Buat/update dokumentasi feature untuk aplikasi tersebut.
4. Update indeks di `docs/README.md`.

## Catatan teknis
- HTML + CSS murni, **tanpa dependency eksternal** (no build step).
- Link kartu memakai path absolut (`/kasirku/`) — benar untuk deployment di root server.
- Struktur CSS: variabel global di `:root` (`--emerald`, `--dark`, `--bg`), layout flex untuk body (footer menempel di bawah).

## Status
- Aktif dan digunakan sebagai halaman depan hub aplikasi.
