---
title: "Internal Consignment GIN Applet"
description: "Cipta dan urus Nota Keluaran Barang (GIN) konsainan dengan keterlihatan penuh item dan penjejakan peringkat baris untuk operasi jualan"
tags:
  - applets
  - consignment
  - goods-issue-note
  - inventory-management
  - sales-operations
weight: 85
---

## Tujuan dan Gambaran Keseluruhan

**Internal Consignment GIN Applet** direka untuk merasionalkan pengurusan pengeluaran stok konsainan dalam organisasi anda. Ia membolehkan pasukan Jualan mencipta Nota Keluaran Barang (GIN) untuk item konsainan, menjejak semua pengeluaran konsainan dalam senarai berpusat, dan melihat maklumat baris-item terperinci bagi setiap transaksi.

{{< callout type="info" >}}
**Konsep Teras**: GIN konsainan merekodkan pengeluaran stok konsainan—barang yang anda pegang tetapi tidak miliki—ke lokasi dalaman, pelanggan, atau untuk aktiviti jualan tertentu. Ini mewujudkan jejak audit dan mengemas kini baki inventori konsainan.
{{< /callout >}}

## Gambaran Keseluruhan Ciri Utama

### Siapa yang Memperoleh Manfaat daripada Applet Ini?

**Wakil Jualan:**

- Cipta item GIN konsainan dengan pantas untuk demo pelanggan atau penempatan percubaan
- Jejak apa yang telah dikeluarkan kepada pelanggan atau lokasi mana
- Lihat butiran peringkat baris untuk susulan dan penyesuaian yang tepat

**Pengurus Jualan:**

- Pantau semua pengeluaran konsainan merentas pasukan
- Semak corak penggunaan stok konsainan
- Pastikan dokumentasi yang betul bagi item yang dikeluarkan dari konsainan

**Pasukan Gudang & Inventori:**

- Kekalkan rekod inventori konsainan yang tepat
- Sokong pengeluaran fizikal dengan dokumentasi yang betul
- Sesuaikan tahap stok konsainan dengan rekod GIN

**Kewangan & Operasi:**

- Jejak audit untuk penggunaan konsainan
- Sokong pengebilan bulanan dan penyesuaian pembekal
- Pematuhan terhadap penjejakan perjanjian konsainan

### Apakah Masalah yang Diselesaikan?

**Masalah Penjejakan Konsainan Manual:**

Mengurus stok konsainan tanpa sistem khusus membawa kepada:

- Rekod yang hilang atau tiada tentang apa yang dikeluarkan
- Kesukaran menyesuaikan stok fizikal dengan pengebilan pembekal
- Tiada keterlihatan ke mana item pergi
- Hamparan manual yang terdedah kepada ralat

**Penyelesaian Internal Consignment GIN Applet:**

- **Dokumentasi digital** - Cipta rekod GIN bagi setiap pengeluaran konsainan
- **Senarai berpusat** - Lihat semua item GIN konsainan di satu tempat
- **Keterlihatan baris-item** - Lihat tepat item dan kuantiti yang dikeluarkan
- **Pematuhan audit** - Jejak lengkap untuk penyesuaian pembekal dan audit dalaman
- **Aliran kerja berfokus jualan** - Direka untuk kecekapan pasukan Jualan

## Gambaran Keseluruhan Ciri Utama

{{< cards >}}
{{< card title="Internal Consignment GIN Listing" subtitle="Lihat semua dokumen GIN konsainan dengan carian lanjutan" link="#consignment-gin-listing" >}}

{{< card title="Cipta & Edit Consignment GIN" subtitle="Rekod pengeluaran stok konsainan dengan butiran pengepala, akaun dan baris" link="#creating-a-consignment-gin" >}}

{{< card title="Line Items" subtitle="Paparan khusus untuk cari dan urus butiran peringkat baris merentas semua GIN" link="#line-item-listing" >}}

