---
title: "Applet Baucar Pembayaran Dalaman"
description: "Pemprosesan baucar pembayaran dalaman hujung-ke-hujung: cipta baucar, urus perbelanjaan dan pembayaran, urus settlement dan penyesuaian, serta eksport atau import baucar secara pukal."
tags:
- internal-payment-voucher
- finance
- accounts-payable
- payments
- settlement
- contra
- intercompany
- import
- export
weight: 20
---

## Tujuan dan Gambaran Keseluruhan

**Internal Payment Voucher Applet** memperkemas keseluruhan kitar hayat baucar pembayaran dalaman, daripada penciptaan dan pengambilan perbelanjaan kepada settlement, penyesuaian, dan posting akhir. Ia menghimpunkan butiran header baucar, baris perbelanjaan, baris pembayaran, serta kebolehkesanan supaya pasukan kewangan boleh memproses pembayaran dengan pantas dan terkawal melalui menu utama: **Internal Payment Voucher**, **File Import**, **File Export**, **Intercompany**, **Settlement Adjustment**, dan **Expenses Adjustment**.

{{< callout type="info" >}}
**Konsep Teras**: Applet ini menghubungkan **siapa** yang dibayar (entity/supplier) kepada **apa** yang dibayar (baris perbelanjaan) dan **bagaimana** ia diselesaikan (baris pembayaran, contra, dan penyesuaian) sambil mengekalkan kebolehkesanan posting dan audit.
{{< /callout >}}

## Mengenai Applet

- **Tujuan**: Mencipta, menjejak, dan memuktamadkan baucar pembayaran dalaman dengan settlement, penyesuaian, dan kawalan audit.
- **Pengguna Sasaran**: Kerani Accounts Payable, eksekutif kewangan, operasi treasury/pembayaran, dan pengawal kewangan.
- **Ciri Utama**: Pengurusan kitar hayat baucar, pengambilan perbelanjaan dan item baris, pengendalian pembayaran dan settlement, penyesuaian dan contra, pemprosesan intercompany, import/eksport fail, serta kawalan operasi seperti **Final/Discard/Void**, **Send Email**, **Single/Multiple Print**, dan **Clone**.

## Gambaran Ciri Utama

### Siapa yang Mendapat Manfaat daripada Applet Ini?

**Accounts Payable dan Eksekutif Kewangan:**
- Penciptaan baucar yang pantas dan suntingan yang terkawal
- Keterlihatan jelas terhadap perbelanjaan, pembayaran, dan baki
- Tindakan terbina untuk final, discard, atau void

**Treasury dan Operasi Pembayaran:**
- Baris pembayaran yang tersusun dan penjejakan settlement
- Fail pembayaran sedia dieksport untuk pemprosesan bank
- Koordinasi masa dan kaedah pembayaran yang lebih baik

**Pengurus dan Pengawal Kewangan:**
- Dokumen sedia semak dan konsistensi settlement
- Keterlihatan Trace Document sebelum penutupan tempoh
- Jejak audit untuk pematuhan

**Juruaudit dan Pematuhan:**
- Sejarah penuh perubahan baucar dan status
- Kebolehkesanan daripada baucar ke posting
- Lampiran dan pemautan dokumen

### Masalah Apa yang Diselesaikan?

**Masalah Baucar Pembayaran Manual:**

Baucar pembayaran manual sering menyebabkan:
- Butiran perbelanjaan yang hilang atau tidak konsisten
- Kelulusan lambat dan pembayaran tertangguh
- Baki settlement yang tidak jelas
- Jejak audit lemah dan kebolehkesanan yang rendah

**Penyelesaian Internal Payment Voucher Applet:**

- **Pengambilan baucar berstruktur** dengan header, perbelanjaan, dan pembayaran
- **Kawalan settlement terbina** dan penyesuaian
- **Pengendalian Contra** untuk mengimbangi baki
- **Pemprosesan Intercompany** untuk settlement merentas entiti
- **Fail sedia dieksport** untuk run pembayaran seterusnya
- **Keterlihatan sedia audit** melalui trace dan log

## Gambaran Ciri Utama

