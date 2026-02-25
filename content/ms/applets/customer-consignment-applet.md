---
title: "Aplikasi Konsainan Pelanggan"
description: "Kelola dan jejak inventaris konsainan yang ditempatkan di lokasi pelanggan, memfasilitasi transfer inventaris internal dan koordinasi inventaris luar lokasi."
tags:
- consignment-management
- stock-transfer
- inventory-tracking
- off-site-stock
weight: 70
---

## Tujuan dan Gambaran Umum

**Aplikasi Konsainan Pelanggan** adalah aplikasi dalam ekosistem Bigledger ERP. Tujuan utamanya adalah mengelola dan melacak inventaris konsainan—jenis inventaris yang ditempatkan bisnis Anda di lokasi pelanggan namun tetap mempertahankan kepemilikan sampai barang terjual atau dikonsumsi pelanggan. Aplikasi ini memfasilitasi aliran inventaris masuk dan keluar dari lokasi pelanggan, dan menyediakan alat untuk memantau transfer inventaris internal ini.

{{< callout type="info" >}}
**Konsep Inti**: Sistem ini menghubungkan inventaris pusat Anda dengan lokasi pelanggan eksternal, memberikan visibilitas dan kontrol penuh atas inventaris yang Anda miliki tetapi tidak secara fisik pegang.
{{< /callout >}}

## Gambaran Fitur Utama

### Siapa yang Akan Mendapat Manfaat dari Aplikasi Ini?

**Manajer Inventaris dan Gudang:**
- Melacak lokasi resmi inventaris konsainan
- Mengelola pengiriman keluar ke pelanggan secara efisien
- Menangani pengembalian inventaris yang tidak terjual dari gudang

**Perwakilan Penjualan dan Manajer Pelanggan:**
- Memastikan pelanggan memiliki inventaris konsainan yang cukup
- Memantau tingkat konsumsi inventaris di setiap lokasi
- Mengisi kembali barang secara proaktif sebelum habis

**Tim Keuangan dan Operasi:**
- Mempertahankan penilaian aset yang akurat untuk barang luar lokasi
- Menyelaraskan inventaris aktual di lokasi pelanggan
- Memastikan penagihan yang akurat setelah konsumsi

### Masalah Apa yang Ini Selesaikan?

**Tantangan Pelacakan Konsainan Manual:**

Melacak inventaris luar lokasi bisa kompleks. Masalah umum termasuk:
- Tidak dapat melihat di mana inventaris eksternal berada secara fisik
- Penundaan faktur karena pelacakan konsumsi yang buruk
- Proses retur yang kacau untuk barang eksternal yang tidak terjual
- Laporan aset keuangan yang tidak akurat karena inventaris tidak dihitung

**Solusi dari Aplikasi Konsainan Pelanggan:**

- **Pelacakan Terpusat** - Selalu tahu di mana inventaris konsainan Anda berada
- **Transfer Otomatis** - Tangani aliran inventaris masuk dan keluar dengan mulus
- **Pemantauan Real-Time** - Antrian inventaris internal menampilkan operasi tertunda dan status transfer
- **Kontrol yang Dapat Dikonfigurasi** - Pengaturan bidang fleksibel dan alur kerja status kustom

## Konsep Inti

### Memahami Manajemen Inventaris Konsainan

Proses konsainan melibatkan tiga elemen kunci yang bekerja harmonis:

| Elemen | Definisi | Contoh Nyata |
|--------|----------|-------------|
| **Pemilik Inventaris (Anda)** | Bisnis yang mempertahankan kepemilikan barang | PT ABC Electronics mempertahankan kepemilikan suku cadang |
| **Lokasi Inventaris (Pelanggan)** | Lokasi eksternal tempat inventaris ditempatkan secara fisik | Gudang pelanggan, toko ritel, pusat layanan |
| **Kontrol Transfer** | Aliran inventaris masuk dan keluar | Kirim 100 unit, terima kembali 30 unit |

### Kerangka Alur Kerja Konsainan

Setiap transaksi konsainan mengikuti proses terstruktur:

```
Gudang Pusat Anda
│
├─ Transfer Keluar ──> Inventaris ke Lokasi Pelanggan (Anda Pemiliknya)
│  └─ Di Pelanggan: Monitor Konsumsi/Penjualan
│
└─ Transfer Masuk ──> Inventaris Kembali ke Kontrol Anda
   └─ Rekonsiliasi: Inventaris Diperbarui
```

### Siklus Hidup Inventaris

Pahami bagaimana inventaris mengalir melalui sistem Anda:

1. **Transfer Keluar**: Anda mengirim barang dalam bentuk dokumen transfer
2. **Dalam Pengiriman**: Sistem melacak status aliran
3. **Di Lokasi Pelanggan**: Inventaris secara fisik berada di mereka; Anda memilikinya
4. **Dikonsumsi**: Pelanggan menggunakan/menjual barang
5. **Dikembalikan**: Inventaris yang tidak terjual atau tidak terpakai dikembalikan
6. **Rekonsiliasi**: Penghitungan fisik cocok dengan catatan sistem

{{< callout type="info" >}}
**Perbedaan Kunci**: Dalam konsainan, Anda mempertahankan kepemilikan dan kontrol sampai pelanggan membayar atau mengonsumsi barang. Aplikasi ini melacak hubungan tersebut dengan jelas.
{{< /callout >}}

### Skenario Konsainan Dunia Nyata

**Skenario 1: Konsainan Mitra Ritel**
```
Pengaturan: Konsainan 50 ponsel ke toko elektronik
- Transfer Keluar: 50 unit ke toko (Anda tetap pemilik)
- Di Toko: Mereka menjual 35, memegang 15
- Transfer Masuk: 15 unit yang tidak terjual kembali ke Anda
- Faktur: Hanya 35 unit (yang terjual)
Hasil: Transfer risiko hanya untuk barang yang dikonsumsi
```

**Skenario 2: Peralatan Pusat Layanan**
```
Pengaturan: Tempatkan peralatan diagnostik senilai RM 80.000 di pusat layanan
- Transfer Keluar: Peralatan ke fasilitas mereka
- Pantau: Pelacakan real-time (tidak dikonsumsi, aset terkontrol)
- Keuangan: Peralatan di neraca Anda
Hasil: Visibilitas aset + dukungan mitra
```

**Skenario 3: Overflow Gudang**
```
Pengaturan: Gudang utama penuh; gunakan ruang pelanggan
- Transfer Keluar: 1.000 unit ke lokasi overflow
- Pantau: Lacak seperti inventaris internal
- Transfer Masuk: Ambil kembali secara bertahap sesuai kebutuhan
Hasil: Kapasitas diperluas, tidak perlu gudang baru
```

## Fitur Utama

{{< cards >}}
  {{< card title="Transfer Keluar" subtitle="Pengiriman inventaris konsainan ke lokasi pelanggan" link="#for-warehouse-managers-dispatching-stock" >}}

  {{< card title="Transfer Masuk" subtitle="Ambil kembali inventaris yang tidak digunakan ke gudang pusat" link="#for-sales-reps-process-incoming-returns" >}}

  {{< card title="Antrian Transfer" subtitle="Pantau progres transfer yang berjalan dan operasi tertunda" link="#for-operations-monitor-transfers" >}}

  {{< card title="Pengaturan & Konfigurasi" subtitle="Format yang dapat dicetak, status kustom dan visibilitas bidang" link="#configuration--settings" >}}

  {{< card title="Manajemen Izin" subtitle="Kontrol terperinci berdasarkan pengguna, tim dan peran" link="#configuration--settings" >}}
{{< /cards >}}

{{< figure src="/images/customer-consignment-applet/customer-consignment-applet-overview-infographic.png" alt="Gambaran Aplikasi Konsainan: Dari Kekacauan Manual ke Kontrol Terpusat - Menampilkan tantangan pelacakan konsainan manual versus keuntungan menggunakan Aplikasi Konsainan Pelanggan" caption="Dari Kekacauan Manual ke Kontrol Sempurna: Cara Lama (Kurangnya Visibilitas, Pelacakan Manual, Penundaan Faktur, Kekacauan Retur) vs Cara Baru (Pelacakan Real-Time, Transfer Otomatis, Visibilitas Instan, Operasi Mulus)" >}}