{{< card title="Settings & Configuration" subtitle="Konfigurasi keterlihatan medan, pilihan lalai dan format boleh cetak" link="#configuration--settings" >}}
{{< /cards >}}

{{< figure src="/images/internal-consignment-gin-applet/internal-consignment-gin-overview-infographic.png" alt="Gambaran Keseluruhan Internal Consignment GIN Applet: Cabaran penjejakan konsainan manual vs penyelesaian applet, dan siapa yang mendapat manfaat" caption="Daripada Penjejakan Manual ke Kawalan Digital: Cabaran (rekod hilang, kesukaran penyesuaian, tiada keterlihatan, ralat hamparan) vs Penyelesaian (dokumentasi digital, senarai berpusat, keterlihatan baris-item, pematuhan audit). Siapa yang Mendapat Manfaat: Wakil Jualan, Pengurus Jualan, Gudang & Inventori, Kewangan & Operasi." >}}

## Konsep Utama

### Memahami Consignment GIN

**Nota Keluaran Barang (GIN)** untuk stok konsainan mendokumentasikan pelepasan item dari inventori konsainan. Berbeza dengan stok milik, item konsainan kekal sebagai harta pembekal sehingga digunakan atau dijual.

| Konsep             | Definisi                                                                | Contoh                                  |
| ------------------ | ----------------------------------------------------------------------- | --------------------------------------- |
| **Stok Konsainan** | Barang yang secara fizikal di lokasi anda tetapi dimiliki oleh pembekal | Produk pameran dari pengedar            |
| **GIN Konsainan**  | Dokumen yang merekodkan pengeluaran item konsainan                      | Mengeluarkan unit demo ke bilik pameran |
| **Baris Item**     | Item individu dan kuantiti pada GIN                                     | 5 unit Produk A, 3 unit Produk B        |

{{< callout type="tip" >}}
**Contoh Dunia Sebenar**: Wakil jualan mengeluarkan 10 unit demo Produk XYZ (APA) ke Kedai ABC untuk percubaan 30 hari (KENAPA). Sistem mencipta GIN konsainan, mengurangkan baki inventori konsainan, dan merekod transaksi untuk pengebilan pembekal apabila percubaan ditukar kepada jualan.
{{< /callout >}}

### Struktur GIN

```
Consignment GIN Header (Main Details)
│
├── Consignment GIN No (auto-generated)
├── Branch
├── Transaction Date
├── Currency
├── Purchaser
│
├── Account (Supplier/Entity)
│   ├── Bill To address
│   └── Ship To address
│
└── Lines (Line Items)
    ├── Item 1: Product, Quantity, Serial/Batch/Bin (if applicable)
    ├── Item 2: Product, Quantity, Pricing Details
    └── Item 3: Product, Quantity, Issue Link
```

**Aliran Melalui Hierarki:**

1. **Main Details**: Mengambil cawangan, tarikh transaksi, mata wang dan pembeli
2. **Account**: Pembekal (entiti) dan alamat bil/hantar
3. **Lines**: Produk tertentu, kuantiti, penetapan harga dan penjejakan serial/batch/bin pilihan
4. **Optional Tabs**: Payment, Department Hdr, Contra, Doc Link, Attachments, Export (boleh dikonfigurasi setiap tenant)

### Consignment vs. Stok Milik

| Aspek          | Stok Konsainan                              | Stok Milik                   |
| -------------- | ------------------------------------------- | ---------------------------- |
| **Pemilikan**  | Pembekal memiliki sehingga digunakan/dijual | Organisasi anda memiliki     |
| **Pembayaran** | Bayar apabila digunakan                     | Bayar apabila diterima       |
| **Impak GIN**  | Mengurangkan baki konsainan                 | Mengurangkan inventori milik |
| **Pengebilan** | Pembekal bil berdasarkan penggunaan         | Sudah dibayar                |

---

