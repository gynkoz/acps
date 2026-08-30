# Web ACPS — acps.my.id

Landing page profil + halaman aplikasi (termasuk KasirKu). Struktur dibuat agar bisa menampung banyak aplikasi ke depan. **Proyek pribadi Andreafif Cyto Prasadana Sutrisno.**

## Fitur
- 🌐 **Dwi-bahasa otomatis** — konten default Bahasa Indonesia; pengunjung dari luar Indonesia otomatis melihat English (deteksi bahasa browser + timezone). Tersedia toggle manual 🇬🇧/🇮🇩.
- 🌗 **Light & dark mode** — light default, toggle 🌙/☀️, preferensi tersimpan di browser.
- 📦 **Tanpa build step** — HTML + CSS + JS murni, tanpa dependency eksternal/CDN.

## Struktur folder
```
acps.my.id/
├── index.html              → halaman utama (profil ACPS, daftar aplikasi)
├── assets/
│   ├── style.css           → design system (tema light/dark, komponen)
│   └── app.js              → i18n (ID/EN) + toggle tema
└── kasirku/
    ├── index.html          → landing KasirKu
    ├── privacy.html        → Kebijakan Privasi KasirKu
    └── terms.html          → Syarat & Ketentuan KasirKu
```

## URL yang diharapkan (dipakai di OAuth consent screen)
| Halaman | URL |
|---|---|
| Home page | `https://acps.my.id/kasirku` |
| Privacy policy | `https://acps.my.id/kasirku/privacy` |
| Terms of service | `https://acps.my.id/kasirku/terms` |
| Authorized domain | `acps.my.id` |

## Cara deploy (home server / hosting)
Upload seluruh isi folder ini ke root web server (misal `public_html`, `www`, atau `/var/www/html` di home server). Tidak ada dependensi — murni HTML+CSS+JS statis, tidak butuh build step.

Contoh nginx:
```
server {
    server_name acps.my.id;
    root /var/www/acps;
    index index.html;
}
```
Contoh Apache: taruh file di `htdocs` / `public_html`.

## Menambah aplikasi baru
1. Buat subfolder baru (misal `app2/`) berisi `index.html`.
2. Tambahkan kartunya di `index.html` root (seksi `.apps`).
3. Tambahkan kunci teks di kamus `id` & `en` pada `assets/app.js`.
4. Ikuti workflow dokumentasi: lihat `docs/README.md` dan skill `.agents/skills/doc-flow/SKILL.md`.

## Cara verifikasi setelah deploy
1. Buka `https://acps.my.id/kasirku/privacy` di browser (bukan incognito) — pastikan isi halaman tampil.
2. Pastikan HTTPS aktif (SSL cert). Kalau pakai Cloudflare: mode **Full (strict)**.
3. Setelah halaman bisa diakses publik, isi URL-nya di Google Cloud Console (OAuth consent screen → Branding) — lihat tabel di atas.

> Catatan: Google memverifikasi URL ini saat peninjauan aplikasi. Pastikan isi privacy benar-benar terbaca (bukan halaman kosong/error). Konten default halaman adalah Bahasa Indonesia dan tetap terbaca tanpa JavaScript, jadi aman untuk crawler.

© 2026 Andreafif Cyto Prasadana Sutrisno · ACPS — proyek pribadi
