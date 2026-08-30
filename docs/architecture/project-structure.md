# Architecture: Struktur Project ACPS

## Ringkasan
Project statis murni (HTML + CSS + JS, **tanpa dependency eksternal dan tanpa build step**). Struktur dirancang agar **bisa menampung banyak aplikasi** — setiap aplikasi adalah subfolder sendiri yang ditautkan dari `index.html` root. Ada **design system bersama** di `assets/` (tema + i18n) yang dipakai semua halaman.

## Diagram struktur
```
acps/
├── index.html                ← halaman utama (hub ACPS, daftar aplikasi)
├── README.md                 ← panduan project + cara deploy
├── AGENTS.md                 ← aturan untuk AI/agent (wajib pakai doc-flow)
├── .gitignore
├── assets/
│   ├── style.css             ← design system: token warna, light+dark, komponen
│   └── app.js                ← i18n (deteksi bahasa ID/EN + toggle) & toggle tema
├── docs/
│   ├── README.md             ← indeks dokumentasi
│   ├── architecture/
│   │   └── project-structure.md
│   └── features/
│       ├── landing-page.md
│       └── kasirku.md
├── .agents/
│   └── skills/
│       └── doc-flow/
│           └── SKILL.md      ← workflow dokumentasi (wajib dijalankan)
└── kasirku/                  ← aplikasi KasirKu
    ├── index.html            ← landing KasirKu
    ├── privacy.html          ← Kebijakan Privasi
    └── terms.html            ← Syarat & Ketentuan
```

## Cara halaman dihubungkan
- **Root → aplikasi**: `index.html` memakai link relatif `<a href="kasirku/">`.
- **Dalam subfolder**: halaman seperti `privacy.html` memakai link relatif `index.html` untuk kembali ke landing KasirKu (bukan ke root).
- **Aset bersama**: halaman root memakai `assets/style.css`; subfolder memakai `../assets/style.css`.

## Fitur lintas-halaman (assets/app.js)
- **i18n**: default HTML = Bahasa Indonesia (SEO/crawler-friendly). Pengunjung non-Indonesia otomatis dapat English (deteksi `navigator.language` + timezone). Toggle manual 🇬🇧/🇮🇩 tersimpan di `localStorage['acps-lang']`.
- **Tema**: light default + dark (`data-theme` pada `<html>`), toggle 🌙/☀️ tersimpan di `localStorage['acps-theme']`, fallback `prefers-color-scheme`.
- Teks diterjemahkan lewat atribut `data-i18n` (teks biasa) / `data-i18n-html` (bermarkup); `<title>` per halaman via `body[data-page]` + kunci `<page>.title`.

## Aturan penamaan & penambahan aplikasi baru
- Setiap aplikasi = subfolder sendiri di root (misal `app2/`), berisi minimal `index.html`.
- Kartu aplikasi ditambahkan di seksi `.apps` pada `index.html` root.
- Teks baru WAJIB punya kunci i18n di `assets/app.js` (kamus `id` dan `en`).
- Setiap fitur baru WAJIB punya dokumentasi di `docs/features/<nama>.md` (lihat `docs/README.md`).

## Identitas
- Pemilik: **Andreafif Cyto Prasadana Sutrisno** — proyek pribadi (bukan tim).
- Email publik: `andre.afif35@gmail.com`.

## URL & deployment
- Domain: `acps.my.id`
- Deploy: upload seluruh isi folder ke root web server (`public_html`/`www`/`/var/www/html`).
- Tidak ada build step; lihat `README.md` untuk contoh konfigurasi nginx/Apache.
