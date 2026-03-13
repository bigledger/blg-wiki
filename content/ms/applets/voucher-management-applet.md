---
title: "Aplet Pengurusan Kupon (Voucher Management Applet)"
description: "Enjin komprehensif untuk mengurus kempen promosi, baucar diskaun, ganjaran kesetiaan berulang, dan tiket acara"
tags:
- pengurusan-kupon
- kempen-pemasaran
- tiket-acara
- program-kesetiaan
- promosi
weight: 70
---

## Tujuan dan Gambaran Keseluruhan

**Aplet Pengurusan Kupon (Voucher Management Applet)** adalah enjin promosi dan tiket yang berkuasa direka untuk memudahkan operasi pemasaran moden anda. Ia membolehkan pasukan Pemasaran dan Jualan mencipta peraturan diskaun yang sangat disesuaikan, menjana tiket kod QR yang unik, dan mengurus program kesetiaan automatik—semuanya tanpa memerlukan bantuan pembangun.

Aplet ini merapatkan jurang kritikal antara kempen pemasaran dan tempat jualan (POS) atau daftar keluar e-dagang, menyediakan pengesahan masa nyata dan penjejakan ROI untuk melindungi margin keuntungan anda.

{{< callout type="info" >}}
**Konsep Teras: Kempen vs Baucar vs Tiket**
- **Kempen (Peraturan):** Logik menyeluruh. Cth., "Diskaun 10% untuk semua kasut pada bulan Disember." Anda mengkonfigurasi *peraturan* di sini.
- **Baucar (Kod):** Rentetan alfanumerik sebenar (cth., `DEC10`) yang ditaip oleh pelanggan atau dikemukakan semasa daftar keluar.
- **Tiket (Pas):** Baucar khusus yang digunakan untuk kemasukan fizikal atau maya (cth., kod QR yang diimbas di pintu masuk acara).
{{< /callout >}}

{{< figure src="/images/voucher-management-applet/voucher-mastery-guide.png" alt="Menguasai Aplet Kupon: Jenis, Manfaat, dan Penyelesaian" caption="Panduan Komprehensif: Terokai model baucar yang berbeza dan penyelesaian perniagaan teras yang disediakan oleh aplet." >}}

---

## Konfigurasi Strategik: Membina Logik Baucar Anda

Mencipta baucar adalah lebih daripada sekadar mengisi borang—ia adalah tentang merekabentuk satu set peraturan kewangan yang melindungi margin keuntungan anda sambil menggembirakan pelanggan.

{{< callout type="tip" >}}
**Senarai Semak Penciptaan: Perkara yang Perlu Diketahui Sebelum Anda Bermula**
- [ ] **Objektif:** Adakah anda mencari kredit tunai (Penempatan), diskaun peratusan (Diskaun), atau mata kesetiaan (Ganjaran)?
- [ ] **Ekonomi:** Apakah "Harga" maksimum yang sanggup anda bayar untuk tindakan pelanggan ini?
- [ ] **Keselamatan:** Adakah kod ini memerlukan perlindungan tinggi (Softpin) atau ia adalah kod generik awam?
- [ ] **Garis Masa:** Bilakah *Kempen* bermula (tetingkap tuntutan) berbanding bila kod tersebut *Sah* (tetingkap penggunaan)?
{{< /callout >}}

### Langkah 1: Mendefinisikan Cetak Biru (Butiran Utama)

Bahagian ini mentakrifkan "Kad Pengenalan" baucar anda. Pilih tetapan anda dengan teliti, kerana sesetengah tetapan tidak boleh diubah setelah kempen dilancarkan.

| Tetapan | Kes Penggunaan Strategik | Keperluan Tindakan |
|:---:|---|:---:|
| **Kod Baucar** | "Kata Laluan" awam (cth., `SUMMER20`). | **TIDAK BOLEH DIUBAH:** Pilih dengan bijak. |
| **Jenis Baucar** | Pilih `Penempatan` untuk pulangan tunai atau `Diskaun` untuk promo berasaskan peraturan. | Wajib |
| **Nilai Muka** | **[Kredit Tunai]** Tetapkan jumlah mata wang yang tepat. Memberi kesan langsung kepada P&L. | Wajib untuk Penempatan |
| **Jenis Kuantiti** | `Fixed` untuk membina keterujaan berasaskan kekurangan; `Dynamic` untuk kempen tular tanpa had. | Pilihan |
| **Had Setiap Pengguna** | Mengelakkan "Coupon Stacking" dan penyalahgunaan oleh pengguna tunggal. **(Pro-Tip: Tetapkan kepada 1 untuk kod bernilai tinggi)**. | Disyorkan |
| **Benarkan Tanpa Nama** | Terbaik untuk aksesibiliti "Guest Checkout" e-dagang. | Suis |
| **Tempoh Acara** | "Tetingkap Promosi"—bila pengguna boleh melihat dan menuntut kod. | Julat Strategik |
| **Tetingkap Penggunaan** | "Tetingkap Penebusan"—bila kod tersebut benar-benar berfungsi semasa daftar keluar. | Julat Strategik |

