---
name: doc-flow
description: Workflow dokumentasi wajib untuk project ACPS. Jalankan di AWAL setiap prompt sebelum mengubah kode/fitur/struktur — memastikan setiap feature punya dokumentasi dan dokumentasi selalu sinkron dengan perubahan. Gunakan saat ada permintaan yang menyentuh kode, fitur, struktur folder, URL, atau dokumentasi di repo acps (D:\WEB\acps).
---

# doc-flow — Workflow Dokumentasi Project ACPS

Skill ini berisi **alur baku (flow) untuk menjaga dokumentasi project ACPS tetap sinkron dengan kode**.
Ini adalah **aturan wajib**: jalankan skill ini di **awal setiap prompt** yang berpotensi mengubah kode, fitur, struktur, atau dokumentasi — SEBELUM mengerjakan apa pun.

## Kenapa wajib
Project ACPS adalah "base page" yang akan terus menampung banyak aplikasi (KasirKu, dst) untuk review Google Play. Dokumentasi per feature adalah sumber kebenaran untuk pengajuan OAuth/Play. Jika AI mengubah kode tanpa update doc, dokumentasi menjadi usang dan menyulitkan review.

## Lokasi dokumentasi
- Indeks: `docs/README.md`
- Struktur: `docs/architecture/project-structure.md`
- Feature: `docs/features/<nama-feature>.md` (satu file per feature)

## STEP 1 — Orientasi (lakukan di awal prompt)
Baca dalam urutan ini:
1. `docs/README.md` — lihat daftar feature & mana yang tersentuh.
2. File doc feature yang relevan dengan permintaan (mis. `docs/features/kasirku.md`).
3. `docs/architecture/project-structure.md` — hanya jika struktur/URL ikut berubah.

Jika salah satu file doc belum ada padahal feature-nya ada → catat sebagai **tugas wajib** untuk dibuat di STEP 3.

## STEP 2 — Kerjakan perubahan
Lakukan perubahan kode/struktur sesuai permintaan (mengikuti aturan di `AGENTS.md`).

## STEP 3 — Sinkronkan dokumentasi (WAJIB, di commit yang sama)
Setelah selesai mengubah, bandingkan setiap bagian di bawah dengan kode yang sebenarnya:

| Perubahan | Aksi pada dokumentasi |
|---|---|
| Isi/teks/tampilan feature diubah | Update file `docs/features/<feature>.md` (tujuan, perilaku, konten, status) |
| Fitur baru dibuat | Buat `docs/features/<nama>.md` + daftarkan di tabel `docs/README.md` |
| Fitur dihapus | Hapus/arsipkan doc + hapus baris di `docs/README.md` |
| Struktur folder / URL berubah | Update `docs/architecture/project-structure.md` + tabel URL di doc feature + `README.md` root |
| Dependensi/stack berubah | Update bagian "Catatan teknis" pada doc feature + `README.md` |

**Gunakan checklist verifikasi:**
- [ ] Tidak ada feature tanpa doc (setiap subfolder app punya doc di `docs/features/`).
- [ ] Tidak ada doc yang menyebutkan fitur/URL yang sudah tidak ada.
- [ ] Tanggal/perilaku/konten di doc sama dengan kode.
- [ ] `docs/README.md` memuat indeks semua feature.

## STEP 4 — Commit bersama
Commit perubahan kode **dan** pembaruan dokumentasi dalam commit yang sama. Pesan commit menyebutkan apa yang berubah di fitur maupun dokumen.

## Aturan ketat
- **Jangan pernah** mengedit kode di repo ini tanpa menjalankan doc-flow terlebih dahulu.
- **Jangan pernah** menganggap dokumentasi "tidak perlu diubah" tanpa membandingkan dengan kode (STEP 3).
- Semua dokumentasi dalam Bahasa Indonesia, konsisten dengan gaya doc yang ada.

## Referensi cepat path
- Repo: `D:\WEB\acps`
- Feature aktif saat ini: `landing-page`, `kasirku`