{{< cards >}}
  {{< card title="Voucher Management" subtitle="Create, edit, and finalize internal payment vouchers" link="#voucher-management" >}}
  {{< card title="Line Item and Expenses" subtitle="Capture expense details with cost coding" link="#line-item-and-expenses" >}}
  {{< card title="Payments and Settlement" subtitle="Add payment lines and manage settlement" link="#payments-and-settlement" >}}
  {{< card title="Adjustments and Contra" subtitle="Handle expenses and settlement adjustments" link="#adjustments-and-contra" >}}
  {{< card title="File Import" subtitle="Bulk creation of payment vouchers" link="#file-import" >}}
  {{< card title="File Export (CSV)" subtitle="Generate payment export files by date" link="#file-export-csv" >}}
  {{< card title="Intercompany Processing" subtitle="Track unprocessed and processed intercompany" link="#intercompany-processing" >}}
  {{< card title="Trace and Audit" subtitle="Trace documents and audit logs" link="#trace-and-audit" >}}
{{< /cards >}}

{{< figure src="/images/internal-payment-voucher-applet/internal-payment-voucher-overview.png" alt="Internal Payment Voucher overview infographic" caption="Infographic highlighting challenges, solutions, and beneficiary roles." >}}

gambaran keseluruhan baucar pembayaran dalaman

## Konsep Utama

### Memahami Rangka Kerja Baucar Pembayaran

| Aspek | Komponen | Contoh Praktikal |
|--------|-----------|------------------|
| **Siapa** dibayar? | Entity atau Supplier | Vendor ABC Trading |
| **Apa** dibayar? | Expense Line Item | Freight Charge, RM 2,500 |
| **Bagaimana** diselesaikan? | Payment Line dan Settlement | Bank transfer, contra offset |
| **Di mana** ia dipost? | AR/AP dan Trace Document | Posting to AP and Cashbook |

{{< callout type="tip" >}}
**Contoh**: Baucar pembayaran untuk caj penghantaran dicipta, dipautkan kepada supplier, diberi cost coding, dibayar melalui bank transfer, dan ditrace kepada posting akhir untuk audit.
{{< /callout >}}

### Struktur Hierarki Baucar Pembayaran

```
Organization
│
├── Entities/Suppliers ──> WHO is paid?
│   │
│   └── Voucher Header ──> Core document details
│       │
│       ├── Account & Address Details
│       ├── Expense Lines & Cost Coding
│       └── Payment Lines & Settlement
│
└── Adjustments & Contra ──> Balance corrections
    │
    └── Trace Document ──> Posting visibility
```

**Aliran Melalui Hierarki:**

1. **Organization**: Polisi dan kawalan syarikat
2. **Entity**: Supplier atau penerima bayaran
3. **Voucher Header**: Cawangan, tarikh, mata wang, rujukan
4. **Expenses**: Item baris dan peruntukan kos
5. **Payments**: Kaedah dan butiran settlement
6. **Adjustments/Contra**: Pembetulan dan offset
7. **Trace Document**: Status posting dan audit

### “Settlement Triangle” Pembayaran

| Komponen | Peranan | Contoh |
|-----------|------|---------|
| **Voucher Header** | Dokumen yang dibayar | IPV-2026-00045 |
| **Payment Lines** | Cara pembayaran dilaksanakan | Bank transfer, cheque |
| **Settlement/Contra** | Cara baki diselesaikan | Offset against AP invoice |

Segi tiga ini memastikan pemprosesan pembayaran konsisten dan boleh diaudit. Jika satu sisi berubah, dua sisi yang lain perlu disemak untuk memastikan baucar kekal seimbang.

---

## Panduan Permulaan Pantas

{{< figure src="/images/internal-payment-voucher-applet/internal-payment-voucher-quick-start.png" alt="Quick start infographic for Internal Payment Voucher" caption="Role-based quick start flow for creating, reviewing, and exporting vouchers." >}}

### Untuk Eksekutif Kewangan: Cipta Baucar Pembayaran Pertama Anda