## Panduan Permulaan Pantas

Bermula dengan pantas menggunakan aliran kerja penting ini.

### Untuk Pengguna: Cipta GIN Konsainan Pertama Anda

**Matlamat:** Keluarkan stok konsainan dan cipta rekod GIN yang betul dalam 5 langkah.

1. **Navigasi**: Pergi ke **Internal Consignment GIN** dari bar sisi (landing lalai)
2. **Cipta Baru**: Klik butang **"+"** (Create) pada senarai
3. **Tab Main Details**:
   - Pilih **Branch** dan **Transaction Date**
   - Pilih **Currency**
   - Pilih **Purchaser**
4. **Tab Account**: Pilih **Supplier** (entiti), **Bill To** dan alamat **Ship To**
5. **Tab Lines**: Klik **Add Line** → Pilih **Item**, masukkan **Quantity** → Pilihan tambah Serial Number, Batch Number, Bin Number, Pricing Details atau Issue Link
6. **Cipta**: Klik **CREATE** (atau **RESET** untuk kosongkan)

{{< figure src="/images/internal-consignment-gin-applet/create-edit-form.png" alt="Borang Cipta/Edit Internal Consignment GIN dengan tab Main Details, Account, dan Lines" caption="Borang Cipta: Masukkan Main Details, Account (pembekal), dan Lines (item) untuk pengeluaran stok konsainan" >}}

**Apa yang berlaku seterusnya?** GIN dicipta dan anda dibawa ke paparan Edit. Gunakan **FINAL** untuk posting dokumen apabila sedia.

**Pro Tip:** Pastikan item dikonfigurasi sebagai item konsainan dan dikaitkan dengan pembekal yang betul sebelum mencipta GIN.

---

### Untuk Pengurus: Semak Senarai Consignment GIN

**Matlamat:** Lihat dan pantau semua dokumen GIN konsainan yang dicipta oleh pasukan anda.

1. **Buka Senarai**: Pergi ke **Internal Consignment GIN** dari bar sisi → senarai utama dibuka secara lalai
2. **Carian Lanjutan**: Gunakan penapis untuk **Consignment GIN No**, **Branch Name**, **Supplier Name**, **Created Date**, **Transaction Date** atau **Created by**
3. **Semak Butiran**: Klik pada mana-mana baris untuk membuka paparan Edit dengan pengepala, akaun dan baris item penuh
4. **Post Dokumen**: Pilih rekod dan klik **FINAL** untuk posting GIN
5. **Export** (tab Edit): Gunakan tab Export apabila melihat GIN untuk menjana format PDF boleh cetak

**Apa yang boleh anda lakukan:** Gunakan senarai untuk menjejak aktiviti, kenal pasti pembekal penggunaan tinggi dan sediakan penyesuaian pembekal.

---

### Untuk Staf Gudang: Penuhi Consignment GIN

**Matlamat:** Keluarkan stok konsainan secara fizikal dan pastikan dokumentasi sepadan.

1. **Terima Notifikasi**: GIN dicipta oleh Jualan (atau semak senarai tertunda)
2. **Pilih Item**: Cari stok konsainan dan pilih kuantiti mengikut baris item
3. **Sahkan**: Semak silang kuantiti dan nombor siri dengan GIN
4. **Keluarkan**: Lepaskan item kepada pemohon atau penghantaran
5. **Sahkan**: Pastikan status GIN mencerminkan penyelesaian dalam sistem

**Tip:** Simpan cetakan GIN atau skrin terbuka semasa pemilihan—semak silang setiap baris item sebelum melepaskan stok.

---

### Untuk Admin: Persediaan Sistem Awal

**Matlamat:** Sediakan sistem GIN konsainan untuk pasukan Jualan dalam 5 langkah.

**Langkah 1: Konfigurasi Item Konsainan** (`Master Data > Items > [Item] > Consignment`)