---

## Memahami Jenis Baucar: Bila, Bagaimana, dan Kenapa?

Bukan semua promosi dicipta sama. Aplet ini menyediakan tiga **Jenis Baucar** yang berbeza untuk mengendalikan keperluan perniagaan yang berbeza. Memilih jenis yang betul memastikan medan UI dan logik daftar keluar yang betul digunakan.

### 1. Baucar Penempatan (Settlement Vouchers - Model "Kad Hadiah")
**Kenapa:** Gunakan ini apabila anda ingin mengeluarkan baucar dengan **nilai tunai tetap** yang bertindak seperti mata wang.
- **Cara ia berfungsi:** Anda menentukan **Face Value Amount** (cth., RM 50). Apabila ditebus, ia mengurangkan jumlah nilai invois mengikut nilai tetap tersebut. Tidak seperti diskaun, ini direkodkan sebagai penempatan pembayaran.
- **Terbaik untuk:** Kad hadiah, baucar pampasan, atau kredit kedai prabayar.

### 2. Baucar Diskaun (Discount Vouchers - Model "Kod Promo")
**Kenapa:** Gunakan ini untuk promosi pemasaran tradisional di mana diskaun bergantung pada **peraturan dan syarat**.
- **Cara ia berfungsi:** Anda menentukan **Rawatan** (Treatments) (cth., diskaun 20%) dan **Peraturan Permohonan** (cth., perbelanjaan minimum RM 100). Diskaun dikira *semasa* proses pengesahan troli.
- **Terbaik untuk:** Jualan bermusim, tawaran BOGO, atau kod rujukan influencer.

### 3. Baucar Ganjaran (Reward Vouchers - Model "Kesetiaan")
**Kenapa:** Gunakan ini untuk menjana **Mata Kesetiaan** dan bukannya (atau sebagai tambahan kepada) pengurangan harga.
- **Cara ia berfungsi:** Mencetuskan pengumpulan mata dalam sistem keahlian.
    - **Customer Points:** Mata diberikan kepada pengguna akhir.
    - **Retailer Points:** Mata diberikan kepada vendor/peruncit.
- **Logik Tamat Tempoh:** Anda boleh menetapkan "Mata Pelanggan Tamat Tempoh Dalam (hari)" untuk mewujudkan urgensi dalam program kesetiaan anda.
- **Terbaik untuk:** Ganjaran pencapaian keahlian atau mata kehadiran acara.

---

## Eksplorasi Ciri Utama

{{< cards >}}
  {{< card title="Kempen Baucar" subtitle="Cipta kod diskaun pelbagai peraturan yang kompleks" link="#untuk-pemasaran-cipta-kempen-kod-promo-jenis-diskaun" >}}

  {{< card title="Baucar Penempatan" subtitle="Keluarkan kad hadiah dengan nilai tetap" link="#untuk-kejayaan-pelanggan-keluarkan-baucar-penempatan-jenis-penempatan" >}}

  {{< card title="Kawalan Keselamatan" subtitle="Dayakan Softpins, Activation Pins, dan URL Keys" link="#eksplorasi-mendalam-konfigurasi-lanjutan" >}}

  {{< card title="Automasi Awalan" subtitle="Jana sekumpulan kod unik" link="#penjanaan-nombor-siri-logik-awalanprefix" >}}

  {{< card title="Kerangka Kejayaan" subtitle="Konfigurasi peraturan terperinci" link="#kerangka-kejayaan-9-tab" >}}

  {{< card title="Tetapan Sistem" subtitle="Suis ciri admin dan webhook" link="#konfigurasi--tetapan" >}}
{{< /cards >}}

{{< figure src="/images/voucher-management-applet/voucher-management-infographic.jpg" alt="Aplet Pengurusan Kupon - menghentikan manipulasi dan kebocoran dana dari diskaun bebas dan tamat tempoh" caption="Dari Kebocoran Margin ke Promosi Sempurna: Berhentikan gaya renyah mengawal aliran baucar, automasikan ROI Jualan Pasukan Pemasaran syarikat hari ini!" >}}

---

## Panduan Mula Pantas

### Untuk Pemasaran: Cipta Kempen Kod Promo (Jenis Diskaun)

**Matlamat:** Cipta kod promo "Black Friday" yang memberikan diskaun RM 50, tetapi hanya untuk pesanan melebihi RM 200.

1. Pergi ke **Voucher Management** dan klik **"+" (Tambah Baru)**.
2. Tetapkan **Voucher Type** kepada `DISCOUNT`.
3. Tetapkan Kod Baucar kepada `BF2024`.
4. Dalam **Apply Rules**, tetapkan `Minimum Spend` = `200`.
5. Dalam **Treatment Value**, tetapkan `Discount Amount` = `-50`.
6. Tetapkan status kepada **Published**.

{{< figure src="/images/voucher-management-applet/voucher-edit.png" alt="Borang Cipta Baucar" caption="Proses Rujukan Rekaan Kempen: Setup profil Kod beserta pertukaran aktif Suis Status" >}}