1. Pergi ke **Internal Payment Voucher** dari sidebar.
{{< figure src="/images/internal-payment-voucher-applet/pv.png" alt="Internal Payment Voucher listing" caption="Listing view with filters, actions, and email template selection." >}}
2. Klik **+** dan isi butiran utama (cawangan, syarikat, tarikh, mata wang, rujukan).
{{< figure src="/images/internal-payment-voucher-applet/pv-add.png" alt="Add Internal Payment Voucher button" caption="Plus button on the listing used to create a new voucher." >}}
3. Buka **Account** dan pilih entity, billing, dan shipping details.
{{< figure src="/images/internal-payment-voucher-applet/pv-entity.png" alt="Account tab with Entity Details" caption="Entity Details fields for the payee in the Account tab." >}}

{{< figure src="/images/internal-payment-voucher-applet/pv-entity-select.png" alt="Select Entity dialog" caption="Entity selection list used to populate Account details." >}}

4. Buka **Expenses** dan tambah item baris dengan jumlah serta cost coding.

{{< figure src="/images/internal-payment-voucher-applet/pv-expenses.png" alt="Expenses tab with item list and Select Item" caption="Expenses tab with line list and item selection panel." >}}

{{< figure src="/images/internal-payment-voucher-applet/pv-expenses-line.png" alt="Add Item form - Item Details" caption="Add Item form showing Item Details fields." >}}

{{< figure src="/images/internal-payment-voucher-applet/pv-batch.png" alt="Add Item form - Batch Number" caption="Batch Number tab for lot-controlled items." >}}

{{< figure src="/images/internal-payment-voucher-applet/pv-sn.png" alt="Add Item form - Serial Number" caption="Serial Number tab for serialized items with scan/import." >}}

{{< figure src="/images/internal-payment-voucher-applet/pv-bi.png" alt="Add Item form - Item Details (Main Details)" caption="Item Details main fields for the selected item." >}}

{{< figure src="/images/internal-payment-voucher-applet/pv-cost.png" alt="Add Item form - Costing Details" caption="Costing Details tab for cost allocation and pivot view." >}}

{{< figure src="/images/internal-payment-voucher-applet/pv-issue-link.png" alt="Add Item form - Issue Link" caption="Issue Link tab for linking related issues or tickets." >}}

5. Buka **Payment** dan tambah baris pembayaran supaya sepadan dengan amaun perlu dibayar.

{{< figure src="/images/internal-payment-voucher-applet/pv-payment.png" alt="Payment tab in voucher edit" caption="Payment tab ready for settlement lines." >}}

{{< figure src="/images/internal-payment-voucher-applet/pv-payment-add.png" alt="Add Settlement drawer" caption="Add Settlement form with Settlement Group and Method." >}}

**Rujukan Jenis Settlement (contoh; bergantung pada kaedah pembayaran yang dikonfigurasi):**

| Jenis Settlement | Bila Digunakan | Nota |
|-----------------|-------------|-------|
| **Cash** | Pembayaran tunai semasa pemprosesan | Dipost ke cashbook selepas Final |
| **Bank Transfer** | Pembayaran antara bank | Catat rujukan bank jika perlu |
| **Cheque** | Pembayaran cek | Rekod nombor dan tarikh cek |
| **Contra/Offset** | Offset terhadap dokumen berkaitan | Mengurangkan baki terbuka tanpa pergerakan tunai |
| **Other (FPX/e-Wallet)** | Saluran pembayaran digital | Digunakan jika dikonfigurasi dalam kaedah settlement |

{{< figure src="/images/internal-payment-voucher-applet/pv-payment-data.png" alt="Payment lines with totals" caption="Payment line list showing total payment and balances." >}}

6. Semak **AR/AP** atau **Settlement Adjustment** jika baki bukan sifar.

{{< figure src="/images/internal-payment-voucher-applet/pv-arap.png" alt="AR/AP tab summary" caption="AR/AP summary for settlement, contra, and outstanding balances." >}}

7. Tambah **Doc Link** atau **Attachments** jika kelulusan atau invois perlu disimpan.

{{< figure src="/images/internal-payment-voucher-applet/pv-doc-link.png" alt="Doc Link tab" caption="Doc Link tab for linking related documents." >}}

{{< figure src="/images/internal-payment-voucher-applet/pv-attach.png" alt="Attachments tab" caption="Attachments tab for uploading supporting files." >}}

8. Klik **Save** untuk draf atau **Final** untuk mengunci baucar.