- Tandakan item sebagai konsainan dan kaitkan dengan pembekal yang betul
- Set lokasi konsainan lalai untuk setiap item

**Langkah 2: Sediakan Gudang** (`Master Data > Warehouses` atau `Inventory > Locations`)

- Takrif lokasi yang menyimpan stok konsainan
- Pastikan item konsainan diperuntukkan ke kawasan simpanan yang betul

**Langkah 3: Tetapkan Kebenaran** (`Settings > Permissions` atau `Tenant Admin > Roles`)

- Beri wakil Jualan: Create Consignment GIN, View Consignment GIN
- Beri Gudang: View Consignment GIN
- Beri Kewangan: View Consignment GIN (untuk penyesuaian)

**Langkah 4: Sahkan Consignment Receipt** (jika berkenaan)

- Pastikan stok konsainan telah diterima melalui [Consignment GRN](/guides/purchasing-guides/consignment-purchasing/) sebelum mengeluarkan
- Semak baki inventori konsainan

**Langkah 5: Uji**

- Cipta GIN konsainan ujian sebagai wakil Jualan
- Sahkan ia muncul dalam senarai
- Sahkan baris item dipaparkan dengan betul

**Berterusan:** Pantau penggunaan konsainan dan sesuaikan dengan kitaran pengebilan pembekal.

---

{{< callout type="tip" >}}
**Baru kepada sistem?** Mulakan dengan asas:

1. Wakil jualan patut cipta GIN konsainan ujian untuk pembiasaan
2. Pengurus jualan patut semak senarai dan penapis
3. Staf gudang patut amalkan memenuhi GIN dari senarai tertunda
4. Admin patut lengkapkan Persediaan Sistem Awal di atas, kemudian semak **Configuration & Settings** untuk pilihan terperinci
   {{< /callout >}}

---

## Mencipta Consignment GIN {#creating-a-consignment-gin}

Bahagian ini meliputi proses terperinci untuk mencipta Nota Keluaran Barang konsainan.

### Prasyarat

Sebelum mencipta GIN konsainan, pastikan:

- Item konsainan dikonfigurasi dalam sistem
- Item dikaitkan dengan pembekal konsainan
- Stok konsainan tersedia di lokasi pengeluaran
- Pengguna anda mempunyai kebenaran untuk mencipta GIN konsainan

### Langkah demi Langkah: Cipta Consignment GIN

**Langkah 1: Tab Main Details**

| Medan                | Tujuan                        | Contoh          |
| -------------------- | ----------------------------- | --------------- |
| **Branch**           | Cawangan pengeluaran          | Main Branch     |
| **Transaction Date** | Tarikh perniagaan pengeluaran | Tarikh hari ini |
| **Currency**         | Mata wang dokumen             | MYR             |
| **Purchaser**        | Orang yang bertanggungjawab   | John Smith      |

**Langkah 2: Tab Account**

| Medan        | Tujuan                              | Contoh              |
| ------------ | ----------------------------------- | ------------------- |
| **Supplier** | Entiti yang memiliki stok konsainan | Supplier ABC        |
| **Bill To**  | Alamat pengebilan                   | Pilih atau masukkan |
| **Ship To**  | Alamat penghantaran/penghantaran    | Pilih atau masukkan |

**Langkah 3: Tab Lines**

Bagi setiap item yang dikeluarkan:

| Medan               | Tujuan                                  | Contoh                |
| ------------------- | --------------------------------------- | --------------------- |
| **Item**            | Produk konsainan                        | Product XYZ           |
| **Quantity**        | Unit dikeluarkan (Base/UOM)             | 10                    |
| **Serial Number**   | Untuk item bersiri (jika didayakan)     | SN-12345              |
| **Batch Number**    | Untuk item jejak batch (jika didayakan) | BATCH-001             |
| **Pricing Details** | Harga unit, diskaun, jumlah             | Seperti dikonfigurasi |

