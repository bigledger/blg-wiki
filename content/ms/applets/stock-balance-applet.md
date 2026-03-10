---
title: "Applet Baki Stok"
description: "Keterlihatan baki stok masa nyata merentasi item dan lokasi dengan penapis lanjutan serta alat analisis"
tags:
- stock-balance
- inventory-management
- warehouse
- stock-visibility
- inventory-control
weight: 185
---

## Tujuan dan Gambaran Keseluruhan

**Stock Balance Applet** menyediakan paparan ringkas kuantiti inventori masa nyata di seluruh organisasi anda. Ia membantu anda memahami stok semasa, lokasi stok disimpan, dan bagaimana baki berubah merentasi lokasi.

{{< callout type="info" >}}
**Konsep Teras**: Baki stok ialah kuantiti masa nyata yang terhasil daripada semua transaksi masuk dan keluar, diringkaskan mengikut **Item** dan **Location**.
{{< /callout >}}

{{< callout type="info" >}}
**Paparan Baca Sahaja**: Applet ini tidak mencipta atau mengedit stok. Semua kuantiti dikemas kini oleh transaksi inventori daripada applet lain (sales, purchase, adjustment dan transfers).
{{< /callout >}}

**Tujuan:** Menyediakan satu sumber kebenaran untuk baki stok mengikut item dan lokasi.

**Pengguna Sasaran:** Pasukan gudang, pengawal inventori, penyelaras pembelian dan jualan, serta pasukan kewangan atau audit.

**Ciri Utama:**
- Senarai baki stok masa nyata dengan pengelompokan dan pivoting
- Penapisan lanjutan mengikut jenis item, lokasi, dan baki
- Integrasi dengan transaksi inventori daripada applet berkaitan

## Gambaran Ciri Utama

### Siapa yang Mendapat Manfaat daripada Applet Ini?

**Pasukan Gudang dan Kedai:**
- Sahkan stok sebelum picking dan issuing
- Jejak stok mengikut lokasi
- Kenal pasti risiko kehabisan stok lebih awal

**Pengawal Inventori:**
- Pantau ketepatan baki merentasi lokasi
- Siasat perbezaan menggunakan penapis dan eksport
- Seragamkan keterlihatan stok merentasi cawangan

**Pasukan Pembelian dan Jualan:**
- Sahkan ketersediaan sebelum membuat pesanan atau sebut harga
- Elakkan overstock melalui baki masa nyata
- Kurangkan kehilangan jualan akibat stok tidak tepat

**Pasukan Kewangan dan Audit:**
- Sahkan kuantiti inventori untuk rekonsiliasi
- Sokong audit melalui eksport dan dokumen transaksi berkaitan
- Kurangkan pelarasan dengan mengesan anomali awal

### Masalah Apa yang Diselesaikan?

**Masalah Keterlihatan Stok:**
- Data stok bertaburan di pelbagai dokumen dan pasukan
- Kemas kini transaksi tertunda
- Semakan baki sebelum jualan atau pembelian memakan masa

**Penyelesaian Stock Balance Applet:**
- **Paparan baki masa nyata** dengan pengelompokan mengikut item dan lokasi
- **Penapisan lanjutan** mengikut jenis item dan kriteria baki
- **Integrasi sedia** untuk semua aliran masuk dan keluar inventori

## Gambaran Ciri Utama

{{< cards >}}
  {{< card title="Stock Balance Listing" subtitle="Baki masa nyata mengikut item dan lokasi" link="#stock-balance-listing" >}}

  {{< card title="Advanced Search" subtitle="Tapis mengikut item, lokasi dan baki" link="#advanced-search--filters" >}}

  {{< card title="Charts & Pivot" subtitle="Analisis taburan mengikut lokasi" link="#charts--pivot" >}}

  {{< card title="Export & Analysis" subtitle="Kongsi data senarai dengan pihak berkepentingan" link="#export--analysis" >}}

  {{< card title="Integrations" subtitle="Data stok berkaitan dengan applet lain" link="#integrations--data-sources" >}}

  {{< card title="Configuration & Settings" subtitle="Kawal tetapan lalai dan keterlihatan medan" link="#configuration--settings" >}}
{{< /cards >}}

{{< figure src="/images/stock-balance-applet/stock-balance-overview.png" alt="Gambaran keseluruhan applet baki stok" caption="Infografik gambaran keseluruhan applet baki stok." >}}

## Konsep Utama

### Memahami Baki Stok

Baki stok ialah kuantiti masa nyata sesuatu item selepas semua pergerakan diterapkan.