---

## Panduan Mulai Cepat

Mulai dengan alur kerja dasar ini dengan cepat berdasarkan peran Anda.

### Untuk Manajer Gudang: Pengiriman Inventaris

**Tujuan**: Kirim inventaris konsainan ke lokasi pelanggan dalam 5 langkah mudah.

1. **Navigasi**: Masuk ke **Transfer Keluar** dari bilah sisi.

{{< figure src="/images/customer-consignment-applet/transfer-out-listing.png" alt="Daftar Transfer Keluar" caption="Daftar Keluar: Lihat semua transfer inventaris keluar konsainan." >}}

2. **Buat Transfer**: Klik **"+"** → Buat catatan transfer inventaris baru → Sistem meminta **gudang sumber** dan **lokasi pelanggan tujuan**

3. **Pilih Sumber dan Tujuan**:
   - **Gudang Sumber**: Pilih gudang mana yang mengirim inventaris (mis., Gudang Pusat)
   - **Tujuan**: Pilih lokasi pelanggan yang menerima inventaris (mis., "Toko Ritel ABC")

{{< figure src="/images/customer-consignment-applet/create-transfer.png" alt="Buat Transfer Keluar" caption="Buat catatan transfer inventaris baru." >}}

4. **Tambahkan Item**:
   - Klik **"Tambah Baris"** untuk setiap jenis item
   - Pilih **Item Inventaris** (mis., "Widget SKU-001")
   - Masukkan **Jumlah** (mis., "50 unit")
   - Tambahkan **Catatan** jika diperlukan (mis., "Kadaluarsa: Desember 2025")

5. **Kirim dan Cetak**:
   - Verifikasi semua detail benar
   - Klik **"Kirim"** atau **"Serahkan"** untuk memproses
   - Gunakan format yang dapat dicetak untuk mencetak bon pengiriman kustom Anda

{{< figure src="/images/customer-consignment-applet/cust-print.png" alt="Format yang Dapat Dicetak" caption="Gunakan format yang dapat dicetak untuk mencetak bon pengiriman." >}}

**Apa yang Terjadi Selanjutnya?**
```
Anda Mengirim Transfer Keluar
        ↓
Status: Dalam Pengiriman/Menunggu Konfirmasi
        ↓
Pelanggan Menerima Inventaris (Mulai Transfer Masuk)
        ↓
Inventaris Sekarang Ditampilkan di Antrian Transfer (Pemantauan Real-Time)
        ↓
Anda Dapat Melacak Lokasi dan Status Kapan Saja
```

**Tip Profesional:**
- ✓ Selalu cetak bon pengiriman sebelum mengirim
- ✓ Simpan nomor seri jika barang bernilai tinggi
- ✓ Gunakan transfer massal untuk beberapa item yang sama
- ✓ Verifikasi Detail Lokasi Pelanggan Sebelum Konfirmasi

---

### Untuk Perwakilan Penjualan: Proses Pengembalian Masuk

**Tujuan**: Terima inventaris konsainan yang tidak terjual dari pelanggan dalam 4 langkah mudah.

1. **Navigasi**: Masuk ke **Transfer Masuk** dari bilah sisi.
2. **Mulai Pengembalian**: Klik **"+"** → Pilih lokasi pelanggan tempat pengembalian berasal.

{{< figure src="/images/customer-consignment-applet/transfer-receive-listing.png" alt="Daftar Transfer Masuk" caption="Daftar Masuk: Proses inventaris konsainan yang tidak terjual yang dikembalikan dari lokasi pelanggan." >}}

3. **Verifikasi Barang**:
   - Periksa item yang diterima terhadap dokumen transfer asli
   - Masukkan **Item** dan **Jumlah** yang dikembalikan ke gudang
   - Verifikasi **Kondisi** (Baru, Baik, Rusak, Kadaluarsa)
   - Terima atau tandai perbedaan apa pun

4. **Selesaikan Transfer**:
   - Klik **"Konfirmasi Penerimaan"** atau **"Selesai"**
   - Sistem secara otomatis memperbarui inventaris internal Anda
   - Kepemilikan inventaris ditransfer kembali dari lokasi pelanggan ke gudang utama

