---
title: "Applet Pesanan Jualan Dalaman"
description: "Pengurusan pesanan jualan kitaran penuh untuk Wavelet ERP merangkumi kemasukan pesanan, pemenuhan, penghantaran, dan pelaporan"
tags:
- sales-order
- order-management
- fulfillment
- delivery-planning
- ecomsync
weight: 70
---

## Tujuan dan Gambaran Keseluruhan

**Applet Pesanan Jualan Dalaman** ialah modul pengurusan pesanan jualan kitaran penuh untuk Wavelet ERP. Ia meliputi penciptaan pesanan, penyuntingan, kelulusan, pemenuhan, perancangan penghantaran, penyelarasan e-dagang, pelaporan, serta import/eksport fail. Ia direka untuk memusatkan data pesanan jualan, menguatkuasakan kawalan operasi (had kredit, status aliran kerja, status posting), dan menghubungkan proses hiliran seperti pick/pack, penghantaran, invois, serta perakaunan.

{{< callout type="info" >}}
**Konsep Teras**: Sales Order ialah dokumen induk yang menghubungkan **siapa** membeli (customer), **apa** yang dijual (items dan harga), **bagaimana** ia dipenuhi (delivery dan pick/pack), dan **bagaimana** ia diselesaikan (AR/AP, receipt vouchers, dan status posting).
{{< /callout >}}

## Gambaran Keseluruhan Ciri Utama

### Siapa yang mendapat manfaat daripada Applet ini?

**Operasi Jualan dan Kemasukan Pesanan:**
- Penciptaan dan penyuntingan sales order yang tersusun
- Carian pantas dan senarai pesanan serta line items
- Butiran customer, bil, dan penghantaran di satu tempat
- Penukaran pantas ke dokumen hiliran

**Pasukan Gudang dan Pemenuhan:**
- Pick Pack Queue dengan sales order berkumpulan
- Senarai Delivery Items dan cetakan
- Delivery plans dan paparan kalendar
- Keterlihatan tepat terhadap stok dan status penghantaran

**Pasukan Kewangan dan AR/AP:**
- Kawalan status posting (DRAFT, FINAL, VOID, DISCARD, CLOSE)
- Penguatkuasaan had kredit
- Keterlihatan settlement, ARAP, receipt voucher, dan contra
- Pelaporan dan eksport sedia audit

**Operasi E-dagang:**
- Keterlihatan pesanan marketplace dan status sync
- Papan pemuka Ecomsync, scheduler, dan pengurusan ulasan
- Pengendalian pesanan Lazada dan Shopee

**Pengurusan dan Admin:**
- Laporan terperinci dan analitik per line
- Tetapan dan kebenaran yang boleh dikonfigurasi
- Jejak audit yang jelas dan kawalan operasi

### Masalah apa yang diselesaikan?

**Masalah Sales Order secara Manual:**

Pengurusan sales order tradisional berpecah antara spreadsheet, rangkaian e-mel, dan sistem yang tidak bersambung. Isu lazim termasuk:
- Kemasukan data berganda dan dokumen tidak konsisten
- Pemenuhan tertangguh kerana butiran penghantaran tidak lengkap
- Kemas kini stok dan harga yang tidak tepat
- Keterlihatan status kelulusan dan had kredit yang lemah
- Sukar menjejaki sejarah pesanan dan perubahan

**Penyelesaian Applet Pesanan Jualan Dalaman:**

- **Sumber kebenaran tunggal** - Satu rekod sales order berpusat merentas pasukan
- **Posting terkawal** - DRAFT, FINAL, VOID, DISCARD, CLOSE dengan peraturan
- **Pemenuhan bersepadu** - Pick/pack queue, delivery plans, dan delivery items
- **Sedia e-dagang** - Integrasi marketplace dan keterlihatan status
- **Kawalan kewangan** - Semakan had kredit dan pengurusan settlement
- **Pelaporan dan eksport** - Analitik terperinci dan eksport fail