{{< figure src="/images/internal-payment-voucher-applet/pv-save.png" alt="Save action in voucher edit" caption="Save button on the voucher form." >}}

**Apa seterusnya?** Pengurus atau pengawal boleh menyemak dan memuktamadkan, dan Trace Document akan memaparkan status posting apabila tersedia.

{{< callout type="tip" >}}
**Pro Tip**: Gunakan **Send Email** dan **Single/Multiple Print** pada listing untuk mempercepat komunikasi dan kelulusan.
{{< /callout >}}

---

### Untuk Pengurus/Pengawal: Semak dan Final

1. Buka **Internal Payment Voucher** dan tapis mengikut status atau tarikh.
{{< figure src="/images/internal-payment-voucher-applet/pv-stat-date.png" alt="Advanced search filters" caption="Status and date range filters for the listing." >}}
2. Semak **Main Details**, **Expenses**, dan **Payment** tabs untuk kelengkapan.
{{< figure src="/images/internal-payment-voucher-applet/pv-edit.png" alt="Edit Internal Payment Voucher - Main Details" caption="Edit view showing Main Details fields and actions." >}}

{{< figure src="/images/internal-payment-voucher-applet/pv-expenses-edit.png" alt="Expenses tab in edit view" caption="Expenses tab with line items and totals." >}}

{{< figure src="/images/internal-payment-voucher-applet/pv-payment-edit.png" alt="Payment tab in edit view" caption="Payment tab showing settlement lines and totals." >}}

{{< figure src="/images/internal-payment-voucher-applet/pv-payment-edit-1.png" alt="Edit Payment form" caption="Edit Payment form with Settlement Type, Method, Date, and Amount." >}}

3. Semak **Settlement Adjustment** atau **Contra** jika baki tidak sepadan.

{{< figure src="/images/internal-payment-voucher-applet/pv-contra.png" alt="Contra tab in voucher edit" caption="Contra tab listing offsets and balances." >}}

{{< figure src="/images/internal-payment-voucher-applet/pv-contra-add.png" alt="Add Contra button" caption="Plus button used to add a contra document." >}}

{{< figure src="/images/internal-payment-voucher-applet/pv-contra-add-1.png" alt="Select document to contra" caption="Selection list for choosing documents to offset." >}}

4. Semak **Trace Document** (jika tersedia) untuk mengesahkan kesediaan posting.

{{< figure src="/images/internal-payment-voucher-applet/pv-trace-doc.png" alt="Trace Document tabs" caption="Trace Document tabs for Journal, Cashbook, Points, Tax, and Inventory." >}}

**Perbezaan Trace Document**

| Jenis Trace | Apa yang Diwakili | Bila Muncul | Kenapa Penting |
|------------|--------------------|----------------|----------------|
| **Journal Txn** | Posting lejar am | Selepas baucar **Final** dan GL posting dicipta | Mengesahkan akaun debit/kredit dan amaun |
| **Cashbook Txn** | Pergerakan tunai atau bank | Selepas baucar **Final** dan kaedah settlement dipost ke cash/bank | Mengesahkan kesan tunai/bank dan rujukan |
| **Points Txn** | Pergerakan lejar mata | Hanya apabila settlement berasaskan points digunakan | Mengesahkan penebusan atau akruan points |
| **Tax Txn** | Posting berkaitan cukai | Apabila cukai dikenakan pada baris perbelanjaan | Mengesahkan amaun cukai dan pemetaan akaun cukai |
| **Inv Txn** | Posting pergerakan inventori | Apabila perbelanjaan menjejaskan item inventori | Mengesahkan kesan stok dan penilaian |

5. Klik **Final** untuk meluluskan, atau **Query** secara offline jika pembetulan diperlukan.

{{< figure src="/images/internal-payment-voucher-applet/pv-final.png" alt="Final action in Trace Document view" caption="Final button highlighted with Trace Document tab open." >}}

---

### Untuk Admin: Persediaan Sistem Awal

1. Konfigurasikan **Settings > Application Settings** untuk memaparkan atau menyembunyikan tab utama.

{{< figure src="/images/internal-payment-voucher-applet/pv-app-setting.png" alt="Application Settings" caption="Application Settings for field visibility and tab configuration." >}}

2. Tetapkan default di **Settings > Default Selection** untuk kemasukan data lebih pantas.