**Langkah 4: Tab Pilihan**

- **Payment**: Rekod pembayaran terhadap GIN (jika tab kelihatan)
- **Department Hdr**: Tambah butiran peringkat jabatan (jika tab kelihatan)

**Langkah 5: Cipta dan Finalkan**

- **CREATE**: Simpan GIN dalam status Draft dan buka paparan Edit
- **FINAL** (dari senarai atau paparan Edit): Post dokumen dan kemas kini inventori konsainan

---

### Tab Borang Edit

Apabila mengedit GIN konsainan, tab tambahan muncul (jika didayakan dalam Application Settings):

| Tab             | Tujuan                                              |
| --------------- | --------------------------------------------------- |
| **Contra**      | Kaitkan dokumen kontra (cth. GRN berkaitan, invois) |
| **Doc Link**    | Pautan ke dokumen berkaitan                         |
| **Attachments** | Lampir fail (resit, dokumen sokongan)               |
| **Export**      | Jana PDF melalui format boleh cetak                 |

Gunakan **SAVE** untuk kekalkan perubahan, **RESET** untuk buang, atau **DELETE** (dengan pengesahan) untuk buang GIN draft.

---

## Consignment GIN Listing

Senarai menyediakan paparan komprehensif semua item GIN konsainan yang dicipta.

{{< figure src="/images/internal-consignment-gin-applet/main-listing.png" alt="Halaman senarai utama Internal Consignment GIN menunjukkan semua rekod GIN konsainan dalam format jadual" caption="Senarai Utama: Lihat semua item GIN konsainan dengan penapis dan carian" >}}

### Apa yang Boleh Anda Lakukan

- Lihat semua GIN konsainan dalam format jadual
- Tapis mengikut julat tarikh, status, lokasi atau pencipta
- Cari mengikut nombor GIN, rujukan atau pelanggan
- Isih mengikut tarikh, nombor GIN atau lajur lain
- Buka mana-mana GIN untuk lihat butiran penuh

### Lajur Senarai

| Lajur                  | Keterangan                             |
| ---------------------- | -------------------------------------- |
| **Consignment GIN No** | Pengenal pasti dokumen unik            |
| **Posting Status**     | Status DRAFT atau posted               |
| **Branch**             | Cawangan pengeluaran                   |
| **Supplier Name**      | Pembekal (entiti) untuk stok konsainan |
| **Purchaser**          | Orang yang bertanggungjawab untuk GIN  |
| **Updated Date**       | Tarikh pengubahsuaian terakhir         |
| **Created Date**       | Bila GIN dicipta                       |
| **Transaction Date**   | Tarikh transaksi perniagaan            |
| **Created by**         | Pengguna yang mencipta GIN             |

### Medan Carian Lanjutan

| Medan                  | Keterangan                   |
| ---------------------- | ---------------------------- |
| **Consignment GIN No** | Cari mengikut nombor dokumen |
| **Branch Name**        | Tapis mengikut cawangan      |
| **Supplier Name**      | Tapis mengikut pembekal      |
| **Created Date**       | Julat tarikh (dari/kepada)   |
| **Transaction Date**   | Julat tarikh (dari/kepada)   |
| **Created by**         | Tapis mengikut pencipta      |

---

## Line Item Listing

Navigasi **Line Items** menyediakan paparan khusus untuk cari dan urus baris item GIN konsainan merentas semua dokumen. Akses melalui **Line Items** dalam bar sisi applet.

{{< figure src="/images/internal-consignment-gin-applet/line-items.png" alt="Halaman baris item menunjukkan item individu dan kuantiti pada GIN konsainan" caption="Baris Item: Cari dan lihat butiran item merentas semua dokumen GIN konsainan" >}}

### Medan Carian Line Item