## Gambaran Keseluruhan Ciri Utama

{{< cards >}}
  {{< card title="Sales Order Core" subtitle="Cipta, edit, FINAL, dan kawal status posting" link="#sales-order-core" >}}

  {{< card title="Line Item Management" subtitle="Harga, serial, batch, bin, dan kawalan stok" link="#line-item-management" >}}

  {{< card title="Delivery and Fulfillment" subtitle="Pick/pack, delivery items, dan perancangan" link="#delivery-and-fulfillment" >}}

  {{< card title="E-commerce Sync" subtitle="Pesanan marketplace dan status sync" link="#e-commerce-integration" >}}

  {{< card title="Reports and Analytics" subtitle="Pelaporan terperinci dan keterlihatan per line" link="#reports-and-analytics" >}}

  {{< card title="File Import and Export" subtitle="Import dan eksport pukal sales order" link="#file-import-and-export" >}}

  {{< card title="Approval and Permissions" subtitle="Queue kelulusan dan kawalan kebenaran" link="#approval-and-permissions" >}}

  {{< card title="Settings and Personalization" subtitle="Default boleh dikonfigurasi dan kawalan sistem" link="#configuration--settings" >}}
{{< /cards >}}

{{< figure src="/images/internal-sales-order-applet/internal-sales-order-overview.png" alt="Internal Sales Order Applet overview showing the flow from order entry to fulfillment and reporting" caption="Applet Pesanan Jualan Dalaman: Aliran daripada penciptaan pesanan ke pemenuhan, perancangan penghantaran, dan pelaporan." >}}

## Konsep Utama

### Memahami Kerangka Sales Order

| Aspek | Komponen | Contoh Praktikal |
|--------|-----------|------------------|
| **Siapa** membeli? | Customer / Entity | Pelanggan runcit atau akaun borong |
| **Apa** dijual? | Line Items | Item A (Qty 10), Item B (Qty 5) |
| **Bagaimana** dipenuhi? | Delivery / Pick Pack | Delivery plan dengan branch dan location yang ditetapkan |
| **Bagaimana** diselesaikan? | Posting / Settlement | Status FINAL dengan baris settlement |

{{< callout type="tip" >}}
**Contoh Dunia Sebenar**: Seorang admin jualan mencipta Sales Order Dalaman untuk Customer X. Pesanan berada dalam DRAFT hingga diluluskan, kemudian FINAL. Gudang memetik item menggunakan Pick Pack Queue, penghantaran dijadualkan, dan kewangan merekod settlement serta invois.
{{< /callout >}}

### Kitar Hayat Sales Order

```
Draft -> Final -> Fulfillment -> Delivery -> Settlement/Invoice -> Close
  |       |           |             |              |               |
  |       |           |             |              |               +--> Close (if enabled)
  |       |           |             |              +--> Receipt vouchers and ARAP
  |       |           |             +--> Delivery items and tracking
  |       |           +--> Pick/pack and warehouse posting
  |       +--> Credit limit and workflow validation
  +--> Edit and discard if required
```

---

## Panduan Mula Pantas

Mulakan dengan pantas mengikut peranan anda.

