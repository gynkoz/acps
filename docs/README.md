# ACPS Docs — Project Documentation

> **PENTING:** Sebelum mengubah fitur/kode, ikuti dulu skill **`doc-flow`** (workflow dokumentasi).
> Cara memuat: jalankan `/doc-flow` di awal prompt, atau baca `.agents/skills/doc-flow/SKILL.md`.

## Struktur dokumentasi

```
docs/
├── README.md                  ← file ini (indeks)
├── architecture/
│   └── project-structure.md   ← struktur folder & bagaimana halaman dihubungkan
└── features/
    ├── landing-page.md        ← halaman utama ACPS (index.html root)
    └── kasirku.md             ← landing KasirKu + privacy + terms
```

## Cara update dokumentasi (aturan wajib)

1. **Baca** `.agents/skills/doc-flow/SKILL.md` dulu.
2. Setiap **perubahan fitur/kode** → update file doc terkait di `docs/features/`.
3. Tambah feature baru → buat file `.md` baru di `docs/features/` + tambahkan indeks di bawah.
4. Sertakan **komit dokumentasi** yang sama dengan perubahan kode (satu PR/commit bisa berisi keduanya).
5. Jika struktur folder/URL berubah → update `docs/architecture/project-structure.md`.

## Indeks feature

| Feature | Dokumen | Deskripsi singkat |
|---|---|---|
| Landing page ACPS | [landing-page.md](features/landing-page.md) | Halaman utama hub aplikasi ACPS |
| KasirKu (POS UMKM) | [kasirku.md](features/kasirku.md) | Landing, privacy policy, terms of service |