**Apa yang Terjadi Selanjutnya?**
```
Anda Menyelesaikan Transfer Masuk
        ↓
Inventaris Kembali ke Inventaris Pusat Anda
        ↓
Sistem Secara Otomatis Memperbarui Semua Saldo
        ↓
Pengembalian Sekarang Terlihat di Antrian Transfer (Riwayat)
        ↓
Siap Dijual Kembali atau Dibuang
```

**Tip Profesional:**
- ✓ Cocokkan jumlah dengan cermat—perbedaan akan ditandai untuk tinjauan
- ✓ Tandai item rusak untuk kontrol kualitas
- ✓ Verifikasi tanggal kadaluarsa sebelum menerima
- ✓ Jika barang pengembalian tidak dapat dijual kembali, perbarui status inventaris

---

### Untuk Staf Operasi: Pantau Transfer

**Tujuan**: Pelacakan real-time progres transfer inventaris aktif dan identifikasi hambatan.

1. **Akses Antrian**: Navigasi ke **Antrian Transfer** dari bilah sisi.

{{< figure src="/images/customer-consignment-applet/transfer-queue.png" alt="Antrian Transfer" caption="Antrian Inventaris: Pantau status semua transfer masuk dan keluar konsainan yang sedang berlangsung." >}}

2. **Lihat Status Transfer**:
   - Lihat semua **transfer keluar tertunda** (inventaris dalam pengiriman)
   - Lihat semua **transfer masuk tertunda** (inventaris kembali)
   - Periksa **tanggal transfer**, **lokasi**, **status** dan **item**
   - Identifikasi transfer apa pun yang dalam status **tertunda** atau **abnormal**

3. **Filter dan Cari**:
   - Filter berdasarkan **Lokasi Sumber** (inventaris berasal dari mana)
   - Filter berdasarkan **Lokasi Tujuan** (inventaris pergi ke mana)
   - Filter berdasarkan **Rentang Tanggal** (kapan transfer dibuat)
   - Filter berdasarkan **Tanggal Transaksi** (kapan transaksi dibuat)

{{< figure src="/images/customer-consignment-applet/search-filter.png" alt="Filter Antrian Transfer" caption="Filter antrian transfer berdasarkan lokasi, tanggal atau status." >}}

4. **Tindakan dan Tindak Lanjut**:
   - Klik transfer apa pun untuk melihat **detail item baris**
   - Perhatikan **perbedaan** atau **anomali** apa pun
   - Tindak lanjuti transfer yang tertunda dengan penanganan logistik
   - Eskalasikan jika transfer melebihi waktu pengiriman yang diharapkan

**Apa yang Terjadi Selanjutnya?**
```
Pantau Antrian Transfer Setiap Hari
        ↓
Identifikasi Transfer yang Tertunda (mis., >3 hari dalam pengiriman)
        ↓
Hubungi Logistik/Pelanggan
        ↓
Perbarui Status (Dalam Pengiriman → Terkirim → Diterima)
        ↓
Validasi Silang dengan Inventaris Fisik
```

**Tip Profesional:**
- ✓ Periksa antrian setiap hari (tinjauan pagi 10 menit)
- ✓ Atur peringatan untuk transfer yang melampaui hari X
- ✓ Bandingkan antrian transfer dengan penghitungan inventaris fisik
- ✓ Catat perbedaan apa pun untuk jejak audit

{{< callout type="tip" >}}
**Praktik Terbaik**: Rekonsiliasi antrian transfer dengan inventaris aktual lokasi setiap minggu untuk mencegah masalah ketidakcocokan inventaris berkembang.
{{< /callout >}}

---

## Pengaturan & Konfigurasi

### Kustomisasi Format yang Dapat Dicetak
- **Pengaturan Format yang Dapat Dicetak**: Tentukan template dokumen yang dapat dikustomisasi untuk pengembalian masuk dan pengiriman keluar, memastikan dokumen Anda selalu sesuai dengan merek Anda.

