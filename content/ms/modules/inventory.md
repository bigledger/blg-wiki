---
title: "Pengurusan Inventori"
draft: true  # unpublished 2026-09-07: its English original (content/en/modules/inventory.md) was archived with the modules-tree consolidation — planning/specs/modules-tree-consolidation.md; retranslate from the rebuilt English module page
description: "Penjejakan inventori masa nyata, pengurusan gudang, dan pengoptimuman rantaian bekalan"
weight: 40
---

# Modul Pengurusan Inventori

## Gambaran Keseluruhan

Modul Pengurusan Inventori BigLedger menyediakan kawalan komprehensif ke atas keseluruhan rantaian bekalan anda, dari perolehan hingga pengurusan gudang hingga pemenuhan pesanan. Dengan penjejakan masa nyata, ramalan pintar, dan integrasi yang lancar merentasi semua saluran, ia memastikan tahap stok optimum sambil meminimumkan kos pembawaan.

## Ciri-ciri Utama

### 📦 Pengurusan Produk

#### Maklumat Produk
- **Data Induk**: SKU, kod bar, penerangan
- **Varian Produk**: Saiz, warna, gaya, bahan
- **Bundle Produk**: Pengurusan kit dan pemasangan
- **Penjejakan Siri/Lot**: Kebolehjejakan penuh
- **Pengurusan Tarikh Luput**: Sokongan FEFO/FIFO
- **Multi-UOM**: Berbilang unit ukuran
- **Imej Produk**: Berbilang imej setiap produk
- **Atribut Tersuai**: Konfigurasi medan fleksibel

#### Kategori Produk
- **Struktur Hierarki**: Tahap kategori tanpa had
- **Peraturan Kategori**: Pengkategorian automatik
- **Rujukan Silang**: Kod produk alternatif
- **Kitaran Hayat Produk**: Pengenalan hingga pemberhentian

### 🏭 Pengurusan Gudang

#### Sokongan Multi-Lokasi
- **Berbilang Gudang**: Lokasi tanpa had
- **Zon & Bin**: Penjejakan lokasi terperinci
- **Gudang Maya**: Konsainmen, stok transit
- **Lokasi Kedai**: Lantai runcit dan bilik belakang
- **Integrasi 3PL**: Logistik pihak ketiga

#### Operasi Gudang
- **Penerimaan**: Penerimaan pesanan pembelian, pemeriksaan kualiti
- **Put-away**: Strategi put-away terarah
- **Pengambilan**: Pengambilan gelombang, batch, zon
- **Pembungkusan**: Pengesahan pek, label penghantaran
- **Penghantaran**: Integrasi pembawa, penjejakan
- **Pengiraan Kitaran**: Ketepatan inventori berterusan
- **Pemindahan Stok**: Pergerakan antara gudang

### 📊 Kawalan Inventori

#### Pengurusan Stok
- **Tahap Masa Nyata**: Kemaskini inventori langsung
- **Penilaian Stok**: FIFO, LIFO, Kos Purata
- **Tahap Min/Max**: Titik pesanan semula automatik
- **Stok Keselamatan**: Pengiraan penampan
- **Analisis ABC**: Klasifikasi produk
- **Penuaan Stok**: Pengenalpastian pergerakan perlahan
- **Stok Negatif**: Kawalan dan pencegahan

#### Penjejakan Inventori
- **Sejarah Transaksi**: Jejak audit lengkap
- **Pergerakan Stok**: Penjejakan terperinci
- **Pelarasan**: Kod sebab, kelulusan
- **Pengambilan Stok**: Kiraan penuh dan kitaran
- **Analisis Varians**: Kiraan vs sistem
- **Rekonsiliasi**: Pengesahan berbilang tahap

### 🚚 Pengurusan Rantaian Bekalan

#### Perolehan
- **Permintaan Pembelian**: Permintaan automatik
- **Pesanan Pembelian**: Sumber berbilang vendor
- **Pengurusan Vendor**: Penjejakan prestasi
- **Senarai Harga**: Harga khusus vendor
- **Pengurusan Masa Pimpinan**: Penjadualan penghantaran
- **Pesanan Selimut**: Perjanjian jangka panjang
- **Drop Shipping**: Pemenuhan vendor langsung

