# Feature: KasirKu (Aplikasi POS UMKM Indonesia)

## Tujuan
KasirKu adalah aplikasi Point of Sale (POS) untuk UMKM Indonesia yang berjalan **offline-first**. Landing page ini menjelaskan fitur, data, dan kebijakan aplikasi — sekaligus menjadi lokasi untuk **Privacy Policy** dan **Terms of Service** yang diperlukan saat pengajuan review Google Play / OAuth consent screen.

## Lokasi file
| File | Peran |
|---|---|
| `kasirku/index.html` | Landing page KasirKu |
| `kasirku/privacy.html` | Kebijakan Privasi (Privacy Policy) |
| `kasirku/terms.html` | Syarat & Ketentuan (Terms of Service) |

## URL (dipakai di OAuth consent screen)
| Halaman | URL |
|---|---|
| Home page | `https://acps.my.id/kasirku` |
| Privacy policy | `https://acps.my.id/kasirku/privacy` |
| Terms of service | `https://acps.my.id/kasirku/terms` |
| Authorized domain | `acps.my.id` |

## Isi landing page (`kasirku/index.html`)
- Header: judul "🏪 KasirKu" + tagline "Teman usaha setiap hari — aplikasi POS untuk UMKM Indonesia".
- Deskripsi: POS **offline di perangkat**, kelola produk, transaksi, piutang, laporan harian + backup otomatis ke Google Drive milik pengguna.
- Kartu fitur (`.cards`):
  1. **Kasir cepat** — katalog produk & checkout sekali sentuh, struk thermal 58/80 mm.
  2. **Data milik Anda** — data tersimpan lokal, backup hanya ke Drive akun pengguna.
  3. **Gratis & offline** — tanpa biaya bulanan, tetap berjalan tanpa internet untuk transaksi.
- Link: Privacy Policy & Terms of Service.
- Footer: `© 2026 Shandyawira · KasirKu`.

## Isi Privacy Policy (`kasirku/privacy.html`)
- Terakhir diperbarui: 30 Agustus 2026.
- Mengembangkan & mengelola: **Shandyawira**; email kontak: `andre.afif35@gmail.com`.
- Bagian: Data yang Dikumpulkan (data usaha, akun Google, izin akses Drive), Izin yang Diminta (dijelaskan), Penyimpanan & Keamanan, Hak Pengguna, Perubahan Kebijakan, Hubungi Kami.
- Poin penting: **offline-first** — hampir semua data tidak dikirim ke server; token Drive hanya saat backup diaktifkan.

## Isi Terms of Service (`kasirku/terms.html`)
- Terakhir diperbarui: 30 Agustus 2026.
- Bagian: Lisensi Penggunaan, Tanggung Jawab Data, Ketersediaan & Perubahan, Pembatasan, Batasan Tanggung Jawab, Hukum yang Berlaku (RI), Hubungi Kami.

## Catatan teknis
- HTML + CSS murni, tanpa dependency eksternal.
- Semua halaman memakai tema seragam (emerald `#0F766E` → `#115E59` gradient, dark `#1E293B`, bg `#F8FAFC`).
- Link "Kembali ke beranda" memakai path relatif (`index.html`) — benar untuk subfolder.

## Status
- Aktif; konten siap dipakai untuk review Google Play.