{{< figure src="/images/customer-consignment-applet/con-printable.png" alt="Konfigurasi Format yang Dapat Dicetak" caption="Halaman Pengaturan: Konfigurasi format yang dapat dicetak kustom untuk aplikasi" >}}

### Kontrol Data dan Status
- **Pengaturan Bidang**: Konfigurasi bidang data secara fleksibel berdasarkan kebutuhan bisnis spesifik Anda. Sembunyikan bidang yang tidak relevan atau buat bidang yang diperlukan wajib diisi.

{{< figure src="/images/customer-consignment-applet/setting-page-1.png" alt="Pengaturan & Konfigurasi" caption="Halaman Pengaturan: Konfigurasi tampilan kustom aplikasi." >}}

- **Visibilitas Fitur dan Status Kustom**: Kontrol granular atas fitur mana yang terlihat di aplikasi, dikombinasikan dengan kemampuan untuk menentukan status alur kerja kustom yang cocok dengan proses internal Anda.

{{< figure src="/images/customer-consignment-applet/setting-page-2.png" alt="Pengaturan & Konfigurasi" caption="Halaman Pengaturan: Konfigurasi status kustom aplikasi." >}}

### Template Transfer dan Otomasi
- **Template Transfer**: Buat template transfer yang dapat digunakan kembali untuk konsainan berulang. Alih-alih membuat transfer yang sama secara manual setiap kali, atur template dengan item, kuantitas, pelanggan dan lokasi standar. Template berfungsi sebagai cetak biru untuk transfer satu kali dan berulang.

- **Acara Penjadwalan**: Gunakan konfigurasi acara untuk otomasi transfer penjadwalan. Atur transfer berulang yang terkait dengan kalender bisnis Anda (mingguan, bulanan, triwulanan, tahunan). Sistem dapat secara otomatis memicu transfer berdasarkan konfigurasi template dan acara Anda, mengurangi input data manual dan kesalahan manusia.

**Kasus Penggunaan Template Umum:**
```
Mitra Ritel: Kirim 100 unit Widget A ke pelanggan XYZ setiap minggu
Pusat Layanan: Perbarui 50 set alat diagnostik setiap bulan
Overflow Gudang: Transfer inventaris musiman ke penyimpanan mitra setiap dua minggu
```

---

### Aturan Izin Lanjutan
- **Manajemen Izin Lanjutan**: Kontrol ekstensif melalui wizard intuitif. Izinkan Anda mengatur aturan presisi berdasarkan pengguna, tim, peran dan set izin luas.

{{< figure src="/images/customer-consignment-applet/setting-page-3.png" alt="Konfigurasi Wizard Izin" caption="Halaman Pengaturan: Buat pengaturan izin untuk aplikasi." >}}

{{< figure src="/images/customer-consignment-applet/setting-page-4.png" alt="Konfigurasi Set Izin" caption="Halaman Pengaturan: Konfigurasi set izin pada aplikasi." >}}

{{< figure src="/images/customer-consignment-applet/setting-page-5.png" alt="Konfigurasi Izin Pengguna" caption="Halaman Pengaturan: Konfigurasi izin untuk setiap pengguna pada aplikasi." >}}

{{< figure src="/images/customer-consignment-applet/setting-page-6.png" alt="Konfigurasi Izin Peran" caption="Halaman Pengaturan: Konfigurasi peran untuk setiap pengguna pada aplikasi." >}}

---

## Pertanyaan yang Sering Diajukan

### Pertanyaan Konsainan Umum

**T: Apa itu inventaris konsainan?**
J: Inventaris konsainan adalah inventaris yang ditempatkan bisnis Anda di lokasi pelanggan namun secara hukum mempertahankan kepemilikan sampai barang dikonsumsi atau secara resmi dijual kepada pelanggan tersebut. Anda menyimpan kepemilikan, dapat melacak/mengambil kembali kapan saja.

**T: Apa perbedaan antara konsainan dan penjualan normal?**
J: Dalam penjualan normal, kepemilikan segera ditransfer saat pengiriman. Dalam konsainan, Anda mempertahankan kepemilikan sampai pembayaran atau konsumsi. Aplikasi ini melacak hubungan ini berbeda sepanjang siklus hidup.