#### Perancangan Permintaan
- **Ramalan**: Ramalan berkuasa AI
- **Pelarasan Bermusim**: Corak sejarah
- **Analisis Trend**: Unjuran pertumbuhan
- **Optimisasi Pesanan Semula**: Kuantiti pesanan ekonomi
- **MRP**: Perancangan keperluan bahan
- **Perancangan Bekalan**: Penjadualan pengeluaran

### 📈 Analitik & Pelaporan

#### Analitik Inventori
- **Kadar Pusing Ganti**: Metrik kecekapan
- **Kos Pembawaan**: Analisis jumlah kos
- **Analisis Kehabisan Stok**: Penjejakan jualan hilang
- **Inventori Berlebihan**: Pengenalpastian stok berlebihan
- **Analisis Halaju**: Penggerak pantas/perlahan
- **Keuntungan**: Analisis margin produk

#### Laporan Operasi
- Laporan Status Stok
- Sejarah Pergerakan
- Analisis Penuaan
- Laporan Pesanan Semula
- Laporan Penilaian
- Laporan Varians
- Laporan Lokasi
- Laporan Luput

## Konfigurasi

### Persediaan Awal

#### Langkah 1: Konfigurasi Gudang

```yaml
Persediaan Gudang:
  Gudang Utama:
    Kod: WH001
    Nama: Pusat Pengedaran Pusat
    Alamat: 123 Jalan Logistik
    Jenis: Pusat Pengedaran
    Zon:
      - nama: Penerimaan
        bin: [R01-R10]
      - nama: Penyimpanan
        bin: [A01-Z99]
      - nama: Penghantaran
        bin: [S01-S20]
```

#### Langkah 2: Konfigurasi Produk

```javascript
{
  "product": {
    "sku": "PROD-001",
    "name": "Widget Standard",
    "category": "Widget",
    "tracking": "lot",
    "uom": {
      "base": "Setiap",
      "alternates": [
        {"unit": "Kotak", "conversion": 12},
        {"unit": "Palet", "conversion": 144}
      ]
    },
    "stock_levels": {
      "min": 100,
      "max": 500,
      "reorder_point": 150,
      "safety_stock": 50
    }
  }
}
```

### Dasar Inventori

#### Kaedah Penilaian Stok

| Kaedah | Penerangan | Terbaik Untuk |
|--------|------------|---------------|
| FIFO | Masuk Pertama, Keluar Pertama | Barang mudah rosak |
| LIFO | Masuk Terakhir, Keluar Pertama | Barang tidak mudah rosak |
| Kos Purata | Purata berwajaran | Harga stabil |
| Pengenalpastian Khusus | Penjejakan kos sebenar | Item bernilai tinggi |

#### Strategi Pesanan Semula

1. **Kuantiti Pesanan Tetap**
   - Pesan kuantiti sama setiap kali
   - Apabila stok mencapai titik pesanan semula

2. **Tempoh Pesanan Tetap**
   - Pesan pada selang masa biasa
   - Kuantiti berubah-ubah

3. **Min-Max**
   - Pesan apabila di bawah minimum
   - Pesan sehingga maksimum

4. **Kuantiti Pesanan Ekonomi (EOQ)**
   - Saiz pesanan optimum
   - Minimumkan jumlah kos

## Operasi

### Operasi Harian

#### Proses Penerimaan

1. **Pra-Penerimaan**
   - ASN (Notis Penghantaran Lanjutan)
   - Penjadualan dok
   - Peruntukan sumber

2. **Penerimaan**
   - Imbasan kod bar
   - Pengesahan kuantiti
   - Pemeriksaan kualiti
   - Pelaporan percanggahan

3. **Put-away**
   - Penugasan lokasi
   - Pencetakan label
   - Penjejakan pergerakan

#### Pemenuhan Pesanan

1. **Pemprosesan Pesanan**
   - Peruntukan inventori
   - Penjanaan senarai ambil
   - Perancangan gelombang

