---
title: "Pengurusan Hubungan Pelanggan (CRM)"
draft: true  # unpublished 2026-09-07: its English original (content/en/modules/crm.md) was archived with the modules-tree consolidation — planning/specs/modules-tree-consolidation.md; retranslate from the rebuilt English module page
description: "Pandangan 360 darjah pelanggan dengan pipeline jualan lengkap dan pengurusan hubungan"
weight: 30
---

# Modul Pengurusan Hubungan Pelanggan (CRM)

## Gambaran Keseluruhan

Modul CRM BigLedger menyediakan penyelesaian komprehensif untuk mengurus hubungan pelanggan, pipeline jualan, dan kempen pemasaran. Dibina untuk membantu perniagaan memahami, melibatkan, dan mengekalkan pelanggan dengan lebih berkesan, ia bersepadu dengan lancar dengan semua modul BigLedger lain.

## Ciri-ciri Utama

### 👥 Pengurusan Kenalan

#### Pangkalan Data Pelanggan
- **Pandangan 360 Darjah**: Profil pelanggan lengkap dengan semua interaksi
- **Maklumat Kenalan**: Berbilang alamat, telefon, e-mel
- **Hierarki Syarikat**: Hubungan syarikat induk/anak
- **Peranan Kenalan**: Pembuat keputusan, pengarus, pengguna
- **Medan Tersuai**: Penangkapan data khusus industri
- **Tag & Segmentasi**: Pengkategorian fleksibel
- **Garis Masa Aktiviti**: Sejarah interaksi lengkap
- **Penyimpanan Dokumen**: Kontrak, proposal, surat-menyurat

#### Pengurusan Lead
- **Penangkapan Lead**: Borang web, e-mel, integrasi API
- **Pemarkahan Lead**: Kelayakan automatik berdasarkan kriteria
- **Penugasan Lead**: Pembahagian round-robin atau berasaskan peraturan
- **Pemupukan Lead**: Urutan susulan automatik
- **Pengesanan Duplikat**: Elakkan catatan berganda
- **Penjejakan Sumber Lead**: Analisis ROI mengikut saluran

### 💼 Pengurusan Pipeline Jualan

#### Penjejakan Peluang
- **Pipeline Visual**: Pengurusan deal gaya Kanban
- **Peringkat Tersuai**: Konfigurasikan mengikut proses jualan anda
- **Pemberat Kebarangkalian**: Ketepatan ramalan
- **Penjejakan Nilai Deal**: Produk, perkhidmatan, hasil berulang
- **Penjejakan Pesaing**: Analisis menang/kalah
- **Keperluan Aktiviti**: Automasi tugas berasaskan peringkat

#### Automasi Proses Jualan
- **Automasi Aliran Kerja**: Picu tindakan berdasarkan peristiwa
- **Templat E-mel**: Komunikasi massa yang dipersonalisasi
- **Penjanaan Sebut Harga**: Cadangan profesional
- **Pengurusan Kontrak**: E-tandatangan dan penjejakan
- **Pengiraan Komisen**: Pampasan jualan automatik

### 📊 Analitik Jualan

#### Metrik Prestasi
- **Papan Pemuka Jualan**: KPI masa nyata
- **Analitik Pipeline**: Kadar penukaran mengikut peringkat
- **Laporan Ramalan**: Ramalan hasil
- **Prestasi Pasukan**: Metrik individu dan pasukan
- **Laporan Aktiviti**: Panggilan, mesyuarat, e-mel
- **Analisis Menang/Kalah**: Penjejakan sebab

#### Analitik Lanjutan
- **Halaju Jualan**: Analisis masa untuk tutup
- **Nilai Seumur Hidup Pelanggan**: Pengiraan CLV
- **Ramalan Kehilangan**: Pemarkahan risiko berkuasa AI
- **Tindakan Terbaik Seterusnya**: Cadangan AI
- **Analisis Wilayah**: Prestasi geografi

### 📧 Integrasi Pemasaran

#### Pengurusan Kempen
- **Kempen Multi-saluran**: E-mel, SMS, media sosial
- **ROI Kempen**: Jejak kos dan pulangan
- **Ujian A/B**: Optimumkan mesej
- **Halaman Pendaratan**: Pembina borang bersepadu
- **Automasi Pemasaran**: Urutan pemupukan

#### Pemasaran E-mel
- **Pembina E-mel**: Pereka tarik-dan-lepas
- **Personalisasi**: Kandungan dinamik
- **Segmentasi**: Sasarkan penonton khusus
- **Analitik**: Kadar buka, klik, penukaran
- **Rekod persetujuan**: rekod apa yang dipersetujui setiap kenalan, dan bila

### 🎯 Perkhidmatan Pelanggan

#### Pengurusan Kes
- **Sistem Tiket**: Jejak isu pelanggan
- **Pengurusan SLA**: Penjejakan tahap perkhidmatan
- **Pangkalan Pengetahuan**: Portal libre diri
- **Peraturan Peningkatan**: Penghalaan automatik
- **Portal Pelanggan**: Akses libre diri