| Medan                  | Keterangan                            |
| ---------------------- | ------------------------------------- |
| **Consignment GIN No** | Tapis mengikut dokumen GIN induk      |
| **Item Code**          | Cari mengikut kod produk              |
| **Item Name**          | Cari mengikut nama produk             |
| **Txn Amt**            | Tapis mengikut julat jumlah transaksi |

### Butiran Line Item (setiap baris)

| Medan               | Keterangan                              |
| ------------------- | --------------------------------------- |
| **Item Code**       | Pengenal pasti produk                   |
| **Item Name**       | Keterangan produk                       |
| **Quantity**        | Unit dikeluarkan (Base dan UOM)         |
| **Unit of Measure** | UOM (cth. EA, Box)                      |
| **Serial Number**   | Untuk item bersiri (jika didayakan)     |
| **Batch Number**    | Untuk item jejak batch (jika didayakan) |
| **Bin Number**      | Lokasi simpanan (jika didayakan)        |
| **Pricing Details** | Harga unit, diskaun, jumlah             |
| **Issue Link**      | Pautan ke dokumen sumber                |

### Melihat Line Items

**Pilihan 1: Dari rekod GIN**

1. Buka senarai **Internal Consignment GIN** dan klik pada baris GIN
2. Dalam paparan Edit, pergi ke tab **Lines**
3. Tambah, edit atau lihat baris item untuk GIN tersebut

**Pilihan 2: Paparan Line Items khusus**

1. Klik **Line Items** dalam bar sisi
2. Gunakan Advanced Search untuk tapis mengikut GIN No, Item Code, Item Name atau Txn Amt
3. Klik baris untuk membuka GIN induk dalam mod edit

---

## Configuration & Settings

Pentadbir mengkonfigurasi Internal Consignment GIN Applet melalui **Settings** dalam bar sisi applet. Tetapan berikut tersedia:

### Struktur Menu Settings

| Tetapan                                     | Tujuan                                     |
| ------------------------------------------- | ------------------------------------------ |
| **Application Settings** (Field Settings)   | Konfigurasi medan dan tab yang kelihatan   |
| **Default Selection**                       | Set nilai lalai untuk dokumen baru         |
| **Printable Format Settings**               | Konfigurasi templat export/cetak           |
| **Webhook**                                 | Konfigurasi webhook untuk integrasi        |
| **Feature Visibility**                      | Kawal keterlihatan ciri                    |
| **Permissions**                             | Senarai kebenaran User, Team dan Role      |
| ------------------------------------------- | ------------------------------------------ |

{{< figure src="/images/internal-consignment-gin-applet/settings-page.png" alt="Halaman Settings Internal Consignment GIN menunjukkan Application Settings, Default Selection, dan pilihan konfigurasi lain" caption="Konfigurasi & Tetapan: Akses konfigurasi applet terperinci melalui menu Settings" >}}

### Tab Boleh Dikonfigurasi (Application Settings)

Tab berikut boleh ditunjukkan atau disembunyikan setiap tenant melalui **Settings > Application Settings**:

| Tab                | Keterangan                         | Lalai     |
| ------------------ | ---------------------------------- | --------- |
| **Payment**        | Rekod dan urus pembayaran          | Kelihatan |
| **Department Hdr** | Butiran peringkat jabatan          | Kelihatan |
| **Contra**         | Kaitkan dokumen kontra             | Kelihatan |
| **Doc Link**       | Kaitkan dokumen berkaitan          | Kelihatan |
| **Attachments**    | Lampir fail                        | Kelihatan |
| **Export**         | Export ke format boleh cetak (PDF) | Kelihatan |

### Persediaan Item Konsainan

**Navigasi**: `Master Data > Items > [Item] > Consignment`

Sebelum mencipta GIN konsainan, pastikan item dikonfigurasi dengan betul:

| Tetapan                  | Tujuan                                     | Contoh           |
| ------------------------ | ------------------------------------------ | ---------------- |
| **Consignment Item**     | Tandakan item sebagai konsainan            | Checked          |
| **Consignment Supplier** | Kaitkan dengan pembekal yang memiliki stok | Supplier ABC     |
| **Consignment Location** | Lokasi simpanan lalai                      | Consignment Area |

### Persediaan Gudang/Lokasi

**Navigasi**: `Master Data > Warehouses` atau `Inventory > Locations`

- Takrif lokasi yang menyimpan stok konsainan
- Pastikan item konsainan diperuntukkan ke lokasi yang betul
- Sediakan kawasan simpanan khusus konsainan jika perlu

### Kebenaran Pengguna

**Navigasi**: `Settings > [Permission Set / User / Team / Role Permission Listing]`

| Kebenaran                  | Keterangan                | Peranan Biasa            |
| -------------------------- | ------------------------- | ------------------------ |
| **Create Consignment GIN** | Cipta rekod GIN baru      | Purchaser, Sales Rep     |
| **View Consignment GIN**   | Akses senarai dan butiran | Purchaser, Warehouse     |
| **Edit Consignment GIN**   | Ubah GIN draft            | Purchaser, Manager       |
| **Delete Consignment GIN** | Padam GIN draft           | Manager (jika berkenaan) |

### Integrasi dengan Consignment Purchasing

Internal Consignment GIN Applet berintegrasi dengan:

- **Consignment Receipt/GRN** - Stok diterima ke konsainan
- **Consignment Inventory** - Baki semasa
- **Consignment Reconciliation** - Pengebilan bulanan dan penyelesaian pembekal

Pastikan proses [Consignment Purchasing](/guides/purchasing-guides/consignment-purchasing/) dikonfigurasi dengan betul untuk penjejakan hujung-ke-hujung.

---

## FAQ

**S: Di mana saya jumpa applet Internal Consignment GIN?**
J: Pergi ke **Internal Consignment GIN** dalam bar sisi (biasanya di bawah Inventory atau Purchasing, bergantung pada persediaan tenant anda). Jika anda tidak nampak, peranan anda mungkin tiada akses—hubungi pentadbir anda.

**S: Apakah perbezaan antara GIN konsainan dan GIN biasa?**
J: GIN konsainan mengeluarkan item dari inventori konsainan (stok milik pembekal di lokasi anda). GIN biasa mengeluarkan inventori milik anda. GIN konsainan mengurangkan baki konsainan dan menyumbang kepada pengebilan pembekal apabila anda dikenakan bayaran untuk item yang digunakan.

**S: Bolehkah saya edit GIN konsainan selepas menghantar?**
J: Bergantung pada konfigurasi sistem anda. GIN draft biasanya boleh diedit. Setelah dihantar atau diselesaikan, perubahan mungkin disekat—semak dengan pentadbir anda. Jika anda perlu betulkan GIN yang diselesaikan, anda mungkin perlu cipta entri reverse/adjustment.

**S: Bolehkah saya cipta GIN konsainan jika saya tiada stok konsainan?**
J: Tidak. Sistem mengesahkan ketersediaan stok di lokasi pengeluaran. Jika anda dapat ralat, semak baki inventori konsainan untuk item dan lokasi tersebut. Stok mesti diterima melalui Consignment GRN dahulu.

**S: Bagaimana saya cari GIN konsainan tertentu yang saya cipta?**
J: Buka Internal Consignment GIN Listing dan gunakan **Advanced Search**: tapis mengikut Consignment GIN No, Branch Name, Supplier Name, Created Date, Transaction Date atau Created by.

**S: Bagaimana GIN konsainan mempengaruhi pengebilan pembekal?**
J: Setiap GIN konsainan mengurangkan inventori konsainan anda. Apabila pembekal menghantar invois penggunaan (biasanya bulanan), ia berdasarkan transaksi GIN ini. Kewangan menggunakan rekod GIN untuk menyesuaikan dan mengesahkan invois.