| Istilah | Maksud |
|------|---------|
| **Opening Balance** | Kuantiti pada awal tempoh atau snapshot |
| **Inbound Movements** | Pembelian, pulangan masuk, pelarasan masuk, pindahan masuk |
| **Outbound Movements** | Jualan, pengeluaran, pelarasan keluar, pindahan keluar |
| **Current Balance** | Opening + Inbound - Outbound |

{{< callout type="tip" >}}
**Tip Praktikal**: Jika baki tidak tepat, semak transaksi inventori terkini (sales, purchase, adjustments) yang memberi kesan kepada item dan lokasi tersebut.
{{< /callout >}}

### Struktur Baki Stok

Anggap baki stok sebagai ringkasan berstruktur:

```
Organization
|
|-- Items
|   |-- Item Type / Sub Item Type
|   |-- UOM
|
|-- Locations
|
|-- Transactions
    |-- Inbound (GRN, Purchase, Return In)
    |-- Outbound (Sales, Issue, Return Out)
    |-- Adjustments
```

**Aliran dalam Struktur:**
1. **Item** ialah unit penjejakan.
2. **Location** ialah lokasi stok berada.
3. **Transactions** ialah sumber semua perubahan baki.

### "Segi Tiga Emas" Baki Stok

| Komponen | Analogi | Definisi | Contoh |
|-----------|---------|------------|---------|
| **Item** | Produk | SKU atau item inventori yang dijejaki | `ITEM-001` |
| **Location** | Rak | Gudang atau kedai tempat stok disimpan | `WH-KL` |
| **Movement** | Perubahan | Transaksi yang menambah atau mengurangkan stok | GRN, Sales, Adjustment |

Apabila ketiga-tiga ini selaras, baki stok adalah tepat dan boleh digunakan.

---

## Panduan Pantas

{{< figure src="/images/stock-balance-applet/sb-quick-guide.png" alt="Panduan pantas baki stok" caption="Panduan pantas untuk pengguna gudang, inventori dan admin." >}}

### Untuk Staf Gudang: Semak Stok Sedia Ada

**Matlamat:** Sahkan kuantiti stok untuk item tertentu di lokasi tertentu.

1. Buka **Stock Balance** dari sidebar.
2. Gunakan **Advanced Search** untuk menapis mengikut **Location** dan **Item Code**.
3. Klik **Search** untuk memuatkan senarai.
4. Semak lajur **Bal** untuk kuantiti semasa.
5. Gunakan **Column Toggle** untuk paparan medan tambahan (cth. kos) jika dibenarkan.
6. Eksport senarai jika perlu berkongsi hasil.

---

### Untuk Pengawal Inventori: Siasat Perbezaan

**Matlamat:** Jejak perbezaan antara baki sistem dan kiraan fizikal.

1. Tapis senarai menggunakan **Item Code**, **Location**, dan **Balance Greater Than 0**.
2. Semak lajur **Bal** untuk kuantiti semasa.
3. Gunakan **Column Toggle** untuk pengelompokan mengikut **Location** bagi perbandingan sisi-ke-sisi.
4. Aktifkan **Pivot Mode** jika perlukan analisis cross-tab.
5. Eksport senarai untuk dikongsi dengan audit atau kewangan.

---

### Untuk Admin: Persediaan Awal

**Matlamat:** Pastikan applet sedia untuk operasi harian.

1. Pastikan data **Item Master** dan **Location** lengkap serta tepat.
2. Tetapkan kebenaran supaya hanya peranan yang dibenarkan boleh melihat medan kos sensitif.
3. Konfigurasi tetapan lalai seperti cawangan, lokasi, dan keterlihatan lajur.
4. Sahkan menu **Settings** dan **Permissions** hanya muncul untuk admin.
5. Jalankan carian ujian untuk mengesahkan data dan akses.

---

{{< callout type="tip" >}}
**Baharu kepada sistem?** Mulakan dengan satu item dan satu lokasi. Sahkan baki senarai sebelum diperluaskan.
{{< /callout >}}

---

## Stock Balance Listing

Senarai ini ialah papan utama untuk keterlihatan stok. Ia mengelompokkan item mengikut **Item Code** dan boleh mempivot baki mengikut **Location** untuk perbandingan pantas.

{{< figure src="/images/stock-balance-applet/sb-listing-1.png" alt="Paparan utama senarai baki stok" caption="Paparan utama senarai baki stok." >}}