{{< figure src="/images/internal-payment-voucher-applet/pv-deff-setting.png" alt="Default Selection settings" caption="Default Selection settings for branch and location defaults." >}}

3. Tetapkan **Printable Format Settings** untuk output baucar.

{{< figure src="/images/internal-payment-voucher-applet/pv-print-format.png" alt="Printable Format Settings listing" caption="Printable Format Settings listing for voucher templates." >}}

{{< figure src="/images/internal-payment-voucher-applet/pv-print-add.png" alt="Add Printable Format" caption="Add Printable Format form with upload area." >}}

4. Konfigurasikan **Email Template** untuk notifikasi baucar.

{{< figure src="/images/internal-payment-voucher-applet/pv-email.png" alt="Email Template listing" caption="Email Template list for voucher notifications." >}}

{{< figure src="/images/internal-payment-voucher-applet/pv-email-add.png" alt="Create Email Template form" caption="Create Email Template form with printable format and template body." >}}

5. Semak **Permissions** dan keterlihatan medan untuk akses berasaskan peranan.

{{< figure src="/images/internal-payment-voucher-applet/pv-perm-setting.png" alt="Permission Set settings" caption="Permission Set listing for role-based access." >}}

6. Uji aliran penuh baucar (create → payment → final → trace).



---

### Untuk Treasury/Payment Ops: Jana Eksport Pembayaran (CSV)

1. Buka **File Export** dari sidebar.

{{< figure src="/images/internal-payment-voucher-applet/pv-export.png" alt="Payment Voucher File Export listing" caption="File Export listing with Generate CSV and export history." >}}

2. Pilih julat tarikh transaksi.

{{< figure src="/images/internal-payment-voucher-applet/pv-export-date.png" alt="File Export date range filters" caption="Choose transaction date range before generating CSV." >}}

3. Klik **Generate CSV** untuk memuat turun fail pembayaran.

{{< figure src="/images/internal-payment-voucher-applet/pv-generate-csv.png" alt="Generate CSV action" caption="Generate CSV button in File Export." >}}

4. Sahkan eksport muncul dalam listing.

{{< figure src="/images/internal-payment-voucher-applet/pv-saved-gene.png" alt="Generated export entry" caption="Export listing showing a generated CSV with download action." >}}

---

### Untuk Operasi Kewangan: Import Baucar Pembayaran Secara Pukal

1. Buka **File Import** dari sidebar.
{{< figure src="/images/internal-payment-voucher-applet/pv-file-import.png" alt="File Import listing" caption="File Import listing with uploaded files and statuses." >}}
2. Muat turun dan isi templat import (Excel/CSV). Fail templat Excel/CSV boleh dimuat turun dari menu **File Export**.

3. Muat naik fail dan semak tab **Checking**.
{{< figure src="/images/internal-payment-voucher-applet/pv-import-check.png" alt="File Import Checking tab" caption="Checking tab showing validation results." >}}
4. Baiki ralat dan muat naik semula jika perlu.
5. Sahkan import dan semak baucar yang dicipta.


{{< callout type="tip" >}}
**Senarai semak pelaksanaan baharu**: Sahkan aliran penuh daripada draf hingga Final, termasuk baris pembayaran, penyesuaian, dan keterlihatan Trace Document.
{{< /callout >}}

---

## Peruntukan Pembayaran dan Penjejakan Settlement

Baucar pembayaran dianggap lengkap hanya apabila kedudukan settlement jelas. Bahagian ini menerangkan cara mengesahkan jumlah yang dibayar, diimbangi, dan baki yang belum diselesaikan.

### Cara Memeriksa Kedudukan Settlement

1. Buka baucar dan pergi ke tab **Payment** untuk menyemak baris pembayaran.
2. Semak **Settlement Adjustment** untuk pembetulan atau penyeimbangan.
3. Gunakan **AR/AP** (edit view) untuk mengesahkan jumlah tertunggak dan terselesaikan.
4. Semak semula jumlah selepas sebarang suntingan **Expenses** atau **Payment**.

### Ciri Utama

- Pengiraan semula masa nyata apabila pembayaran atau perbelanjaan berubah
- Aliran kerja settlement adjustment untuk pembetulan
- Sokongan Contra untuk offset dokumen berkaitan