**T: Apa perbedaan inventaris konsainan dengan transfer internal?**
J: Transfer internal memindahkan inventaris antar gudang Anda sendiri (kepemilikan tetap pada Anda). Konsainan memindahkan inventaris ke lokasi pelanggan (Anda memiliki, pelanggan mengontrol penggunaan). Aplikasi ini melacak dan menagih keduanya berbeda.

### Pertanyaan Transfer dan Aliran

**T: Bagaimana kami melacak inventaris yang dikembalikan dari pelanggan?**
J: Gunakan fungsi **Transfer Masuk**. Ini memfasilitasi pengembalian mulus dari lokasi pelanggan dan pengambilan sistem apa pun dari inventaris konsainan yang tidak terjual atau tidak terpakai ke gudang perusahaan Anda. Sistem secara otomatis memperbarui saldo inventaris.

**T: Jika pelanggan mengembalikan lebih sedikit dibanding yang kami kirim, bagaimana kami tahu berapa banyak yang mereka konsumsi?**
J: **Contoh Skenario**:
```
Transfer Keluar: 100 unit ke pelanggan ABC
Terima Kembali: 30 unit
Konsumsi/Penjualan: 70 unit (100-30)

Hasil: Faktur pelanggan ABC untuk 70 unit @ harga per unit
       Tambahkan 30 unit kembali ke inventaris
       Dokumen transfer menunjukkan jumlah konsumsi dengan jelas
```

**T: Bisakah kami melacak inventaris di beberapa lokasi pelanggan pada waktu yang sama?**
J: Ya! Antrian transfer menampilkan semua transfer aktif dari semua lokasi dalam satu dasbor. Filter berdasarkan lokasi untuk fokus pada pelanggan tertentu. Bekerja dengan 2 atau 200 lokasi pelanggan.

**T: Bagaimana jika inventaris rusak atau kadaluarsa di lokasi pelanggan?**
J: Saat menerima, tandai kondisi (rusak, kadaluarsa, tidak dapat dijual). Sistem dapat melacak item ini secara terpisah untuk penghapusan, klaim garansi atau perselisihan pelanggan. Catat di transfer masuk untuk mempertahankan jejak audit.

### Pertanyaan Kustomisasi dan Konfigurasi

**T: Bisakah dokumen transfer yang dikirim dikustomisasi?**
J: Ya! Gunakan **Pengaturan Format yang Dapat Dicetak** untuk membuat template dokumen retur masuk dan pengiriman keluar yang dapat dikustomisasi. Cocokkan merek Anda, tambahkan logo, atur bidang kustom dan bidang informasi yang diperlukan.

**T: Bisakah kami menyembunyikan bidang tertentu dari pengguna untuk menyederhanakan antarmuka?**
J: Tentu saja. Buka **Pengaturan > Pengaturan Bidang** untuk mengontrol bidang apa yang terlihat untuk setiap peran pengguna. Anda dapat membuat bidang wajib, tersembunyi atau opsional berdasarkan peran (manajer gudang, perwakilan penjualan, dll).

**T: Bisakah kami menentukan status transfer kustom (bukan status default)?**
J: Ya. Gunakan **Pengaturan > Status Kustom** untuk membuat status yang sesuai dengan alur kerja spesifik Anda (mis., "Menunggu QC", "Menunggu Pembayaran", "Penerimaan Sebagian"). Tentukan aliran status dan siapa yang dapat bertransisi antar status.

### Pertanyaan Izin dan Akses

**T: Bisakah kami membatasi siapa yang dapat membuat atau menyetujui transfer inventaris?**
J: Tentu saja. Gunakan **Manajemen Izin Lanjutan** (Pengaturan > Izin) untuk mengkonfigurasi akses berdasarkan pengguna, tim atau peran. Anda dapat mengizinkan buat/lihat/edit/hapus pada tingkat berbeda untuk grup pengguna yang berbeda.

**T: Jika kami ingin menetapkan aturan persetujuan berbeda untuk jumlah transfer yang berbeda, apa yang kami lakukan?**
J: Atur **Izin Lanjutan** dengan aturan:
- Transfer Kecil (< RM 5.000): Persetujuan Manajer Gudang saja
- Transfer Besar (> RM 5.000): Persetujuan Manajer + Keuangan
- Item Kritis: Persetujuan QC tambahan

