---
title: "Tempat Jualan (POS)"
draft: true  # unpublished 2026-09-07: its English original (content/en/modules/pos.md) was archived with the modules-tree consolidation — planning/specs/modules-tree-consolidation.md; retranslate from the rebuilt English module page
description: "Penyelesaian tempat jualan lengkap untuk perniagaan runcit dan hospitaliti"
weight: 20
---

# Modul Tempat Jualan (POS)

## Gambaran Keseluruhan

Modul Tempat Jualan (POS) BigLedger adalah penyelesaian pengurusan runcit komprehensif yang direka untuk perniagaan moden. Dibina dengan kelajuan, kebolehpercayaan, dan kemudahan pengguna sebagai tumpuan, ia bersepadu dengan lancar dengan semua modul BigLedger lain sambil menyediakan keupayaan berdiri sendiri untuk operasi runcit.

## Ciri-ciri Utama

### 🚀 Fungsi Teras

- **Sokongan Multi-kedai**: Urus berbilang lokasi dari satu sistem
- **Mod Luar Talian**: Teruskan operasi walaupun tanpa sambungan internet
- **Antara Muka Dioptimumkan Sentuh**: Direka untuk tablet dan skrin sentuh
- **Imbasan Kod Bar**: Sokongan untuk kod bar 1D dan 2D
- **Kunci Pantas**: Pintasan produk boleh disesuaikan
- **Kaedah Pembayaran Berbilang**: Tunai, kad, dompet digital, layaway
- **Inventori Masa Nyata**: Kemaskini stok segera merentasi semua saluran
- **Pengurusan Pelanggan**: CRM terbina dalam dan program kesetiaan

### 💳 Pemprosesan Pembayaran