2. **Pengambilan**
   - Pengoptimuman laluan ambil
   - Pengambilan batch
   - Pengesahan ambil

3. **Pembungkusan & Penghantaran**
   - Pengesahan pek
   - Pencetakan label
   - Pemilihan pembawa
   - Kemaskini penjejakan

### Pengiraan Kitaran

#### Perancangan Kiraan
- Kekerapan berasaskan ABC
- Kiraan berasaskan lokasi
- Persampelan rawak
- Kiraan berasaskan pengecualian

#### Proses Kiraan
1. Jana helaian kiraan
2. Bekukan inventori
3. Kiraan fizikal
4. Masukkan keputusan
5. Semakan varians
6. Kelulusan pelarasan
7. Kemaskini rekod

## Integrasi

### Modul BigLedger

- **Jualan/POS**: Ketersediaan masa nyata
- **Pembelian**: Perolehan automatik
- **Pembuatan**: Ketersediaan komponen
- **Perakaunan Kewangan**: Penilaian inventori
- **CRM**: Maklumat produk
- **E-dagang**: Inventori multi-saluran

### Sistem Luaran

#### Pembawa Penghantaran
- Pos Malaysia
- DHL
- FedEx
- UPS
- Pembawa serantau

#### Marketplace
- Shopee
- Lazada
- Amazon
- eBay
- Platform tempatan

## Amalan Terbaik

### Ketepatan Inventori

1. **Pengiraan Kitaran Berkala**
   - Harian untuk item A
   - Mingguan untuk item B
   - Bulanan untuk item C

2. **Disiplin Proses**
   - Imbas semua
   - Kemaskini masa nyata
   - Pengendalian pengecualian
   - Pematuhan latihan

### Strategi Pengoptimuman

1. **Analisis ABC**
   - Item A (20%): 80% daripada nilai
   - Item B (30%): 15% daripada nilai
   - Item C (50%): 5% daripada nilai

2. **Pengoptimuman Stok Keselamatan**
   - Sasaran tahap perkhidmatan
   - Variabiliti masa pimpinan
   - Variabiliti permintaan
   - Pertimbangan kos

## Ciri Lanjutan

### Automasi

#### Pengisian Semula Automatik
- Penginderaan permintaan
- Penjanaan PO automatik
- Inventori yang diurus vendor
- Cross-docking

#### Automasi Gudang
- Integrasi WMS
- Imbasan RF
- Pengambilan suara
- Antara muka robotik
- Sistem konveyor

### Kebolehjejakan

#### Penjejakan Lot/Siri
- Genealogi lengkap
- Pengurusan penarikan balik
- Penjejakan waranti
- Pelaporan pematuhan

#### Rantaian Jagaan
- Penjejakan suhu
- Sejarah lokasi
- Penjejakan pengendali
- Cap masa

## Inventori Mudah Alih

### Ciri
- Imbasan kod bar
- Kiraan stok
- Pemindahan
- Pelarasan
- Penerimaan
- Carian lokasi

### Sokongan Perkakasan
- Pengimbas Android
- Peranti iOS
- Windows Mobile
- Senapang RF khusus

## Penyelesaian Masalah

### Isu Biasa

| Isu | Punca | Penyelesaian |
|-----|-------|-------------|
| Percanggahan stok | Pergerakan tidak direkod | Laksanakan imbasan, latihan |
| Kehabisan stok | Ramalan lemah | Laraskan stok keselamatan, masa pimpinan |
| Inventori berlebihan | Pesanan berlebihan | Semak tahap min/max |
| Pengambilan perlahan | Susun atur lemah | Optimumkan laluan ambil, lokasi |
| Varians kiraan | Ralat proses | Latihan, semakan proses |

## Sokongan & Sumber

- 📚 [Amalan Terbaik Inventori](/docs/best-practices/inventory/)
- 🎥 [Video Latihan](/tutorials/inventory/)
- 📊 [Templat Laporan](/templates/inventory/)
- 📧 [Sokongan](mailto:inventory-support@bigledger.com)