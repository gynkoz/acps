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

- Framework: **Astro 5** (output statis). Halaman di `src/pages/`, layout & design system di `src/layouts/Layout.astro`. Build: `npm run build` → `dist/`.
- Bahasa konten: **dwibahasa (ID default + EN otomatis)**. Konten HTML default Bahasa Indonesia; setiap teks baru WAJIB punya kunci i18n di `src/i18n.ts` (kamus `id` dan `en`) + atribut `data-i18n`/`data-i18n-html` di markup. Dokumentasi teknis dalam Bahasa Indonesia.
- Tema: **dark futuristik default** (aurora emerald/cyan/violet, grid perspektif, bintang, scan-line) + light mode via `data-theme`. Animasi: scroll reveal (`.reveal`), tilt 3D (`.tilt`), page transition (ClientRouter). Hormati `prefers-reduced-motion` dan sediakan fallback `<noscript>`.
- Tanpa dependency eksternal runtime (tanpa CDN); font stack sistem.
- Identitas: proyek **pribadi** Andreafif Cyto Prasadana Sutrisno — jangan tulis sebagai tim/perusahaan.
- Commit: pesan deskriptif; dokumentasi disertakan dalam commit yang sama dengan perubahan kodenya. Jangan commit `node_modules/`, `dist/`, `.astro/`.
- Identitas git: `andreafifcps` / `andre.afif35@gmail.com`.