#### Kaedah Pembayaran Yang Disokong
- Tunai (dengan integrasi laci tunai)
- Kad Kredit/Debit (EMV, NFC, Swipe)
- Dompet Digital (Apple Pay, Google Pay, Samsung Pay)
- Pembayaran Kod QR (Alipay, WeChat Pay, Touch 'n Go eWallet)
- Kredit Kedai dan Kad Hadiah
- Bayar Ansuran dan Pemasangan
- Integrasi Beli Sekarang, Bayar Kemudian (BNPL)

#### Integrasi Gerbang Pembayaran
- iPay88
- MOLPay (Razer Merchant Services)
- PayPal
- Stripe
- Gerbang serantau (khusus negara)

### 📊 Ciri Jualan

- **Varian Produk**: Pengurusan saiz, warna, gaya
- **Produk Bundle**: Cipta dan jual bundle produk
- **Enjin Promosi**: 
  - Beli X Dapat Y
  - Diskaun peratusan/tetap
  - Promosi berasaskan masa
  - Tawaran eksklusif ahli
  - Kod kupon
- **Pengurusan Harga**:
  - Berbilang senarai harga
  - Harga khusus pelanggan
  - Diskaun volum
  - Peraturan harga dinamik
- **Penjejakan Komisen**: Komisen rakan jualan
- **Pulangan & Pertukaran**: Pulangan penuh atau separa dengan penjejakan sebab

### 👥 Pengalaman Pelanggan

- **Paparan Pelanggan**: Paparan sekunder untuk pelanggan
- **Resit Digital**: Resit melalui e-mel/SMS
- **Program Kesetiaan**:
  - Ganjaran berasaskan mata
  - Faedah berasaskan peringkat
  - Kad tebuk
  - Program pulangan tunai
- **Akaun Pelanggan**: Kredit kedai, sejarah pembayaran
- **Pengurusan Senarai Hajat**: Simpan item untuk kemudian
- **Pengurusan Pesanan**: Pesanan khas, pra-pesanan

### 🏪 Operasi Kedai

- **Pengurusan Syif**: Buka/tutup syif dengan rekonsiliasi tunai
- **Pengurusan Tunai**:
  - Apungan tunai
  - Tunai masuk/keluar
  - Rekonsiliasi daftar tunai
  - Deposit peti besi
- **Pengurusan Kakitangan**:
  - Kebenaran berasaskan peranan
  - Integrasi jam masa
  - Penjejakan prestasi
  - Mod latihan

## Ciri Khusus Industri

### Runcit
- Matriks saiz/warna
- Pengurusan musim
- Penjejakan gaya
- Katalog vendor
- Pesanan pembelian

### Restoran & Hospitaliti
- Pengurusan meja
- Sistem paparan dapur
- Pengubah menu
- Bil terpisah
- Pengurusan tip
- Harga happy hour

### Perkhidmatan
- Penjadualan temujanji
- Penjejakan tempoh perkhidmatan
- Peruntukan sumber
- Jualan pakej
- Pengurusan keahlian

## Integrasi Perkakasan

### Perkakasan Yang Disokong

#### Pencetak Resit
- Epson TM series
- Star Micronics
- Bixolon
- Citizen
- Pencetak mudah alih Bluetooth

#### Pengimbas Kod Bar
- Pengimbas USB (plug-and-play)
- Pengimbas Bluetooth
- Pengimbas imej 2D
- Kamera peranti mudah alih

#### Terminal Pembayaran
- Ingenico
- Verifone
- PAX
- Terminal tempatan Malaysia

### Panduan Konfigurasi

#### Persediaan Awal

##### Langkah 1: Konfigurasi Kedai
```yaml
Tetapan Kedai:
  Nama: Kedai Utama
  Kod: UTAMA
  Alamat: 123 Jalan Perniagaan
  ID Cukai: XX-XXXXXXX
  Mata Wang: MYR
  Zon Masa: Asia/Kuala_Lumpur
  
Waktu Operasi:
  Isnin-Jumaat: 9:00 AM - 9:00 PM
  Sabtu: 10:00 AM - 8:00 PM
  Ahad: 11:00 AM - 6:00 PM
```

##### Langkah 2: Persediaan Daftar
```yaml
Konfigurasi Daftar:
  Nama Daftar: Daftar 1
  Kod Daftar: REG001
  Lokasi: Kaunter Hadapan
  Pencetak Resit: Epson TM-T88V
  Laci Tunai: Auto-buka
  Pengimbas: Pengimbas Kod Bar USB
```

### Konfigurasi Cukai

```javascript
// Contoh Peraturan Cukai Malaysia
{
  "default_tax": {
    "rate": 0.06,
    "name": "SST",
    "type": "percentage"
  },
  "tax_rules": [
    {
      "category": "makanan",
      "rate": 0,
      "name": "Dikecualikan Makanan"
    },
    {
      "category": "mewah",
      "rate": 0.10,
      "name": "Cukai Mewah"
    }
  ]
}
```

## Panduan Operasi

### Operasi Harian

#### Prosedur Pembukaan
1. **Mula Syif**
   - Log masuk ke sistem POS
   - Kira apungan tunai pembukaan
   - Masukkan jumlah apungan
   - Sahkan sambungan perkakasan

#### Semasa Operasi

**Memproses Jualan**
1. Imbas/cari produk
2. Gunakan diskaun jika berkenaan
3. Pilih kaedah pembayaran
4. Proses pembayaran
5. Cetak/e-mel resit

**Mengendalikan Pulangan**
1. Imbas resit atau cari transaksi
2. Pilih item untuk dipulangkan
3. Masukkan sebab pulangan
4. Proses bayaran balik

#### Prosedur Penutupan
**Tamat Syif**
- Kira laci tunai
- Rekonsiliasi pembayaran
- Jana laporan Z
- Selamatkan tunai dalam peti besi

### Laporan & Analitik

#### Laporan Jualan
- Ringkasan jualan harian
- Analisis jualan mengikut jam
- Prestasi produk
- Analisis kategori
- Prestasi kakitangan

#### Laporan Inventori
- Tahap stok
- Laporan pergerakan
- Analisis susut nilai
- Cadangan pesanan semula

## Integrasi

### Integrasi E-dagang
Segerakkan inventori dalam talian dan luar talian secara masa nyata:

- Katalog produk bersatu
- Pengurusan inventori terpusat
- Harga merentas saluran
- Profil pelanggan omnichannel

### Integrasi Perakaunan
Modul POS secara automatik segerak dengan Perakaunan Kewangan:
- Jualan direkod sebagai hasil
- Cukai dikutip dijejaki secara berasingan
- Rekonsiliasi tunai ke akaun bank
- Pengiraan COGS inventori

## Amalan Terbaik

### Optimisasi Prestasi
1. **Optimisasi Pangkalan Data**
   - Penyelenggaraan indeks berkala
   - Arkib transaksi lama
   - Optimumkan carian produk

2. **Keselamatan**
   - Dasar kata laluan yang kuat
   - Pengesahan dua faktor
   - Audit kebenaran berkala

### Garis Panduan Latihan

#### Latihan Juruwang Baru
**Minggu 1: Asas**
- Navigasi sistem
- Carian produk
- Transaksi jualan asas
- Pemprosesan pembayaran

**Minggu 2: Lanjutan**
- Pulangan dan pertukaran
- Diskaun dan promosi
- Pengurusan pelanggan

## Sokongan & Sumber

- 📖 [Tutorial Video](/tutorials/pos/)
- 💬 [Forum Komuniti](https://forum.bigledger.com/pos)
- 📧 [Sokongan E-mel](mailto:pos-support@bigledger.com)
- 📞 Sokongan 24/7: +60-3-POS-HELP