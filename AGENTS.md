# AGENTS.md — Aturan Wajib untuk AI/Agent di Project ACPS

Project: **ACPS** — hub aplikasi web statis (HTML+CSS murni, tanpa build step).
Repositori: `gynkoz/acps` · Domain: `acps.my.id`

## ⛔ ATURAN WAJIB: Pakai skill `doc-flow` di setiap awal prompt

**Setiap kali Anda (AI/agent) menerima prompt yang berpotensi mengubah kode, fitur, struktur, atau dokumentasi, Anda WAJIB menjalankan skill `doc-flow` terlebih dahulu — di awal prompt, SEBELUM mengerjakan apa pun.**

Cara menjalankan:
1. Jalankan `/doc-flow` (via Skill tool).
2. Jika skill tidak tersedia sebagai slash command, **baca langsung** `.agents/skills/doc-flow/SKILL.md` dan patuhi isinya.

Apa yang dilakukan `doc-flow`:
- Mengingatkan Anda bahwa setiap fitur punya dokumentasi di `docs/features/`.
- Mewajibkan pembaruan dokumentasi setiap kali ada perubahan feature/kode.
- Mewajibkan pembuatan dokumen feature baru + update indeks saat ada fitur baru.
- Mewajibkan update struktur project saat ada perubahan struktur/URL.

**Tanpa menjalankan `doc-flow` di awal prompt, Anda TIDAK BOLEH mengedit kode.** Ini berlaku untuk semua agent (main, subagent, dan agent yang bekerja di repo ini).

## Peta dokumentasi (wajib dibaca sebelum edit)

| Area | Dokumen |
|---|---|
| Indeks semua dokumentasi | `docs/README.md` |
| Struktur folder & URL | `docs/architecture/project-structure.md` |
| Landing page ACPS | `docs/features/landing-page.md` |
| KasirKu (POS UMKM) | `docs/features/kasirku.md` |

## Alur kerja standar (setelah menjalankan `doc-flow`)

1. Baca dokumentasi feature yang akan disentuh (mis. `docs/features/kasirku.md`).
2. Lakukan perubahan kode.
3. **Update dokumentasi** yang terkait perubahan tersebut pada commit yang sama.
4. Jika menambah fitur baru: buat `docs/features/<nama>.md` + daftarkan di `docs/README.md` + buat kartu di `index.html` root.
5. Jika mengubah struktur/URL: update `docs/architecture/project-structure.md` dan `README.md`.

## Konvensi project

- Bahasa: konten situs dalam **Bahasa Indonesia**; dokumentasi teknis juga dalam Bahasa Indonesia.
- Stack: HTML + CSS inline, **tanpa dependency eksternal**, tanpa build step.
- Tema: emerald (`#0F766E` → `#115E59` gradient), dark `#1E293B`, bg `#F8FAFC`.
- Commit: pesan deskriptif; dokumentasi disertakan dalam commit yang sama dengan perubahan kodenya.
- Identitas git: `andreafifcps` / `andre.afif35@gmail.com`.
