# Architecture: Struktur Project ACPS

## Ringkasan
Project statis murni (HTML + CSS inline) tanpa build step dan tanpa dependency eksternal. Struktur dirancang agar **bisa menampung banyak aplikasi** — setiap aplikasi adalah subfolder sendiri yang ditautkan dari `index.html` root.

## Diagram struktur
```
acps/
├── index.html                ← halaman utama (hub ACPS, daftar aplikasi)
├── README.md                 ← panduan project + cara deploy
├── .gitignore
├── AGENTS.md                 ← aturan untuk AI/agent (wajib pakai doc-flow)
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
- **Root → aplikasi**: `index.html` memakai link absolut `<a href="/kasirku/">`.
- **Dalam subfolder**: halaman seperti `privacy.html` memakai link relatif `index.html` untuk kembali ke landing KasirKu (bukan ke root).

## Aturan penamaan & penambahan aplikasi baru
- Setiap aplikasi = subfolder sendiri di root (misal `app2/`), berisi minimal `index.html`.
- Kartu aplikasi ditambahkan di seksi `.apps` pada `index.html` root.
- Setiap fitur baru WAJIB punya dokumentasi di `docs/features/<nama>.md` (lihat `docs/README.md`).

## URL & deployment
- Domain: `acps.my.id`
- Deploy: upload seluruh isi folder ke root web server (`public_html`/`www`/`/var/www/html`).
- Tidak ada build step; lihat `README.md` untuk contoh konfigurasi nginx/Apache.