### Senario Biasa

**Senario 1: Pembayaran Separuh**
```
Voucher amount: RM 10,000
Payment recorded: RM 6,000
Status: Partially settled, RM 4,000 outstanding
```

**Senario 2: Settlement Penuh dengan Contra**
```
Voucher amount: RM 5,000
Payment: RM 2,000
Contra offset: RM 3,000
Status: Fully settled
```

### Tip untuk Pasukan Kewangan

- Semak semula settlement selepas menyunting baris perbelanjaan
- Gunakan penyesuaian untuk pembetulan lewat, bukan menerbitkan semula baucar
- Sahkan baki tab AR/AP sebelum Final

---

## Pengurusan Baucar

Aliran kerja utama berpusat pada menu **Internal Payment Voucher**:

- **Senarai dan tapis baucar** dengan carian lanjutan dan togol lajur
- **Cipta, edit, dan clone** baucar dari listing
- **Final, discard, atau void** mengikut status dan polisi kawalan
- **Send email** dan **print** baucar dari listing (email memerlukan templat dipilih)
- **Pemilihan templat** untuk Send Email tersedia terus pada toolbar listing

{{< figure src="/images/internal-payment-voucher-applet/pv.png" alt="Internal Payment Voucher listing (alternate view)" caption="Listing view for Internal Payment Voucher." >}}

{{< figure src="/images/internal-payment-voucher-applet/pv-edit.png" alt="Internal Payment Voucher create/edit form" caption="Create/Edit form with tabs for details, expenses, and payment." >}}

**Status Biasa:**

| Status | Makna | Tindakan Tipikal |
|--------|---------|----------------|
| **Draft** | Dalam proses | Teruskan edit dan simpan |
| **Final** | Diluluskan dan dikunci | Teruskan ke posting/trace |
| **Discarded** | Dibatalkan sebelum Final | Tiada impak posting |
| **Voided** | Dibatalkan selepas Final | Jejak audit dikekalkan |

**Tab Cipta/Edit (Teras):**

- **Main Details**: Medan header dokumen (cawangan, tarikh, mata wang, rujukan).
- **Account**: Entity, billing, dan shipping details.
- **Expenses**: Item baris dan cost coding.
- **Payment**: Baris pembayaran dan penjajaran settlement.
- **Department Hdr**: Kod header jabatan.
- **Doc Link**: Pautan ke dokumen berkaitan.

**Tab Cipta/Edit (Hanya Edit atau Bersyarat):**

- **Expenses Adjustment**: Betulkan peruntukan perbelanjaan selepas penciptaan.
- **AR/AP**: Semak baki tertunggak dan terselesaikan.
- **Settlement Adjustment**: Betulkan ketakpadanan settlement.
- **Contra**: Offset baki terhadap dokumen berkaitan.
- **Trace Document**: Trace posting dan status hiliran.
- **Attachments**: Dokumen sokongan dan kelulusan.
- **Export**: Eksport data baucar apabila diaktifkan.
- **Sales Commission**: Pautkan rekod komisen apabila dikonfigurasi.

---

## Item Baris dan Perbelanjaan

Gunakan tab **Expenses** untuk merekod kos terperinci:

- Item baris dengan kuantiti dan amaun
- Butiran harga dan cukai
- Kod jabatan atau cost coding untuk segmen, projek, pusat keuntungan, dan dimensi
- Rujukan item seperti serial, bin, atau batch jika berkenaan
- Isu pautan dan butiran penghantaran (opsyenal)

---

## Pembayaran dan Settlement

Tab **Payment** menguruskan cara baucar dibayar:

- Pelbagai baris pembayaran bagi setiap baucar
- Pengendalian berbilang mata wang dan forex apabila diaktifkan
- Penjajaran settlement dengan perbelanjaan dan penyesuaian
- Semakan kedudukan AR/AP untuk baki tertunggak

**Tip:** Jika butang forex diaktifkan, semak kadar pertukaran sebelum Final untuk mengelakkan varians posting.

---

## Penyesuaian dan Contra

Untuk pembetulan dan pengimbangan:

- **Expenses Adjustment**: Baiki atau realokasikan isu baris perbelanjaan
- **Settlement Adjustment**: Betulkan ketakpadanan settlement
- **Contra**: Offset baki terhadap dokumen berkaitan

Gunakan menu **Settlement Adjustment** dan **Expenses Adjustment** untuk paparan listing penuh dan audit.

{{< figure src="/images/internal-payment-voucher-applet/pv-adjust-set.png" alt="Settlement Adjustment listing" caption="Settlement Adjustment listing for payment vouchers." >}}

{{< figure src="/images/internal-payment-voucher-applet/pv-expenses.png" alt="Expenses Adjustment listing" caption="Expenses Adjustment listing for payment vouchers." >}}

---

## Pemprosesan Intercompany

Menu **Intercompany** memisahkan kerja kepada dua barisan:

- **Unprocessed**: Transaksi intercompany yang belum dipautkan atau diselesaikan
- **Processed**: Pautan intercompany yang telah selesai untuk audit

Ini menyokong aliran pembayaran merentas entiti tanpa kehilangan kebolehkesanan.

{{< figure src="/images/internal-payment-voucher-applet/pv-intercompany.png" alt="Intercompany transaction listing" caption="Intercompany listing with unprocessed and processed tabs." >}}

### Dari Mana Datanya Intercompany Datang

Rekod intercompany dijana daripada **Internal Payment Vouchers** yang ditanda untuk pemprosesan intercompany. Selepas baucar disimpan dan Final, sistem akan mencipta entri intercompany yang muncul dalam barisan **Unprocessed** untuk dipaut atau diselesaikan. Ketersediaan bergantung pada konfigurasi intercompany dan permissions anda.

### Cara Mencipta Transaksi Intercompany

1. Cipta atau buka **Internal Payment Voucher**.
2. Pergi ke **Account** dan buka sub-tab **Intercompany** (jika diaktifkan).
3. Pilih intercompany entity/branch atau medan intercompany yang diperlukan.
4. Simpan dan **Final** baucar.
5. Buka **Intercompany** dari sidebar untuk melihat rekod baharu di bawah **Unprocessed**.
6. Paut atau selesaikan, kemudian sahkan ia berpindah ke **Processed**.

**Tip:** Jika sub-tab **Intercompany** disembunyikan, aktifkan di **Settings > Application Settings** atau semak permissions peranan anda.

---

## File Import

Penciptaan pukal tersedia melalui **File Import**:

1. Muat naik fail sumber (Excel/CSV seperti dalam templat).
2. Sahkan data dalam checking view.
3. Selesaikan ralat dan sahkan import.
4. Buka baucar sampel untuk mengesahkan header, perbelanjaan, dan baris pembayaran.

{{< figure src="/images/internal-payment-voucher-applet/pv-file-import.png" alt="File Import listing" caption="File Import listing with uploaded files and statuses." >}}

---

## File Export CSV

Jana eksport baucar pembayaran untuk run pembayaran seterusnya:

1. Buka **File Export**.
2. Pilih julat tarikh transaksi.
3. Klik **Generate CSV** untuk memuat turun fail.
4. Jika fail kosong, sahkan baucar berstatus **Final** dan berada dalam julat tarikh.

{{< figure src="/images/internal-payment-voucher-applet/pv-export.png" alt="Payment Voucher file export listing" caption="File Export screen for generating voucher CSV output." >}}

---

## Trace dan Audit

- **Di mana untuk trace baucar pembayaran**: Buka **Internal Payment Voucher** dari sidebar, pilih satu baucar, dan pergi ke **Trace Document** dalam edit view. Tab Trace akan muncul selepas baucar **Final**.
- **Trace Document**: Lihat trace posting dan status hiliran (tersedia selepas finalization).
- **Applet Log**: Semak siapa mengubah apa, dan bila (Settings > Applet Log).

Gunakan alat ini untuk menyokong audit dan semakan penutupan tempoh.

---

## Pautan Dokumen dan Lampiran

- **Doc Link**: Sambungkan baucar kepada dokumen berkaitan untuk kebolehkesanan.
- **Attachments**: Simpan invois, kelulusan, dan fail sokongan.
- **Sales Commission**: Pautkan rekod komisen apabila diaktifkan.

---

## Konfigurasi dan Tetapan