#### Saluran Komunikasi
- **Integrasi E-mel**: Segerak dua hala
- **Integrasi Telefon**: Klik-untuk-panggil, log panggilan
- **Integrasi Chat**: Sokongan chat langsung
- **Media Sosial**: Pantau dan balas
- **SMS**: Mesej dua hala

## Konfigurasi

### Persediaan Awal

#### Langkah 1: Konfigurasi Proses Jualan

```yaml
Pipeline Jualan:
  Peringkat:
    - nama: Prospek
      kebarangkalian: 10%
      aktiviti: ["Kenalan Awal", "Panggilan Kelayakan"]
    - nama: Kelayakan
      kebarangkalian: 25%
      aktiviti: ["Analisis Keperluan", "Pengesahan Belanjawan"]
    - nama: Cadangan
      kebarangkalian: 50%
      aktiviti: ["Hantar Cadangan", "Susulan"]
    - nama: Rundingan
      kebarangkalian: 75%
      aktiviti: ["Semakan Kontrak", "Terma Akhir"]
    - nama: Ditutup Menang
      kebarangkalian: 100%
      aktiviti: ["Kontrak Ditandatangani", "Kickoff"]
```

#### Langkah 2: Peraturan Pemarkahan Lead

```javascript
{
  "scoring_rules": [
    {"criteria": "company_size > 100", "points": 20},
    {"criteria": "industry = 'Teknologi'", "points": 15},
    {"criteria": "visited_pricing_page", "points": 10},
    {"criteria": "downloaded_whitepaper", "points": 5},
    {"criteria": "email_opened > 3", "points": 5}
  ],
  "qualification_threshold": 50
}
```

### Struktur Pasukan

#### Peranan dan Kebenaran Jualan

| Peranan | Kebenaran |
|---------|-----------|
| Pengurus Jualan | Akses penuh, laporan pasukan, pengurusan wilayah |
| Eksekutif Akaun | Deal sendiri, kenalan, aktiviti |
| Rep Pembangunan Jualan | Lead, kelayakan awal |
| Operasi Jualan | Laporan, konfigurasi, aliran kerja |

## Integrasi

### Integrasi Modul BigLedger

- **Perakaunan Kewangan**: Penjanaan invois, penjejakan pembayaran
- **POS**: Sejarah pembelian pelanggan, status kesetiaan
- **Inventori**: Ketersediaan produk, harga
- **Projek**: Penjejakan penyampaian projek
- **Sokongan**: Sejarah kes, pengurusan SLA

### Integrasi Pihak Ketiga

- **E-mel**: Gmail, Outlook, Exchange
- **Kalendar**: Google Calendar, Outlook Calendar
- **Sistem Telefon**: Integrasi VoIP
- **Alat Pemasaran**: Mailchimp, HubSpot
- **Media Sosial**: LinkedIn, Twitter, Facebook

## Amalan Terbaik

### Kualiti Data

1. **Pembersihan Data Berkala**
   - Deduplicate rekod
   - Kemaskini maklumat lapuk
   - Sahkan alamat e-mel
   - Standardkan format data

2. **Piawaian Kemasukan Data**
   - Penguatkuasaan medan wajib
   - Peraturan pengesahan
   - Konvensyen penamaan
   - Standardisasi alamat

### Optimisasi Proses Jualan

1. **Pengurusan Pipeline**
   - Semakan pipeline berkala
   - Penjejakan halaju peringkat
   - Pengenalpastian kesesakan
   - Peningkatan kadar menang

2. **Pengurusan Aktiviti**
   - Matlamat aktiviti harian
   - Templat panggilan/e-mel
   - Automasi susulan
   - Keutamaan tugas

## Pelaporan

### Laporan Standard

- Laporan Pipeline Jualan
- Laporan Ramalan
- Laporan Aktiviti
- Analisis Sumber Lead
- Kos Pemerolehan Pelanggan
- Panjang Kitaran Jualan
- Prestasi Wilayah
- Prestasi Produk

### Papan Pemuka Tersuai

Cipta papan pemuka yang dipersonalisasi dengan:
- Widget masa nyata
- KPI tersuai
- Keupayaan drill-down
- Fungsi eksport
- Penghantaran berjadual

## CRM Mudah Alih

### Ciri
- Akses CRM penuh pada mudah alih
- Keupayaan luar talian
- Daftar masuk GPS
- Nota suara
- Imbasan kad perniagaan
- Tandatangan mudah alih

### Platform Yang Disokong
- iOS (iPhone dan iPad)
- Android
- Aplikasi Web Progresif

## Sokongan & Latihan

- 📚 [Panduan Amalan Terbaik CRM](/docs/best-practices/crm/)
- 🎥 [Tutorial Video](/tutorials/crm/)
- 📊 [Templat Laporan](/templates/crm/)
- 📧 [Sokongan](mailto:crm-support@bigledger.com)