Senarai juga boleh dikelompokkan mengikut **EAN Code**, **Company**, **MA Price**, dan **Last Purchase Company**. Gunakan **Column** settings untuk mengaktif atau nyahaktifkan pengelompokan ini.

{{< figure src="/images/stock-balance-applet/sb-listing.png" alt="Senarai dikelompokkan mengikut EAN code, company, MA price dan last purchase company" caption="Senarai dikelompokkan mengikut EAN code, company, MA price dan last purchase company." >}}

{{< figure src="/images/stock-balance-applet/sb-column.png" alt="Panel tetapan lajur untuk pengelompokan dan pivot" caption="Panel tetapan lajur untuk pengelompokan, Pivot Mode dan lajur yang dipaparkan." >}}

{{< figure src="/images/stock-balance-applet/sb-wo-pivot.png" alt="Pivot Mode dinyahaktif dan diaktifkan" caption="Perbandingan Pivot Mode dinyahaktif berbanding diaktifkan." >}}

**Apa itu Pivot Mode?** Pivot Mode menyusun semula senarai supaya anda boleh menganalisis baki dengan menukar **Location** atau lajur lain menjadi lajur berkumpulan untuk perbandingan sisi-ke-sisi.

**Apa yang ia lakukan?** Apabila diaktifkan, anda boleh menarik medan ke **Row Groups**, **Columns**, dan **Values** untuk membina paparan cross-tab bagi melihat perbezaan antara lokasi.

**Pivot Mode: Nyahaktif vs Aktif:**
- **Nyahaktif**: Senarai baris standard, setiap baris mewakili rekod item-lokasi, sesuai untuk imbasan dan penapisan.
- **Aktif**: Paparan cross-tab beragregat, sesuai untuk perbandingan berbilang lokasi.

**Lajur Utama Senarai:**

| Lajur | Penerangan |
|--------|-------------|
| **Item Code** | Kod item yang digunakan sebagai pengelompokan utama |
| **EAN Code** | Kod bar atau kod imbas item |
| **Company** | Entiti syarikat bagi item |
| **Location** | Lokasi gudang atau kedai |
| **Bal** | Kuantiti baki semasa |
| **MA Price** | Kos purata bergerak (tertakluk kepada kebenaran) |
| **Last Purchase Cost** | Kos pembelian terakhir untuk rujukan nilai |

**Apa yang boleh dilakukan dalam senarai:**
- Kumpulkan mengikut **Item Code** untuk melihat jumlah merentas lokasi.
- Pivot mengikut **Location** untuk bandingkan taburan stok.
- Gunakan status bar untuk jumlah, bilangan baris dipilih, dan agregat.
- Aktifkan carta dan pemilihan julat untuk analisis pantas.
- Eksport senarai ke Excel atau CSV jika eksport diaktifkan.

### Charts & Pivot

Gunakan **Charts** dan **Pivot Mode** untuk menganalisis taburan stok merentasi lokasi dan item.

**Charts:** Carta hanya boleh dijana apabila **Pivot Mode** diaktifkan. Pilih julat sel dan buka panel carta untuk memvisualkan baki, membanding lokasi, atau menjejak kuantiti mengikut kumpulan item.

**Pivot Mode:** Seret medan ke **Row Groups**, **Columns**, dan **Values** untuk membina paparan cross-tab bagi perbandingan sisi-ke-sisi.

**Cara Menjana Carta:**
1. Aktifkan **Pivot Mode** dalam panel tetapan lajur.
2. Klik kanan dalam senarai dan pilih **Pivot Chart** atau **Chart Range**.
3. Pilih jenis carta yang tersedia dalam applet, seperti **Donut** atau **Pie**.

{{< figure src="/images/stock-balance-applet/sb-chart-donut.png" alt="Carta Donut dijana dalam applet" caption="Carta Donut dijana daripada senarai." >}}

{{< figure src="/images/stock-balance-applet/sb-chart-pie.png" alt="Carta Pie dijana dalam applet" caption="Carta Pie dijana daripada senarai." >}}

### Export & Analysis

Gunakan **Export** untuk berkongsi senarai dengan pasukan lain atau untuk rekonsiliasi.

**Pilihan Eksport:**
- Eksport ke **Excel** atau **CSV** untuk analisis lanjut.

**Cara Mengeksport Senarai:**
1. Klik kanan di mana-mana tempat dalam senarai.
2. Pilih **Export**, kemudian pilih **CSV** atau **Excel**.
3. Fail akan dimuat turun secara automatik.

