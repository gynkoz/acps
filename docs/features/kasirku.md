# Feature: KasirKu (Aplikasi POS UMKM Indonesia)

## Tujuan
KasirKu adalah aplikasi Point of Sale (POS) untuk UMKM Indonesia yang berjalan **offline-first**. Landing page ini menjelaskan fitur, data, dan kebijakan aplikasi — sekaligus menjadi lokasi **Privacy Policy** dan **Terms of Service** yang diperlukan saat pengajuan review Google Play / OAuth consent screen.

## Lokasi file
| File | Peran |
|---|---|
| `src/pages/kasirku/index.astro` | Landing page KasirKu |
| `src/pages/kasirku/privacy.astro` | Kebijakan Privasi (Privacy Policy) |
| `src/pages/kasirku/terms.astro` | Syarat & Ketentuan (Terms of Service) |
| `src/layouts/Layout.astro` | Tema futuristik + i18n + animasi (bersama) |
| `src/i18n.ts` | Kamus teks ID/EN |

## URL (dipakai di OAuth consent screen)
| Halaman | URL |
|---|---|
| Home page | `https://acps.my.id/kasirku` |
| Privacy policy | `https://acps.my.id/kasirku/privacy` |
| Terms of service | `https://acps.my.id/kasirku/terms` |
| Authorized domain | `acps.my.id` |

> Hasil build Astro memakai format directory: `/kasirku/privacy/index.html`. Server menyajikan URL tanpa trailing slash dengan benar.

## Identitas pengembang
Dikembangkan dan dikelola **secara independen sebagai proyek pribadi** oleh **Andreafif Cyto Prasadana Sutrisno** (bukan tim/perusahaan). Email kontak: `andre.afif35@gmail.com`.

## Fitur Bahasa (i18n)
Berlaku di ketiga halaman KasirKu (mekanisme sama dengan landing ACPS):
- Default konten HTML = Bahasa Indonesia; JS mengganti ke English bila pengunjung terdeteksi di luar Indonesia.
- Toggle manual 🇬🇧/🇮🇩 persist antar halaman (`data-astro-transition-persist`); preferensi di `localStorage['acps-lang']`.
- `<title>` per halaman via kunci `kas.title`, `privacy.title`, `terms.title`.

## Isi landing page (`kasirku/index.astro`)
- Hero: badge "✦ POS · Offline-first", judul "🏪 KasirKu", tagline.
- Deskripsi: POS **offline di perangkat**, kelola produk, transaksi, piutang, laporan harian + backup otomatis ke Google Drive milik pengguna.
- 3 kartu fitur (tilt 3D + glow): ⚡ Kasir cepat · 🔒 Data milik Anda · 📶 Gratis & offline.
- Tombol pill: Kebijakan Privasi & Syarat & Ketentuan.
- Footer: `© 2026 Andreafif Cyto Prasadana Sutrisno · KasirKu`.

## Isi Privacy Policy (`kasirku/privacy.astro`)
- Terakhir diperbarui: 30 Agustus 2026.
- Bagian: Data yang Dikumpulkan (data usaha, akun Google, izin akses Drive), Cara Penggunaan Data, Akses Google Drive & Backup (scope `drive.appdata`), Izin Aplikasi (Bluetooth/Internet/Notifikasi), Penyimpanan & Keamanan, Hak Pengguna, Perubahan Kebijakan, Hubungi Kami.
- Poin penting: **offline-first** — hampir semua data tidak dikirim ke server; tidak menjual/membagikan data; token Drive hanya saat backup diaktifkan.

## Isi Terms of Service (`kasirku/terms.astro`)
- Terakhir diperbarui: 30 Agustus 2026.
- Bagian: Lisensi Penggunaan, Tanggung Jawab Data, Ketersediaan & Perubahan, Pembatasan, Batasan Tanggung Jawab, Hukum yang Berlaku (RI), Hubungi Kami.

## Catatan teknis
- Tema: dark futuristik default (aurora emerald/cyan/violet, grid perspektif, bintang, scan-line) + light mode.
- Semua paragraf legal memakai scroll reveal berjenjang; `<noscript>` fallback agar konten tetap terbaca tanpa JS (penting untuk crawler Google).
- Konten legal TIDAK berubah maknanya sejak v1 — hanya tampilan & mekanisme bahasa yang berubah.

## Status
- Aktif; konten siap dipakai untuk review Google Play.