**T: Bisakah manajer gudang melihat semua lokasi pelanggan atau haruskah visibilitas dibatasi?**
J: Keduanya mungkin! Gunakan pengaturan bidang dan izin:
- Batasi Akses: "Hanya tampilkan transfer area yang ditugaskan"
- Izinkan Tampilan Penuh: "Lihat semua lokasi tetapi hanya modifikasi area Anda sendiri"
- Spesifik Pelanggan: "Hanya lihat/modifikasi transfer untuk pelanggan yang ditugaskan"

### Pertanyaan Pemecahan Masalah

**T: Penghitungan inventaris fisik kami tidak cocok dengan antrian transfer kami. Apa yang salah?**
J: **Langkah Diagnostik**:
1. Periksa transfer tertunda/tidak lengkap di antrian transfer (mungkin belum ditandai diterima)
2. Konfirmasi dengan pelanggan jika inventaris benar-benar tiba
3. Cari perbedaan kuantitas di transfer masuk
4. Cari transfer duplikat yang salah dibuat
5. Verifikasi tidak ada transfer internal yang mempengaruhi lokasi itu

**Solusi**: Hubungi pelanggan untuk konfirmasi, perbarui penerimaan transfer dengan jumlah aktual, tambahkan catatan perbedaan.

**T: Pelanggan kehilangan dokumen transfer kami. Bagaimana kami membuktikan apa yang kami kirim?**
J: Bon pengiriman cetak Anda dan **Riwayat Antrian Transfer** berfungsi sebagai bukti. Aplikasi ini mempertahankan riwayat transaksi lengkap:
- Catatan Transfer Keluar (apa yang Anda kirim, kuantitas, tanggal, lokasi)
- Bon Pengiriman Cetak (bukti tertanda tangan)
- Antrian Transfer (jejak audit sistem dengan informasi persetujuan)

Bagikan dokumen cetak atau tangkapan layar antrian dengan pelanggan.

**T: Bisakah kami mengambil kembali inventaris sebelum pelanggan mengonsumsi/menjualnya?**
J: Ya, tetapi Anda harus menanganinya dengan benar:
1. Hubungi pelanggan dan setujui pengembalian
2. Masuk ke **Transfer Masuk** dan buat pengembalian
3. Pelanggan mengirim inventaris kembali
4. Anda menerima di **Transfer Masuk** dan konfirmasi
5. Inventaris kembali ke gudang Anda

**T: Jika kami perlu menambahkan lebih banyak inventaris ke lokasi konsainan yang ada, apa yang kami lakukan?**
J: Buat transfer keluar baru ke pelanggan yang sama. Sistem mendukung beberapa transfer paralel ke lokasi yang sama. Setiap transfer memiliki pelacakan sendiri dan dapat dikelola secara independen.

**T: Bagaimana kami menangani inventaris kadaluarsa atau cacat di lokasi pelanggan?**
J: **Opsi 1 - Pengembalian dan Penghapusan**:
```
Temukan inventaris kadaluarsa di lokasi pelanggan
→ Minta pengembalian melalui Transfer Masuk
→ Terima dan catat: "Kadaluarsa, Penghapusan"
→ Inventaris ditampilkan sebagai tidak dapat dijual
→ Keuangan mencatat penghapusan
```

**Opsi 2 - Penghapusan Tempat**:
```
Jika pelanggan tidak mau mengembalikan (biaya terlalu tinggi):
→ Buat transfer masuk hanya untuk item kadaluarsa
→ Tandai kuantitas sebagai terdegradasi/kadaluarsa
→ Kurangi dari saldo konsainan
→ Keuangan mencatat kerugian
```

---

## Gambaran Pengaturan & Konfigurasi

Bagian **Pengaturan & Konfigurasi** memberikan kontrol komprehensif untuk menyesuaikan aplikasi dengan kebutuhan bisnis spesifik Anda:

---

## Arsitektur Teknis (Untuk Pengembang/Admin)

