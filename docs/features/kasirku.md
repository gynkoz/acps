# Feature: KasirKu (Aplikasi POS UMKM Indonesia)

## Tujuan
KasirKu adalah aplikasi Point of Sale (POS) untuk UMKM Indonesia yang berjalan **offline-first**. Landing page ini menjelaskan fitur, data, dan kebijakan aplikasi — sekaligus menjadi lokasi untuk **Privacy Policy** dan **Terms of Service** yang diperlukan saat pengajuan review Google Play / OAuth consent screen.

## Lokasi file
| File | Peran |
|---|---|
| `kasirku/index.html` | Landing page KasirKu |
| `kasirku/privacy.html` | Kebijakan Privasi (Privacy Policy) |
| `kasirku/terms.html` | Syarat & Ketentuan (Terms of Service) |
| `assets/style.css` | Design system bersama (light + dark) |
| `assets/app.js` | i18n (ID/EN) + toggle tema |

## URL (dipakai di OAuth consent screen)
| Halaman | URL |
|---|---|
| Home page | `https://acps.my.id/kasirku` |
| Privacy policy | `https://acps.my.id/kasirku/privacy` |
| Terms of service | `https://acps.my.id/kasirku/terms` |
| Authorized domain | `acps.my.id` |

## Identitas pengembang
Dikembangkan dan dikelola **secara independen sebagai proyek pribadi** oleh **Andreafif Cyto Prasadana Sutrisno** (bukan tim/perusahaan). Email kontak: `andre.afif35@gmail.com`.

## Fitur Bahasa (i18n)
Berlaku di ketiga halaman KasirKu (mekanisme sama dengan landing page ACPS):
- Default konten HTML = Bahasa Indonesia; JS mengganti ke English bila pengunjung terdeteksi di luar Indonesia (navigator.language bukan `id*` dan timezone bukan zona WIB/WITA/WIT).
- Toggle manual 🇬🇧/🇮🇩 di hero; preferensi disimpan di `localStorage` (`acps-lang`).
- Judul halaman (`<title>`) ikut diterjemahkan per halaman (`kas.title`, `privacy.title`, `terms.title`).

## Isi landing page (`kasirku/index.html`)
- Hero: judul "🏪 KasirKu" + tagline "Teman usaha setiap hari — aplikasi POS untuk UMKM Indonesia".
- Deskripsi: POS **offline di perangkat**, kelola produk, transaksi, piutang, laporan harian + backup otomatis ke Google Drive milik pengguna.
- Kartu fitur (grid `.apps`):
  1. **Kasir cepat** — katalog produk & checkout sekali sentuh, struk thermal 58/80 mm.
  2. **Data milik Anda** — data tersimpan lokal, backup hanya ke Drive akun pengguna.
  3. **Gratis & offline** — tanpa biaya bulanan, tetap berjalan tanpa internet untuk transaksi.
- Tombol: Privacy Policy & Terms of Service (`.btn`).
- Footer: `© 2026 Andreafif Cyto Prasadana Sutrisno · KasirKu`.

## Isi Privacy Policy (`kasirku/privacy.html`)
- Terakhir diperbarui: 30 Agustus 2026.
- Bagian: Data yang Dikumpulkan (data usaha, akun Google, izin akses Drive), Cara Penggunaan Data, Akses Google Drive & Backup (scope `drive.appdata`), Izin Aplikasi (Bluetooth/Internet/Notifikasi), Penyimpanan & Keamanan, Hak Pengguna, Perubahan Kebijakan, Hubungi Kami.
- Poin penting: **offline-first** — hampir semua data tidak dikirim ke server; tidak menjual/membagikan data; token Drive hanya saat backup diaktifkan.

## Isi Terms of Service (`kasirku/terms.html`)
- Terakhir diperbarui: 30 Agustus 2026.
- Bagian: Lisensi Penggunaan, Tanggung Jawab Data, Ketersediaan & Perubahan, Pembatasan, Batasan Tanggung Jawab, Hukum yang Berlaku (RI), Hubungi Kami.

## Catatan teknis
- HTML + CSS + JS murni, tanpa dependency eksternal; CSS/JS dari `assets/` (path relatif `../assets/`).
- Tema: emerald modern (mint `#10B981` → deep `#047857`), light default + dark mode via `data-theme`.
- Link "Kembali ke beranda" memakai path relatif (`index.html`) — benar untuk subfolder.

## Status
- Aktif; konten siap dipakai untuk review Google Play.