{{< figure src="/images/stock-balance-applet/sb-export.png" alt="Menu eksport dalam senarai" caption="Menu eksport dengan pilihan CSV dan Excel." >}}

{{< figure src="/images/stock-balance-applet/sb-export-download.png" alt="Muat turun eksport sedang berjalan" caption="Muat turun eksport sedang berjalan." >}}

**Fail Eksport:**

{{< figure src="/images/stock-balance-applet/sb-export-csv.png" alt="Fail CSV dieksport" caption="Fail CSV yang dieksport." >}}

{{< figure src="/images/stock-balance-applet/sb-export-excel.png" alt="Fail Excel dieksport" caption="Fail Excel yang dieksport." >}}

---

## Advanced Search & Filters

Panel **Advanced Search** membantu memfokuskan carian kepada stok yang diperlukan.

{{< figure src="/images/stock-balance-applet/sb-search.png" alt="Panel carian lanjutan" caption="Panel carian lanjutan untuk penapis baki stok." >}}

**Penapis Tersedia:**
- **Company**
- **Location**
- **Item Code**
- **Item Type**
- **Sub Item Type**
- **Balance Greater Than 0**

**Item Types Disokong:**
- `BASIC_ITEM`
- `GROUPED_ITEM`
- `BUNDLE`
- `COUPON`
- `SERVICE`
- `WARRANTY`
- `BATCH_EXPIRY`
- `DOC_HEADER_ADJUSTMENT`

**Perbezaan Item Type:**

| Item Type | Maksud | Kegunaan Biasa |
|-----------|----------------|------------------|
| **BASIC_ITEM** | Item stok standard yang dijejaki mengikut kuantiti. | SKU biasa dalam inventori. |
| **GROUPED_ITEM** | Item induk yang mengelompokkan item anak. | Kit atau set dijual sebagai satu kumpulan. |
| **BUNDLE** | Gabungan item yang dibungkus untuk dijual bersama. | Bundle promosi (cth. telefon + sarung). |
| **COUPON** | Item bukan stok mewakili diskaun atau baucar. | Baucar hadiah atau kupon diskaun. |
| **SERVICE** | Item bukan fizikal yang disediakan sebagai perkhidmatan. | Pemasangan atau perkhidmatan penyelenggaraan. |
| **WARRANTY** | Item waranti yang berkaitan dengan jualan. | Pelan waranti lanjutan. |
| **BATCH_EXPIRY** | Item dijejaki mengikut batch dan tarikh luput. | Makanan, farmasi, atau barangan terkawal. |
| **DOC_HEADER_ADJUSTMENT** | Pelarasan di peringkat header dokumen. | Pembundaran atau pelarasan peringkat header. |

**Sub Item Types Disokong:**
- `BASIC_QTY`
- `BATCH_NUMBER`
- `SERIAL_NUMBER`
- `BIN_NUMBER`

**Perbezaan Sub Item Type:**

| Sub Item Type | Maksud | Kegunaan Biasa |
|---------------|---------------|------------------|
| **BASIC_QTY** | Penjejakan kuantiti standard tanpa batch atau serial. | Item stok biasa berdasarkan kuantiti. |
| **BATCH_NUMBER** | Kuantiti dijejaki mengikut batch atau lot. | Barangan mudah luput atau terkawal. |
| **SERIAL_NUMBER** | Kuantiti dijejaki mengikut serial unik. | Item bernilai tinggi dengan serial individu. |
| **BIN_NUMBER** | Kuantiti dijejaki mengikut lokasi bin dalam gudang. | Gudang yang menggunakan kawalan bin. |

**Tip Carian:**
- Gunakan **Item Code** untuk padanan SKU tepat.
- Gunakan **Balance Greater Than 0** untuk menyembunyikan item baki sifar.
- Gunakan **Item Type** untuk menapis model inventori tertentu.

---

## Integrations & Data Sources

Stock Balance mengumpulkan data daripada pelbagai aliran inventori dan menyediakannya kepada applet hiliran yang memerlukan ketersediaan masa nyata.

**Sumber Data Masuk (Lines Imported From):**
- Organisation Applet
- Item (Inventory) Maintenance Applet
- Doc Item Maintenance Applet
- Sales Invoice Applet
- Purchase Invoice Applet
- Sales Return Applet
- Purchases Return Applet
- Stock Adjustment Applet
- Sales Credit Note Applet
- Sales Debit Note Applet
- Purchase Credit Note Applet
- Purchase Debit Note Applet
- Internal Sales Goods Received Note Applet
- Internal Purchase Goods Received Note Applet
- Internal Sales Goods Issue Note Applet
- Internal Purchase Goods Issue Note Applet