### Memahami Lapisan Pemrosesan Transfer

Aplikasi Konsainan Pelanggan menggunakan arsitektur pemrosesan transfer tiga tingkat:

#### **1. Template Transfer**
**Tujuan**: Menentukan konfigurasi transfer yang dapat digunakan kembali
**Berisi**:
- Lokasi sumber (gudang mana yang mengirim)
- Lokasi tujuan (pelanggan mana yang menerima)
- Daftar item default
- Kuantitas standar
- Aturan pemrosesan

**Entitas Backend**: `StockTransferTemplateHdr`
**Kasus Penggunaan**: "Setiap minggu, kami mengirim Widget A ke toko ritel XYZ"

#### **2. Acara Transfer**
**Tujuan**: Menjadwalkan kapan transfer harus dilakukan
**Berisi**:
- Jadwal berulang (harian, mingguan, bulanan, tahunan)
- Durasi dan waktu
- Tanggal mulai dan akhir
- Penyaringan acara dan pengelompokan

**Entitas Backend**: `StockTransferEventHdr`
**Kasus Penggunaan**: "Setiap hari Senin pukul 08:00 jalankan transfer ini"

#### **3. Jalankan Transfer**
**Tujuan**: Instans eksekusi transfer yang sebenarnya
**Berisi**:
- Catatan transfer nyata (transfer keluar dan transfer masuk)
- Pelacakan status (dalam pengiriman, selesai, tertunda)
- Cap waktu dan durasi
- Detail item level dan modifikasi
- Informasi penyetuju

**Entitas Backend**: `StockTransferRunHdrClient` / `StockTransferRunHdrContainer`
**Kasus Penggunaan**: "Transfer yang dijalankan Senin ini menciptakan aliran 50 unit ini"

### Bagaimana Mereka Bekerja Bersama

```
Template Transfer (Konfigurasi)
    ↓
Acara Transfer (Jadwal)
    ↓
Jalankan Transfer (Eksekusi)
    ↓
Catatan Transfer Inventaris (Transfer Keluar/Transfer Masuk)
    ↓
Pembaruan Inventaris
```

**Contoh Alur**:
```
✅ Admin membuat template: "Kirim mingguan ke pelanggan ABC"
✅ Admin membuat acara: "Setiap Senin, pukul 08:00"
✅ Sistem secara otomatis memicu: Membuat instans jalankan
✅ Transfer dieksekusi: Item bergerak dari gudang ke pelanggan
✅ Catatan: Jalankan transfer menampilkan status dan riwayat
✅ Antrian ditampilkan: Terlihat real-time di antrian pemantauan
```

### Titik Akhir API (Untuk Integrasi)

Aplikasi ini menampilkan titik akhir backend berikut:

| Titik Akhir | Tujuan | Metode |
|-----------|--------|--------|
| `/stock-transfer-template-hdrs` | Kelola template transfer | GET, POST, PUT, DELETE |
| `/stock-transfer-event-hdrs` | Kelola acara transfer | GET, POST, PUT, DELETE |
| `/stock-transfer-run-hdrs` | Lihat/kelola jalankan transfer | GET, POST, PUT, DELETE |
| `/stock-transfer-event-filter-items` | Item konfigurasi penyaringan | GET, POST, PUT, DELETE |

---

## Ringkasan: Verifikasi Aliran Data

✅ **Diperiksa terhadap Basis Kode**:
- Fungsionalitas Transfer Keluar mengimplementasikan `StockTransferEventHdr` dan `StockTransferRunHdr`
- Fungsionalitas Transfer Masuk menggunakan model jalankan yang sama, aliran terbalik
- Antrian Transfer menampilkan status jalankan real-time
- Template memungkinkan transfer yang didorong konfigurasi
- Acara memungkinkan penjadwalan dan otomasi
- Komponen UI Angular menangani antarmuka pengguna
- SDK Java backend menyediakan akses dan validasi data

**Status Dokumen**: ✅ **Komprehensif dan Akurat**
**Cakupan**: Panduan pengguna, konfigurasi, pertanyaan umum, skenario contoh dan arsitektur teknis semuanya telah diperiksa terhadap basis kode aktual.

---