[![Internal Sales Order Applet Video](https://img.youtube.com/vi/L7nSvCluFbM/hqdefault.jpg)](https://youtu.be/L7nSvCluFbM?si=L5-JHPl_Yvp9oeGf)

{{< callout type="note" >}}
**Sebelum mula**: Pastikan customer/entity wujud, item telah disediakan, dan anda mempunyai kebenaran untuk mencipta serta FINAL pesanan.
{{< /callout >}}

### Untuk Jualan dan Kemasukan Pesanan: Cipta Sales Order Pertama

**Matlamat:** Cipta sales order yang sah dan hantar untuk pemenuhan.

1. **Navigasi**: Pergi ke **Sales Order** dari sidebar
{{< figure src="/images/internal-sales-order-applet/so-create-1.png" alt="Sales Order sub menu" caption="Sales Order di dalam Sales Order Applet." >}}

2. **Cipta**: Klik **Create** dan isi Main Details
{{< figure src="/images/internal-sales-order-applet/so-create-2.png" alt="Create button" caption="Butang Create untuk mencipta sales order baharu." >}}

{{< figure src="/images/internal-sales-order-applet/so-create-form.png" alt="Create form in Sales Order Applet" caption="Borang Create dalam sales order applet." >}}
   - Branch, location, transaction date
{{< figure src="/images/internal-sales-order-applet/so-branch.png" alt="branch dropdown, location and transaction date" caption="Dropdown untuk pengguna memilih branch, delivery location dan transaction date." >}}
   - Pemilihan customer/entity (daripada Customer Applet)
{{< figure src="/images/internal-sales-order-applet/so-entity.png" alt="Entity details field" caption="Entity Details untuk dipilih, dicipta melalui Customer Applet." >}}
   - Sales agent dan reference
{{< figure src="/images/internal-sales-order-applet/so-sales-agent.png" alt="Sales Agent in the create/edit Sales Order form. User can choose the Sales Agent either from dropdown or it will be auto populated from the Entity Details." >}}

3. **Sahkan Billing & Shipping**:
   - Pilih alamat billing dan shipping
{{< figure src="/images/internal-sales-order-applet/so-bill-to.png" alt="Bill to and Ship to tab" caption="Tab Billing address dan Shipping address." >}}

{{< figure src="/images/internal-sales-order-applet/so-select-billing.png" alt="Select Billing button" caption="Pilih alamat Billing." >}}

   - Salin billing ke shipping jika sesuai

4. **Tambah Line Items**:
{{< figure src="/images/internal-sales-order-applet/so-line.png" alt="line items tab" caption="Tambah line items dalam Sales Order." >}}
   - Cari item atau imbas kod
   {{< figure src="/images/internal-sales-order-applet/so-line-search.png" alt="SO line search" caption="Cari line items yang akan ditambah dalam Sales Order." >}}
   - Tetapkan kuantiti, harga, diskaun
   {{< figure src="/images/internal-sales-order-applet/so-quantity.png" alt="line items tab" caption="Tetapkan kuantiti, harga, dan diskaun untuk line item." >}}
   - Masukkan serial/batch/bin jika perlu
   {{< figure src="/images/internal-sales-order-applet/so-batch.png" alt="batch tab" caption="Tetapkan batch number, quantity, issue date, expiry date dan quantity." >}}

5. **Delivery Details**:
   - Pilih delivery branch dan location
   {{< figure src="/images/internal-sales-order-applet/so-delivery.png" alt="delivery branch and location field" caption="Pengguna boleh memilih delivery branch dan location dari dropdown." >}}
   - Tetapkan requested delivery date dan arahan
{{< figure src="/images/internal-sales-order-applet/so-create-4.png" alt="Input for billing address" caption="Isi Delivery Details dalam tab Ship To." >}}

6. **Add-on Pilihan**:
   - Tambah settlement lines atau attachments jika perlu
   {{< figure src="/images/internal-sales-order-applet/so-settlement.png" alt="Settlement tab" caption="Tambah settlement type dan pilih jenis daripada dropdown." >}}
7. **Semak**: Periksa jumlah, cukai, dan sebarang amaran had kredit
8. **Simpan**: Klik **Create** untuk simpan sebagai DRAFT
{{< figure src="/images/internal-sales-order-applet/so-create-5.png" alt="Save button to save the sales order" caption="Simpan sales order yang dicipta." >}}

{{< figure src="/images/internal-sales-order-applet/so-cash.png" alt="cash type settlement type" caption="Contoh settlement type: Cash." >}}

9. **Finalize dan Sahkan**: Klik **FINAL** untuk post pesanan dan sahkan ia muncul dalam Pick Pack Queue atau Delivery Items (jika anda mempunyai akses)

{{< figure src="/images/internal-sales-order-applet/so-create-6.png" alt="Final button" caption="Butang Final untuk mempost pesanan dalam Sales Order Applet." >}}

---

### Untuk Gudang dan Pemenuhan: Proses Pick Pack Queue

**Matlamat:** Sediakan dan hantar item untuk penghantaran.

1. **Navigasi**: Pergi ke **Pick Pack Queue**
2. **Tapis**: Cari mengikut branch, tarikh, atau customer
{{< figure src="/images/internal-sales-order-applet/pick-pack.png" alt="Search filter in Pick Pack Queue" caption="Search filter di Pick Pack Queue." >}}
3. **Pilih Pesanan**: Dikumpulkan mengikut nombor Sales Order

{{< figure src="/images/internal-sales-order-applet/so-pick-pack.png" alt="Pick Pack Queue listing with grouped sales orders and line items" caption="Pick Pack Queue: Line items berkumpulan untuk pemenuhan dan persediaan penghantaran." >}}

4. **Tetapkan Qty to Deliver**: Sahkan kuantiti penghantaran
5. **Sahkan Delivery Details**: Pastikan delivery branch dan location sepadan
6. **Ready to Ship**: Cipta kerja penghantaran
7. **Post to Warehouse Picking Queue**: Hantar ke WMS jika diaktifkan
8. **Print Delivery Items**: Jana dokumen penghantaran untuk dispatch
9. **Kemas kini Status Penghantaran**: Rekod status delivered/partial dan remarks

**Hasil:** Pesanan bergerak daripada kemasukan jualan ke pemenuhan dan penghantaran.

---

### Untuk Kewangan dan AR/AP: Finalize dan Settlement

**Matlamat:** Pastikan pesanan sah dari segi kewangan dan diselesaikan.

1. **Semak Final Orders**: Pastikan status posting adalah FINAL
2. **Semak Had Kredit**: Sahkan semakan had kredit telah lulus
3. **Settlement**: Tambah settlement lines atau receipt vouchers
4. **Generate Sales Invoice**: Guna **Generate Sales Invoices** jika diaktifkan
5. **Export**: Gunakan File Export atau reports untuk rekonsiliasi
6. **Audit**: Semak **Events** dan **Trace Document** untuk status history dan pautan hiliran
7. **Close**: Tetapkan **CLOSE** apabila penghantaran dan invois selesai (jika diaktifkan)

**Hasil:** Sales order ditutup secara kewangan dan sedia audit.

---

### Untuk Admin: Persediaan Awal

**Matlamat:** Konfigurasikan applet untuk pemprosesan pesanan yang konsisten.

1. **Tetapkan Defaults**: Branch, location, currency, dan posting status
2. **Konfigurasi Workflow**: Routing kelulusan dan peraturan finalization
3. **Aktifkan Tab Utama**: Delivery, settlement, attachments, dan ecomsync
4. **Takrifkan Printables**: Format sales order dan delivery
5. **Konfigurasi Email Templates**: Format e-mel sales order dan penerima
6. **Tetapkan Kebenaran**: Kawalan akses peranan dan pasukan
7. **Uji Aliran**: Cipta pesanan ujian dan jalankan FINAL → Pick Pack → Delivery

**Hasil:** Pengguna melihat menu yang betul dan pesanan mengikuti kitaran hidup terkawal.

---

## Sales Order Core

### Sales Order Listing

Listing ialah papan pemuka operasi untuk sales order. Ia menyediakan carian lanjutan dan tindakan pukal:
- Cari mengikut nombor dokumen, customer, tarikh, atau status
- Tindakan pukal: FINAL, DRAFT, DISCARD, VOID, PRINT
- Hantar e-mel dengan template dan format printable
- Kemas kini marketplace secara pukal (jika diaktifkan)

{{< figure src="/images/internal-sales-order-applet/so-main-listing.png" alt="Sales Order main listing page with filters, bulk actions, and grid results" caption="Main Listing: Cari dan urus sales order dengan tindakan pukal dan penapis." >}}

### Cipta dan Edit Sales Orders

Skrin edit menggunakan tab (atau panel accordion dalam UI ringkas). Susunan tab dan keterlihatan dikawal oleh settings dan permissions, jadi sesetengah tab mungkin disembunyikan atau disusun semula.

**Edit Sales Order: Tabs dan Fungsinya**

| Tab | Untuk apa | Tindakan Biasa |
|---|---|---|
| **Search Document** | Cari dan rujuk dokumen lain semasa cipta draf | Cari dokumen sumber untuk asas pesanan (kelihatan untuk TEMP/DRAFT sahaja) |
| **Main Details** | Data header teras sales order | Tetapkan branch, location, transaction date, customer, sales agent, currency, terma/had kredit, dan tindakan posting (DRAFT/FINAL/VOID/CLOSE) |
| **Account** | Butiran billing dan shipping | Urus bill-to/ship-to kontak dan alamat, salin billing ke shipping |
| **Lines** | Line items sales order | Lihat dan edit item, harga, cukai, diskaun, serial/batch/bin, dan medan delivery per line |
| **ARAP** | Konteks receivables/payables | Semak baki AR/AP atau maklumat kewangan berkaitan |
| **Delivery Details** | Medan khusus penghantaran | Tetapkan delivery branch/location, requested dates, logik penghantaran, butiran PIC |
| **Delivery Plans** | Penjadualan penghantaran | Cipta dan lihat entri delivery plan |
| **Settlement** | Entri pembayaran/terimaan | Tambah settlement lines, urus receipts, semak jumlah settlement |
| **KO For** | Rujukan knock-off | Padankan atau import knock-off allocations (kelihatan untuk TEMP/DRAFT sahaja) |
| **Receipt Voucher** | Senarai receipt voucher | Lihat receipt voucher berkaitan pesanan |
| **Department Hdr** | Tagging jabatan pada header | Terapkan peruntukan jabatan atau cost center di peringkat header |
| **Trace Document** | Posting dan kebolehkesanan | Jejak aliran dokumen, pautan posting, dan dokumen hiliran |
| **Contra** | Entri contra | Lihat atau tambah contra offsets yang dikaitkan |
| **Doc Link** | Dokumen berkaitan | Lihat dokumen pautan (quotation, invoice, delivery docs, dll.) |
| **Attachments** | Fail sokongan | Muat naik dan urus lampiran pesanan |
| **Export** | Utiliti eksport | Eksport data pesanan apabila diaktifkan |
| **Ecomsync** | Sync marketplace | Lihat status marketplace, butiran sync, dan printables untuk pesanan e-dagang |
| **Status** | Penjejakan status tersuai | Kemas kini medan status tersuai yang dikonfigurasi |
| **Events** | Sejarah aktiviti | Lihat events sistem dan perubahan status |
| **Gross Profit** | Keterlihatan keuntungan | Lihat gross profit pesanan (berasaskan kebenaran) |

**Tab Editor Line Item (dalam satu line item)**

| Tab | Untuk apa | Tindakan Biasa |
|---|---|---|
| **Item Details** | Data teras line item | Kuantiti, unit price, diskaun, cukai, UOM |
| **Grouped Item** | Kandungan bundle | Semak child items untuk item berkumpulan atau bundle |
| **Serial Number** | Item kawalan serial | Imbas atau pilih serial numbers |
| **Batches** | Item kawalan batch | Tetapkan batches dan kuantiti |
| **Bin** | Item kawalan bin | Tetapkan lokasi bin |
| **Stock Availability** | Semakan ketersediaan stok | Lihat baki stok dan availability mengikut location |
| **MRP** | Pautan MRP | Pautkan ke job orders jika diaktifkan |
| **Costing Details** | Konteks kos dan margin | Semak nilai kos jika diaktifkan |
| **Issue Link** | Pautan isu/tugasan | Pautkan line ini kepada rekod isu atau tugasan |
| **Sales History** | Data jualan sejarah | Semak jualan lepas untuk item tersebut |


### Posting Status Controls

| Status | Makna | Kegunaan Biasa |
|--------|---------|-------------|
| **DRAFT** | Dokumen draf | Digunakan semasa kemasukan data dan semakan |
| **FINAL** | Dokumen dipost | Diluluskan dan sedia untuk pemenuhan |
| **VOID** | Dokumen dibatalkan | Dibatalkan selepas posting |
| **DISCARD** | Draf dipadam | Buang draf sebelum posting |
| **CLOSE** | Pesanan ditutup | Halang pemprosesan lanjut |

## Approval and Permissions

Gunakan approvals dan permissions untuk mengawal siapa yang boleh finalize, edit, atau void pesanan.

- **Approval flow**: Konfigurasikan routing dan peraturan FINAL dalam settings untuk penguatkuasaan semakan sebelum posting
- **Credit limit control**: FINAL disekat apabila had kredit customer dilampaui (jika diaktifkan)
- **Role permissions**: Hadkan akses kepada tab sensitif (Settlement, Gross Profit, Export) dan tindakan (VOID, CLOSE)
- **Audit visibility**: Guna tab **Events** dan **Status** untuk semakan sejarah status dan perubahan

## Line Item Management

Line items ialah nadi sales order. Gunakannya untuk mengawal harga, peraturan pemenuhan, dan validasi pada peringkat item:
- Edit line items sedia ada; line baharu dicipta dalam Sales Order.
- Kawal harga, cukai, dan diskaun
- Diskaun kumpulan pada peringkat dokumen
- Validasi serial number
- Pengendalian batch dan bin
- Semakan ketersediaan stok
- Butiran kos dan sejarah jualan
- Pautan job order MRP (jika diaktifkan)

{{< figure src="/images/internal-sales-order-applet/so-line-manage.png" alt="Line item management" caption="Senarai line item." >}}

{{< figure src="/images/internal-sales-order-applet/so-line-edit.png" alt="Line item edit" caption="Edit line item dalam applet." >}}

---

## Delivery and Fulfillment

### Delivery Details

- Delivery branch dan location
- Requested delivery dates
- Arahan penghantaran dan tracking

### Pick Pack Queue

- Sales order dan line items berkumpulan
- Kuantiti untuk dihantar vs baki
- Keterlihatan stok di peringkat location dan syarikat

{{< figure src="/images/internal-sales-order-applet/so-pick-pack.png" alt="Pick Pack Queue listing with grouped sales orders and line items" caption="Pick Pack Queue: Line items berkumpulan untuk pemenuhan dan persediaan penghantaran." >}}

### Delivery Items

- Senarai delivery item untuk penghantaran
- Dokumen penghantaran boleh dicetak
- Keterlihatan pantas status penghantaran dan remarks

{{< figure src="/images/internal-sales-order-applet/so-delivery-plan.png" alt="Delivery Items listing showing items prepared for shipment" caption="Delivery Items: Senarai penghantaran per line dengan sokongan cetakan." >}}

### Delivery Plan and Calendar

- Rancang sesi dan jadual penghantaran
- Paparan kalendar untuk perancangan dispatch

{{< figure src="/images/internal-sales-order-applet/so-delivery-plan.png" alt="Delivery plan to create and view scheduled delivery sessions" caption="Delivery Plan: Jadual dan urus sesi penghantaran." >}}

{{< figure src="/images/internal-sales-order-applet/so-calendar.png" alt="Delivery plan calendar view showing scheduled delivery sessions" caption="Delivery Plan Calendar: Lihat jadual penghantaran pada kalendar." >}}

---

## E-commerce Integration

- Papan pemuka dan scheduler Ecomsync
- Keterlihatan pesanan marketplace
- Balas ulasan dan penjejakan ulasan
- Pengendalian pesanan Lazada dan Shopee

{{< figure src="/images/internal-sales-order-applet/so-shopee-ecomsync.png" alt="Ecomsync dashboard showing marketplace sync status and order updates" caption="Shopee Ecomsync Dashboard: Status sync marketplace dan pemantauan pesanan." >}}

{{< figure src="/images/internal-sales-order-applet/so-lazada-ecomsync.png" alt="Ecomsync dashboard showing marketplace sync status and order updates" caption="Lazada Ecomsync Dashboard: Status sync marketplace dan pemantauan pesanan." >}}

---

## Reports and Analytics

- **Sales Order Detailed Report**: Penapisan julat tarikh
- **SO Line with SI KO Report**: Penjejakan knock-off dan outstanding
- **Line Items Listing**: Open qty dan keterlihatan per line
- **Gross Profit View**: Diaktifkan dalam paparan pesanan (jika dibenarkan)

{{< figure src="/images/internal-sales-order-applet/so-detailed-report.png" alt="Sales Order Detailed Report with date range filtering and grouped results" caption="Sales Order Detailed Report: Pelaporan terperinci secara berkumpulan mengikut pesanan dan line." >}}

---

## File Import and Export

### File Import

- Muat naik fail CSV
- Pilih delimiter
- Sahkan dengan helper checking dan senarai ralat
- Gunakan format contoh untuk templat yang betul

{{< figure src="/images/internal-sales-order-applet/so-file-import.png" alt="File Import page with CSV upload and delimiter selection" caption="File Import: Muat naik fail CSV dan sahkan data sales order." >}}

### File Export

- Jana eksport mengikut julat tarikh transaksi
- Jejak status penjanaan
- Muat turun fail eksport untuk rekonsiliasi

{{< figure src="/images/internal-sales-order-applet/so-file-export.png" alt="File Export listing showing report generation status and download actions" caption="File Export: Jana dan muat turun eksport sales order." >}}

---

## Configuration & Settings

Applet Pesanan Jualan Dalaman sangat boleh dikonfigurasi. Tetapan diakses di:
`Settings`

{{< figure src="/images/internal-sales-order-applet/so-setting-page.png" alt="Settings page for Internal Sales Order Applet showing configuration modules" caption="Settings: Konfigurasi default, workflow, printables, dan keterlihatan fitur." >}}

### Application Settings

Togol dan default umum:
- Default branch dan location
{{< figure src="/images/internal-sales-order-applet/so-def-branch.png" alt="Settings for default branch and location" caption="Settings: Konfigurasi default branch dan location untuk applet." >}}
- Keterlihatan kolum dan kawalan carian lanjutan
{{< figure src="/images/internal-sales-order-applet/so-set-vis.png" alt="Applet sub menu setting" caption="Settings: Konfigurasi keterlihatan fitur." >}}

### Printable Format Settings

- Konfigurasi layout cetakan sales order
- Aktifkan auto preview dan batch printing

{{< figure src="/images/internal-sales-order-applet/so-print.png" alt="Printable format setting" caption="Settings: Konfigurasi printable format. Tanda printable format untuk menetapkannya sebagai default." >}}

{{< figure src="/images/internal-sales-order-applet/so-add-print.png" alt="Add printable format setting" caption="Settings: Tambah dan konfigurasi printable format baharu." >}}

### Branch and Settlement Settings

- Tingkah laku settlement mengikut branch
- Default payment dan receipt voucher

{{< figure src="/images/internal-sales-order-applet/so-set-branch.png" alt="Add or edit branch" caption="Settings: Konfigurasi branch." >}}

### Email Templates

- Templat e-mel untuk sales order
- Konfigurasi penerima (billing, shipping)

{{< figure src="/images/internal-sales-order-applet/so-email-temp.png" alt="Add email template to be used in the applet" caption="Settings: Konfigurasi email template yang akan digunakan oleh applet." >}}

### Sales Order Status

- Senarai status pesanan tersuai
- Tag status untuk pelaporan dan penjejakan

{{< figure src="/images/internal-sales-order-applet/so-status.png" alt="Add or edit Sales Order Status" caption="Settings: Konfigurasi Sales Order status." >}}

### Feature Visibility and Permissions

- Konfigurasi keterlihatan fitur
- Set kebenaran peranan dan pasukan
- Kawalan kebenaran di pihak klien

{{< figure src="/images/internal-sales-order-applet/so-perm.png" alt="Add or edit user permission" caption="Settings: Konfigurasi kebenaran pengguna dan peranan." >}}

### Personalization

- Tetapkan default branch, location, dan currency untuk mempercepat kemasukan
- Sesuaikan kolum yang kelihatan dan medan carian lanjutan untuk pasukan
- Gunakan menu berasaskan peranan untuk memudahkan UI bagi pengguna tertentu

---

**Senarai semak persediaan yang disyorkan:**

1. **Tetapkan Defaults**: Branch, location, currency, dan posting status
2. **Aktifkan Tab Diperlukan**: Delivery, settlement, dan attachments
3. **Konfigurasi Approval Rules**: Workflow dan kawalan kebenaran
4. **Takrifkan Printables**: Format sales order dan delivery
5. **Sahkan Had Kredit**: Aktifkan semakan had kredit jika perlu
6. **Aktifkan Ecomsync**: Untuk integrasi marketplace dan penjejakan

---

## Audit and History

Gunakan alat tracing dan history terbina dalam untuk menjejak perubahan dan dokumen hiliran.

- **Tab Events**: Semak perubahan status, suntingan, dan tindakan sistem
- **Trace Document**: Ikuti aliran dokumen ke delivery, invoices, dan settlement
- **Listing export**: Eksport pesanan yang ditapis untuk rekonsiliasi atau sampling audit

---

## FAQ

**S: Mengapa saya tidak boleh nampak butang FINAL?**  
J: Tindakan FINAL mungkin disembunyikan oleh settings atau dihadkan oleh permissions.

**S: Bagaimana saya boleh mengaktifkan delivery details pada pesanan?**  
J: Aktifkan **Delivery Details** dalam `Settings > Application Settings`.

**S: Mengapa pesanan gagal semakan had kredit?**  
J: Had kredit customer mungkin telah melebihi. Kemas kini had kredit atau kurangkan nilai pesanan.

**S: Bolehkah saya edit pesanan yang telah FINAL?**  
J: Dalam kebanyakan konfigurasi, pesanan FINAL akan dikunci. Jika perlu perubahan, gunakan tindakan yang dibenarkan (VOID/CLOSE) dan cipta semula atau keluarkan pesanan baharu mengikut polisi anda.

**S: Mengapa saya tidak boleh ubah tarikh penghantaran selepas FINAL?**  
J: Medan delivery mungkin dikunci selepas posting. Kemas kini melalui Delivery Plan/Delivery Items atau laraskan settings jika aliran kerja anda membenarkan suntingan.

**S: Bolehkah saya cetak beberapa sales order sekali gus?**  
J: Ya. Gunakan **Batch Printing** daripada menu atau **SINGLE/MULTIPLE PRINT** dalam listing.

**S: Bagaimana saya import sales order secara pukal?**  
J: Guna **File Import**, muat naik CSV, dan sahkan melalui helper checking.

**S: Mengapa saya tidak boleh melihat Pick Pack Queue atau Delivery Items?**  
J: Menu ini mungkin disembunyikan oleh settings atau dihadkan oleh permissions. Semak **Feature Visibility** dan permissions peranan.

**S: Bagaimana saya hantar e-mel Sales Order kepada customer?**  
J: Dari listing, pilih pesanan, pilih email template, pilih penerima Billing atau Shipping, kemudian klik **Send Email**.

**S: Bagaimana saya boleh sync semula pesanan marketplace?**  
J: Buka pesanan dan gunakan tab **Ecomsync** untuk menyemak status sync dan jalankan semula tindakan sync (jika diaktifkan).