Konfigurasikan applet di bawah **Settings**:

- **Application Settings**: Keterlihatan medan, pengaktifan tab, dan tingkah laku pengesahan.
- **Default Selection**: Tetapkan default untuk cawangan, mata wang, dan medan biasa.
- **Printable Format Settings**: Kawal susun atur cetakan baucar dan penjenamaan.
- **Email Template**: Konfigurasikan kandungan email yang digunakan oleh Send Email.
- **Feature Visibility**: Tunjuk atau sembunyikan menu dan ciri mengikut peranan.
- **Permissions**: Set permission sisi klien dan penetapan pengguna/pasukan/peranan.
- **Webhook**: Konfigurasikan notifikasi keluar untuk sistem hiliran.
- **Applet Log**: Jejak audit sistem untuk tindakan baucar.
- **Release Notes**: Jejak perubahan yang dihantar pada applet.

{{< figure src="/images/internal-payment-voucher-applet/pv-app-setting.png" alt="Internal Payment Voucher settings" caption="Settings page for field visibility, defaults, and templates." >}}

---

## Applet Berkaitan

- **[Supplier Maintenance Applet](/applets/supplier-maintenance-applet/)**: Urus data induk supplier yang digunakan dalam baucar pembayaran.
- **[Chart of Account Applet](/applets/chart-of-account-applet/)**: Tentukan akaun GL yang digunakan untuk perbelanjaan dan posting.
- **[General Ledger Applet](/applets/general-ledger-applet/)**: Semak posting jurnal akhir daripada baucar pembayaran.
- **[Cashbook Applet](/applets/cashbook-applet/)**: Sahkan pergerakan tunai dan bank yang berkaitan dengan baucar pembayaran.

---

## Ringkasan

Internal Payment Voucher Applet menyediakan aliran kerja yang terkawal dan boleh diaudit untuk mengurus pembayaran dalaman. Ia menggabungkan entri baucar, pengurusan perbelanjaan dan pembayaran, penyesuaian settlement, pengendalian intercompany, serta import/eksport fail di satu tempat, dengan kebolehkesanan jelas untuk kewangan dan pematuhan.

---

## FAQ

**Q: Mengapa butang Final dinyahdayakan?**
A: Medan wajib mungkin belum lengkap, atau peranan anda tiada kebenaran Final. Semak tab Main Details, Expenses, dan Payment.

**Q: Mengapa tab Payment atau Expenses disembunyikan?**
A: Ia boleh dinyahdayakan di Application Settings atau melalui konfigurasi medan berasaskan peranan.

**Q: Mengapa baucar saya menunjukkan baki tertunggak?**
A: Baris pembayaran dan penyesuaian settlement tidak sepadan sepenuhnya dengan jumlah perbelanjaan. Semak pembayaran, contra, dan penyesuaian.

**Q: Bagaimana saya mengeksport fail pembayaran untuk bank?**
A: Pergi ke **File Export**, pilih julat tarikh transaksi, dan klik **Generate CSV**.

**Q: Di mana saya boleh trace baucar pembayaran?**
A: Buka baucar daripada **Internal Payment Voucher** dan pergi ke **Trace Document** dalam edit view. Tab Trace muncul selepas baucar **Final**.

**Q: Bolehkah saya memautkan baucar kepada dokumen berkaitan?**
A: Ya. Gunakan **Doc Link** untuk menghubungkan dokumen berkaitan dan mengekalkan kebolehkesanan.

**Q: Mengapa fail eksport kosong?**
A: Sahkan baucar berstatus **Final** dan julat tarikh transaksi sepadan dengan tarikh baucar.

**Q: Mengapa saya tidak boleh memilih supplier/entity?**
A: Supplier mungkin tidak aktif atau data induk tidak lengkap, atau peranan anda tiada kebenaran.

**Q: Mengapa Send Email tiada atau dinyahdayakan?**
A: Email mungkin disembunyikan di Application Settings atau peranan anda tiada kebenaran; pastikan juga Email Template telah dipilih.

**Q: Mengapa saya tidak nampak rekod Intercompany?**
A: Anda mungkin tiada akses intercompany, atau tiada transaksi dalam cawangan atau julat tarikh yang dipilih.