### Untuk Kejayaan Pelanggan: Keluarkan Baucar Penempatan (Jenis Penempatan)

**Matlamat:** Keluarkan baucar "Maaf" RM 50 kepada pelanggan tertentu yang berfungsi seperti tunai.

1. Klik **"+" (Tambah Baru)** dalam Voucher Management.
2. Tetapkan **Voucher Type** kepada `SETTLEMENT`.
3. Masukkan **Face Value Amount** = `50`.
4. (Pilihan) Dalam **Validity Target**, cari e-mel pelanggan tertentu untuk memastikan *hanya mereka* boleh menggunakannya.
5. Tetapkan status kepada **Published**.

---

## Eksplorasi Mendalam: Konfigurasi Lanjutan

### Kawalan Keselamatan & Privasi
- **Softpins:** Menjana PIN rahsia tambahan (6-30 aksara) yang diperlukan semasa penebusan untuk baucar keselamatan tinggi.
- **Activation Pins:** Memerlukan baucar "Diaktifkan" di tempat jualan menggunakan pin rahsia sebelum ia boleh digunakan.
- **URL Keys:** Menjana pautan unik "Satu-Klik Permohonan". Apabila pengguna klik pautan ini, baucar akan dimasukkan secara automatik ke dalam troli/sesi mereka.

### Penjanaan Nombor Siri (Logik Awalan/Prefix)
Apabila menjana sekumpulan baucar (cth., 1,000 kod), gunakan **Prefix Configuration** para memastikan rekod anda teratur.
- **Contoh:** Tetapkan Awalan kepada `VIP-` dan Panjang Aksara kepada `8`. Sistem akan menjana kod seperti `VIP-AX72J9K1`.

### Kerangka Kejayaan 9-Tab

Gabungkan lapisan-lapisan ini untuk membina promosi yang mantap.

| Lapisan Kerangka | Apa yang sebenarnya anda kawal |
|:---:|---|
| **1. Cetak Biru** | Identiti, Jenis, dan had Pelepasan Global. |
| **2. Masa** | Tetingkap Tuntutan berbanding Penebusan. |
| **3. Khalayak** | Siapa yang dijemput? (VIP, Pengguna Baru, atau Semua Orang). |
| **4. Peraturan Halangan** | Syarat "Buka Kunci" (cth., "Belanja sekurang-kurangnya RM100"). |
| **5. Had Bajet** | Jumlah pendedahan kewangan (cth., "Berhenti selepas 500 penebusan"). |
| **6. Sasaran Item** | Apa yang layak? (Seluruh kedai vs Item Pembersihan tertentu). |
| **7. Matematik Ganjaran** | Matematik sebenar (Diskaun RM, % diskaun, atau Mata Kesetiaan). |
| **8. Pengecualian** | Logik "If/Then" lanjutan untuk kes-kes khas. |
| **9. Geografi** | Sekatan POS/Cawangan (cth., "Atas talian sahaja" atau "Cawangan Pavilion sahaja"). |

{{< figure src="/images/voucher-management-applet/voucher-edit-details.png" alt="Konfigurasi 9-Tab" caption="Teras Enjin Konfigurasi 9-Tab: Pembinaan integrasi kombinasi limitasi/sasaran mencipta promosi kempen Anti-godam/Bocor di setiap inci aliran niaga" >}}

---

## Konfigurasi & Tetapan

Navigasi ke **Settings** dalam bar sisi aplet untuk mengkonfigurasi tingkah laku global.

{{< figure src="/images/voucher-management-applet/applet-settings.png" alt="Menu Tetapan" caption="Modul Pelarasan Setting Aplikasi : Ubah Ciri Cipta Dan Bentuk paparan UI Pemasaran Organisasi Mengikut Skala Kemahuan Ditetapkan oleh Jawatan Masing-Masing." >}}

### Kebolehlihatan Ciri (Feature Visibility)
- **Sembunyikan Jenis Penempatan/Ganjaran:** Jika perniagaan anda tidak menggunakan mata kesetiaan atau kad hadiah, admin boleh menyembunyikan pilihan ini daripada skrin "Baucar Baru" untuk mengelakkan kakitangan tersalah pilih jenis.

---

## Soalan Lazim (FAQ)

**S: Bolehkah saya menukar jenis baucar selepas ia dicipta?**  
J: Tidak. Kerana logik (Nilai Muka vs Peraturan Rawatan) adalah berbeza secara asas, anda mesti memilih jenis yang betul pada permulaan.

**S: Apakah yang berlaku jika pelanggan menggunakan baucar Penempatan pada jumlah yang kurang daripada nilai baucar?**  
J: Baucar meliputi jumlah penuh. Bergantung pada konfigurasi POS anda, baki selebihnya sama ada boleh dilupuskan atau disimpan untuk kegunaan masa depan.

**S: Bagaimana mata Ganjaran diberikan?**  
J: Apabila baucar jenis **Reward** ditebus, mata akan ditambah secara automatik ke profil pelanggan dalam **Membership Admin Applet**.

---