**Applet Hiliran yang Menggunakan Data Stock Balance:**
- Stock Availability Applet
- Inventory Admin Applet
- Sales Order Applet
- Packing Order Applet
- Delivery Order Applet
- Purchase Order Applet
- Purchase Requisition Applet
- Quotation Applet
- Sales Credit Note Applet
- Sales Debit Note Applet
- Purchase Credit Note Applet
- Purchase Debit Note Applet
- Sales Return Applet
- Purchases Return Applet
- Stock Adjustment Applet
- Internal Sales Goods Received Note Applet
- Internal Purchase Goods Received Note Applet
- Internal Sales Goods Issue Note Applet
- Internal Purchase Goods Issue Note Applet

---

## Configuration & Settings

Konfigurasi bergantung pada deployment dan permissions. Jika **Settings** diaktifkan, admin boleh menetapkan nilai lalai dan keterlihatan medan.

{{< figure src="/images/stock-balance-applet/sb-setting.png" alt="Halaman tetapan baki stok" caption="Halaman tetapan baki stok untuk tetapan lalai dan keterlihatan medan." >}}

### Permissions

Permissions mengawal siapa yang boleh melihat baki, kos, dan tetapan. Berikan akses baca dan konfigurasi hanya kepada peranan yang dibenarkan.

**Apa yang boleh dikawal:**
- Akses kepada senarai Stock Balance
- Keterlihatan lajur kos (MA Price, Last Purchase Cost)
- Akses tetapan applet (nilai lalai, keterlihatan lajur dan konfigurasi)

**Lokasi konfigurasi:**
- Gunakan **Role Permissions** untuk menetapkan peraturan akses mengikut peranan
- Gunakan **User Permissions** untuk pengecualian atau akses pengguna tertentu

{{< figure src="/images/stock-balance-applet/sb-role-perm.png" alt="Role permissions untuk applet baki stok" caption="Role permissions untuk applet baki stok." >}}

{{< figure src="/images/stock-balance-applet/sb-user-perm.png" alt="User permissions untuk applet baki stok" caption="User permissions untuk applet baki stok." >}}

---

## Personalization

Applet ini tidak mempunyai menu personalization khusus. Jika persekitaran menyokong tetapan peribadi, ia akan mengikuti keutamaan organisasi untuk cawangan, lokasi, dan bahasa.

---

## FAQ

**S: Mengapa baki stok saya menunjukkan 0?**
J: Semak penapis terlebih dahulu. **Balance Greater Than 0** akan menyembunyikan item baki sifar. Pastikan **Location** dan **Item Type** adalah betul.

**S: Mengapa saya tidak boleh melihat lokasi atau syarikat tertentu?**
J: Keterlihatan lokasi dikawal oleh permissions. Hubungi admin untuk mengesahkan akses dan penugasan lokasi anda.

**S: Mengapa saya tidak nampak lajur MA cost atau last purchase cost?**
J: Medan kos biasanya dikawal oleh permissions dan juga boleh disembunyikan dalam tetapan applet. Minta admin untuk mengaktifkan keterlihatan dan permissions berkaitan.

**S: Bagaimana baki stok dikira?**
J: Baki stok terhasil daripada semua transaksi masuk dan keluar untuk item dan lokasi tersebut. Sistem mengemas kini baki apabila transaksi diposkan.

**S: Mengapa saya tidak boleh menjana carta?**
J: Carta hanya tersedia apabila **Pivot Mode** diaktifkan. Aktifkan Pivot Mode dalam panel Column, kemudian pilih julat dan pilih **Pivot Chart**.

**S: Mengapa pilihan eksport tidak muncul?**
J: Pilihan eksport mungkin dinyahaktifkan oleh permissions atau tetapan admin. Sahkan permissions peranan anda dan semak sama ada terdapat sekatan eksport.

**S: Apakah perbezaan antara Stock Balance Applet dan Stock Report Applet?**
J: Stock Balance lebih fokus pada keterlihatan operasi masa nyata dan analisis senarai, manakala Stock Report menyediakan analisis yang lebih luas, paparan sejarah, dan laporan.

**S: Mengapa terdapat stok negatif?**
J: Stok negatif biasanya disebabkan oleh perbezaan masa, transaksi backdated, atau penerimaan yang belum direkod. Semak jualan, pembelian, dan pelarasan terkini untuk item tersebut, serta pastikan sama ada stok negatif dibenarkan.
