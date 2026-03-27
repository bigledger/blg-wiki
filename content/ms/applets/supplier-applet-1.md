---
title: "Aplet Pembekal"
description: "Pengurusan data induk pembekal yang komprehensif untuk onboarding, tetapan pembayaran, kawalan kredit, operasi fail dan penggabungan entiti"
tags:
- supplier-management
- procurement
- accounts-payable
- master-data
- file-import
- file-export
- entity-merging
- credit-control
weight: 70
---

## Tujuan dan Gambaran Keseluruhan

**Supplier Applet** ialah ruang kerja berpusat untuk data induk pembekal merentas fungsi perolehan dan kewangan. Ia menyokong onboarding pembekal, penyelenggaraan profil, tetapan pembayaran dan cukai, kawalan kredit, aliran kerja muat naik/muat turun pukal, serta pembersihan rekod pendua.

{{< callout type="info" >}}
**Konsep Teras**: applet ini menghubungkan **siapa yang anda beli daripada** (Supplier Profile), **bagaimana transaksi dijalankan** (Payment/Tax/Credit setup), dan **bagaimana data dikawal** (Settings, permissions, dan merge tools).
{{< /callout >}}

## Gambaran Keseluruhan Ciri Utama

### Siapa yang Mendapat Manfaat daripada Applet Ini?

**Pasukan Perolehan:**
- Cipta dan kekalkan rekod pembekal dengan cepat
- Gunakan kategori dan branch linking untuk ketepatan operasi
- Kurangkan kelewatan sourcing akibat setup pembekal yang tidak lengkap

**Kewangan & Accounts Payable:**
- Kekalkan konfigurasi pembayaran dan data cukai di satu tempat
- Kawal credit term dan credit limit secara konsisten
- Gunakan file export dan paparan konsolidasi untuk rekonsiliasi

**Pentadbir Data / Pasukan Data Induk:**
- Jalankan aliran kerja import pukal untuk data pembekal dan kredit
- Bersihkan entiti pendua menggunakan merge tools
- Pantau hasil pemprosesan dan mesej ralat

**Pentadbir Sistem:**
- Konfigurasi kebolehlihatan medan dan tingkah laku tab
- Tetapkan nilai lalai applet dan peraturan pengelompokan cawangan
- Urus kebolehlihatan ciri dan skrin kebenaran

### Apakah Masalah yang Diselesaikan?

**Isu Data Pembekal yang Lazim:**
- Rekod pembekal pendua merentas pasukan
- Maklumat pembayaran dan cukai yang tidak konsisten
- Kitaran onboarding dan kemas kini yang manual serta perlahan
- Kekurangan keterlihatan terhadap status import/export dan merge

**Hasil Supplier Applet:**
- **Satu sumber data induk pembekal** untuk operasi dan kewangan
- **Tab create/edit berstruktur** bagi profil pembekal yang lengkap
- **Aliran kerja data pukal** untuk penyelenggaraan berskala
- **Aliran kerja entity merging** untuk nyah-duplikasi pembekal secara selamat
- **Governance yang boleh dikonfigurasi** melalui settings dan permissions

## Gambaran Keseluruhan Ciri Utama

{{< cards >}}
  {{< card title="Supplier Listing" subtitle="Cari, tapis, cipta, dan edit rekod pembekal" link="#supplier-listing" >}}
  {{< card title="Supplier Edit Tabs" subtitle="Urus login, payment, tax, address, contact, dan lain-lain" link="#supplier-createedit-form" >}}
  {{< card title="Credit Controls" subtitle="Senarai credit term/limit dan menu muat naik pukal" link="#credit-controls" >}}
  {{< card title="File Import & Export" subtitle="Penyelenggaraan pukal berasaskan CSV dan penjanaan eksport" link="#file-import--export" >}}
  {{< card title="Consolidated ARAP" subtitle="Senarai AR/AP terkonsolidasi untuk tenant yang diaktifkan" link="#consolidated-arap" >}}
  {{< card title="Entity Merging" subtitle="Jejak merge pendua berasaskan kriteria" link="#entity-merging" >}}
  {{< card title="Configuration" subtitle="Field settings, default selection, dan branch grouping" link="#configuration--settings" >}}
{{< /cards >}}

{{< figure src="/images/supplier-applet/supplier-applet-overview.png" alt="Gambaran keseluruhan applet pembekal yang menunjukkan penyelenggaraan pembekal, operasi data pukal, dan tetapan" caption="Supplier Applet Overview: Urus rekod pembekal, setup, dan tadbir urus data dalam satu applet." >}}

## Konsep Utama

### Memahami Rangka Kerja Pembekal

| Aspek | Komponen | Contoh Praktikal |
|--------|-----------|------------------|
| **Siapa** yang anda beli daripada | Supplier Profile | Kod pembekal, nama, jenis, status |
| **Bagaimana** transaksi dijalankan | Payment/Tax/Credit setup | Payment config, butiran cukai, credit term dan limit |
| **Bagaimana** data dikawal | Settings + Merge tools | Kebolehlihatan medan, nilai lalai, entity merging |

### Hierarki Data Pembekal

```
Supplier Applet
|
|-- Supplier Listing
|   |-- Supplier Create/Edit Tabs
|   |   |-- Main
|   |   |-- E-Invoice / Peppol Config
|   |   |-- Login / Driver Login
|   |   |-- Payment Config / Tax
|   |   |-- Address / Contact
|   |   |-- Credit Term and Limit
|   |   |-- Branch / Company / Item Pricing
|   |   `-- Documents
|
|-- Supporting Menus
|   |-- Category
|   |-- Credit Term Listing
|   |-- Credit Limit Listing
|   |-- File Import / File Export
|   |-- Upload Credit Terms / Upload Credit Limits
|   |-- Consolidated ARAP
|   `-- Entity Merging / Entity Merge Processing
|
`-- Settings & Personalization
```

### Segitiga Kawalan Pembekal

| Komponen | Peranan | Contoh |
|-----------|------|---------|
| **Profile** | Identiti dan status pembekal | Supplier Code, Supplier Name, Type |
| **Transaction Setup** | Konfigurasi pembayaran dan cukai | Akaun bank, tax type, tax code |
| **Control Layer** | Polisi dan operasi pembersihan | Peraturan kredit, field settings, merge criteria |

---

## Panduan Mula Pantas

### Untuk Perolehan: Cipta Pembekal Pertama Anda

**Matlamat:** Cipta profil pembekal yang boleh terus digunakan.

1. Buka **Supplier Listing**.
2. Klik **+** untuk cipta pembekal.
3. Lengkapkan butiran **Main** (code/name/type/status).
4. Tambah rekod **Address** dan **Contact**.
5. Tambah **Category** serta pautan operasi yang diperlukan.
6. Semak keperluan **Payment Config** dan **Tax** bersama pasukan kewangan.
7. Tetapkan status kepada **Active** selepas semua data wajib lengkap.
8. Simpan dan sahkan pembekal muncul dalam listing.

{{< figure src="/images/supplier-applet/supplier-listing.png" alt="Grid senarai pembekal dengan tindakan cipta dan baris carian" caption="Supplier Listing: Mulakan penciptaan pembekal dan buka rekod sedia ada untuk penyelenggaraan." >}}

### Untuk Kewangan: Konfigurasi Payment dan Tax

**Matlamat:** Pastikan rekod pembekal sedia untuk pembayaran.

1. Buka rekod pembekal dari listing.
2. Pergi ke tab **Payment Config** dan tambah satu baris pembayaran.
3. Isi `Payee Residential Status`, `Country`, `Bank`, medan akaun, dan tarikh tamat (jika perlu).
4. Sahkan `Swift Code` dijana automatik selepas bank dipilih.
5. Pergi ke tab **Tax** dan tetapkan maklumat cukai pembekal.
6. Sahkan setup kredit di **Credit Term and Limit**.
7. Simpan dan semak semula kemas kini.

{{< figure src="/images/supplier-applet/payment-config-create.png" alt="Borang cipta Payment Config dengan status penerima, bank, akaun dan negara" caption="Payment Config: Kekalkan butiran kaedah pembayaran pembekal untuk aliran kerja kewangan." >}}

### Untuk Pentadbir Data: Jalankan Operasi Pukal

**Matlamat:** Selenggara data pembekal secara berskala.

1. Gunakan **File Import** untuk muat naik fail CSV pembekal.
2. Pilih delimiter yang betul (`PIPE`, `COMMA`, `SEMICOLON`, `TAB`) sebelum muat naik.
3. Gunakan **Sample Format** untuk sahkan struktur fail sebelum hantar.
4. Gunakan **Upload Credit Terms** dan **Upload Credit Limits** untuk kemas kini kredit secara pukal.
5. Semak status listing dan mesej ralat.
6. Gunakan **File Export** untuk jana output CSV pembekal.

{{< figure src="/images/supplier-applet/menu-file-import.png" alt="Halaman import fail dengan pemilih delimiter dan kawasan muat naik CSV" caption="File Import: Muat naik data induk pembekal CSV dan hantar untuk diproses." >}}

### Untuk Admin: Konfigurasi Applet

**Matlamat:** Terapkan governance dan tingkah laku lalai.

1. Buka **Settings > Application Settings**.
2. Konfigurasi peraturan kebolehlihatan menu dan tab.
3. Tetapkan nilai lalai di **Settings > Default Selection**.
4. Konfigurasi **Entity Branch Group** jika diperlukan.
5. Semak role dan user permissions di bawah laluan settings.
6. Jalankan ujian hujung-ke-hujung (cipta pembekal, tambah payment config, sahkan kebolehlihatan listing).

{{< figure src="/images/supplier-applet/supplier-settings.png" alt="Halaman tetapan pembekal untuk konfigurasi medan dan pilihan lalai" caption="Settings: Kawal tingkah laku applet, kebolehlihatan tab, dan nilai setup lalai." >}}

---

## Rujukan Menu Sidebar

### Menu Utama

| Menu | Fungsi | Kegunaan Lazim |
|------|--------------|-------------|
| **Supplier** | Direktori utama pembekal dan pintu masuk edit | Cipta dan selenggara data induk pembekal |
| **Category** | Data induk kategori pembekal | Kelompok pembekal untuk tapisan/laporan |
| **Credit Term Listing** | Rekod induk credit term | Selenggara peraturan tempoh bayaran |
| **Credit Limit Listing** | Rekod induk credit limit | Selenggara peraturan had kredit |
| **File Import** | Muat naik CSV pembekal | Cipta/kemas kini pembekal secara pukal |
| **Upload Credit Terms** | Muat naik fail credit terms | Tugaskan/kemas kini credit term pembekal secara pukal |
| **Upload Credit Limits** | Muat naik fail credit limits | Tugaskan/kemas kini credit limit pembekal secara pukal |
| **File Export** | Listing kerja eksport pembekal | Jana dan muat turun snapshot CSV |
| **Consolidated ARAP** | Listing akaun konsolidasi | Semak rekod AR/AP terkonsolidasi |
| **Entity Merging** | Pengelompokan pendua dan tindakan merge | Nyah-duplikasi entiti pembekal |
| **Entity Merge Processing** | Listing keputusan queue merge | Semak kemajuan dan hasil merge |
| **Settings** | Tetapan applet, feature visibility, permissions | |
| **Personalization** | Default selection peribadi dan tetapan sidebar |  |

## Supplier Listing

Supplier listing merangkumi lajur utama seperti:
- Supplier Code
- Supplier Name
- Supplier Type
- Created/Modified By and Date
- Status

Gunakan penapis/carían listing untuk mencari dan membuka rekod pembekal dengan cepat.

{{< figure src="/images/supplier-applet/supplier-listing.png" alt="Grid senarai pembekal dengan tindakan cipta dan baris carian" caption="Supplier Listing: Mulakan penciptaan pembekal dan buka rekod sedia ada untuk penyelenggaraan." >}}

{{< figure src="/images/supplier-applet/supplier-search.png" alt="Carian lanjutan pembekal" caption="Supplier Advance Search: Gunakan Advance Search untuk mencari pembekal tertentu." >}}

## Supplier Create/Edit Form

Skrin edit pembekal berasaskan tab dan menyokong konfigurasi susunan/kebolehlihatan tab.

### Rujukan Tab

| Tab | Fungsi Utama |
|-----|---------------|
| **Main** | Butiran teras profil pembekal |
| **E-Invoice** | Identiti e-invoice dan medan konfigurasi berkaitan |
| **Peppol Config** | Pengurusan pautan peserta Peppol + pilihan notifikasi |
| **Category** | Pautan kategori kepada pembekal |
| **Login** | Pautan subjek login pembekal |
| **Applet Catalog** | Pautkan pembekal kepada entri applet catalog |
| **Driver Login** | Rekod pautan login pemandu |
| **Payment Config** | Kaedah pembayaran pembekal |
| **Tax** | Butiran cukai pembekal |
| **Address** | Penyelenggaraan alamat (utama/bil/penghantaran dan jenis) |
| **Contact** | Penyelenggaraan contact person |
| **Credit Term and Limit** | Setup credit term dan credit limit |
| **Branch Linking** | Rekod pautan branch |
| **Supplier Branch** | Rekod intercompany supplier branch |
| **Company Linking** | Pautan supplier-company dan kawalan berkaitan |
| **Item Pricing** | Rekod harga item pembekal |
| **Remark** | Catatan teks bebas |
| **Employee** | Konteks pautan pekerja |
| **Documents** | Sejarah dokumen pembelian dan pembayaran berkaitan |

{{< figure src="/images/supplier-applet/supplier-create-form.png" alt="Borang cipta dan edit pembekal dengan pelbagai tab operasi" caption="Supplier Create/Edit: Selenggara data pembekal merentas tab profil, kewangan, dan pautan." >}}

### Medan Payment Config

Berdasarkan komponen create/edit payment config, medan utama ialah:

| Medan | Fungsi |
|-------|----------|
| **Payee Residential Status** | Klasifikasi resident / non-resident |
| **Country** | Konteks negara untuk pembayaran |
| **Bank** | Pemilihan bank |
| **Swift Code** | Dijana automatik berdasarkan bank dipilih |
| **Bank Acc No.** | Nombor akaun bank |
| **Bank Acc Holder Name** | Nama pemegang akaun |
| **IBN Number** | Pengenal akaun tambahan |
| **Account Expiry** | Tarikh tamat akaun (opsyenal) |

## Credit Controls

### Credit Term Listing

Gunakan **Credit Term Listing** untuk mentakrif dan menyelenggara peraturan standard credit term yang digunakan oleh pembekal.

Apa yang anda boleh lakukan dalam menu ini:
- Lihat semua credit term dalam satu grid (Credit Term Code, Credit Term Name, Status, Modification Date)
- Cari dan tapis term untuk temukan peraturan yang tepat
- Cipta rekod credit term baharu
- Buka dan edit credit term sedia ada
- Aktifkan atau nyahaktifkan term melalui kawalan status

Apa yang boleh dikonfigurasi dalam create/edit:
- **Credit Term Code** dan **Credit Term Name**
- **Status**
- **Set Year / Set Month / Set Day**
- **Add Year / Add Month / Add Day**
- Maklumat audit dalam mod edit (**Created By**, **Creation Date**, **Modified By**, **Modified Date**)

Nilai kepada pelanggan:
- Menyeragamkan logik tempoh bayaran supaya perolehan dan kewangan menggunakan peraturan tarikh matang yang sama.

{{< figure src="/images/supplier-applet/menu-credit-term-listing.png" alt="Senarai credit term" caption="Supplier Credit Term Listing: untuk melihat senarai credit term." >}}

### Credit Limit Listing

Gunakan **Credit Limit Listing** untuk mentakrif dan menyelenggara peraturan had bagi kawalan kredit pembekal.

Apa yang anda boleh lakukan dalam menu ini:
- Lihat semua credit limit dalam satu grid (Credit Limit Code, Credit Limit Name, Status, Modification Date)
- Cari dan tapis rekod had
- Cipta rekod credit limit baharu
- Buka dan edit had sedia ada
- Aktifkan atau nyahaktifkan had melalui kawalan status

Apa yang boleh dikonfigurasi dalam create/edit:
- **Credit Limit Code** dan **Credit Limit Name**
- **Status**
- **Currency**
- **Credit Limit Amount**
- Maklumat audit dalam mod edit (**Created By**, **Creation Date**, **Modified By**, **Modified Date**)

Nilai kepada pelanggan:
- Memastikan pasukan anda menguatkuasakan sempadan kewangan yang konsisten sebelum transaksi pembekal diteruskan.

{{< figure src="/images/supplier-applet/menu-credit-limit-listing.png" alt="Senarai credit limit" caption="Supplier Credit Limit Listing: untuk melihat senarai Credit Limit." >}}

### Upload Menus

- **Upload Credit Terms**: import pukal tugasan credit term pembekal.
- **Upload Credit Limits**: import pukal tugasan credit limit pembekal.

Kedua-dua listing import memaparkan medan seperti nama fail, format, status proses, dan mesej ralat.

## File Import & Export

### File Import

File import pembekal menyokong:
- Pemilihan delimiter: `PIPE`, `COMMA`, `SEMICOLON`, `TAB`
- Muat naik CSV melalui drag-drop atau file picker
- Muat turun Sample Format
- Pemantauan proses daripada listing import (`Process Status`, `Error Message`)

{{< figure src="/images/supplier-applet/menu-file-import.png" alt="Listing file import" caption="File Import: Lihat listing import dalam Supplier Applet." >}}

{{< figure src="/images/supplier-applet/menu-file-import-1.png" alt="Menu file import" caption="File Import Create: Konfigurasi untuk mengimport fail" >}}

{{< figure src="/images/supplier-applet/menu-file-import-error.png" alt="Ralat file import" caption="File Import Checking: Semakan ralat semasa mengimport fail CSV." >}}

### File Export

File export pembekal menyokong:
- Penapis tarikh (`created_date_from`, `created_date_to`)
- Penjanaan CSV (`Generate CSV`)
- Listing eksport dengan penjejakan status serta tindakan muat turun/padam

{{< figure src="/images/supplier-applet/menu-file-export.png" alt="Listing file export dengan butang jana, lajur status, dan tindakan muat turun" caption="File Export: Jana fail CSV pembekal dan jejak status pemprosesan." >}}

## Consolidated ARAP

Gunakan **Consolidated ARAP** untuk menyelenggara rekod akaun terkonsolidasi dan pautan berkaitan yang digunakan dalam aliran kerja AR/AP.

Fungsi listing utama:
- Lihat rekod akaun terkonsolidasi dengan:
  - **Account Code**
  - **Account Name**
  - **Nick Name**
  - **Description**
  - **Status**
  - **Created Date / Updated Date**
- Cari mengikut kata kunci dan gunakan advanced filters
- Buka rekod untuk edit
- Cipta rekod Consolidated ARAP baharu

Fungsi Create/Edit (Main tab):
- Selenggara **Acc Code**, **Acc Name**, **Acc Nickname**, **Description**, dan **Status**
- Simpan kemas kini setup akaun
- Buang rekod jika diperlukan (mod edit)
- Semak medan audit (created/modified by and date)

Tab tambahan dalam mod edit:
- **Entity**: pautkan entiti pembekal kepada akaun Consolidated ARAP yang dipilih
- **Login**: urus login subject links (User Email, Rank, Status, Modified Date)
- **Applet Catalog**: urus applet catalog links (Catalogue Code/Name/Type, Description, No. of Applets)

Nilai kepada pelanggan:
- Memberi pasukan kewangan satu tempat berstruktur untuk mengurus setup akaun konsolidasi dan pautan entitinya.

{{< figure src="/images/supplier-applet/menu-consolidated-arap.png" alt="Listing Consolidated ARAP dengan lajur peringkat akaun dan penapis" caption="Consolidated ARAP: Rekod AR/AP terkonsolidasi untuk tenant yang diaktifkan." >}}

## Entity Merging

Entity merging berasaskan kriteria dan menyokong pembersihan pendua melalui:
- Entity Name
- Entity ID No
- Entity Phone
- Entity Email

Tingkah laku penting daripada logik komponen:
- Grid merge bermula kosong.
- Rekod hanya dimuatkan selepas memilih **Merge Criteria**.

Selepas merge dilaksanakan, gunakan **Entity Merge Processing** untuk memantau status merge dan kemajuan merged/total.

{{< figure src="/images/supplier-applet/menu-entity-merging.png" alt="Skrin entity merging dengan pemilih kriteria merge dan entiti pendua berkelompok" caption="Entity Merging: Pilih kriteria, semak rekod berkelompok, dan jalankan merge pendua." >}}

{{< figure src="/images/supplier-applet/menu-entity-merge-processing.png" alt="Listing entity merge processing dengan lajur status dan kemajuan merge" caption="Entity Merge Processing: Jejak hasil merge dan kemajuan penyelesaian." >}}

---

## Configuration & Settings

Laluan settings merangkumi:
- **Default Selection** (`settings/default-selection`)
- **Field Settings** (`settings/field-settings`)
- **Feature Visibility** (`settings/feature-visibility`)
- **Permission screens** (`permission-set`, `user-permission`, `team-permission`, `role-permission`, `permission-wizard`)
- **Entity Branch Group** (`settings/entity-branch-group`)
- **Webhook** (`settings/webhook`)

### Sorotan Application Settings

Field settings merangkumi toggle untuk:
- Kebolehlihatan menu (Category, Credit Term/Limit listings, File Import/Export, Consolidated ARAP, Entity Merging)
- Medan borang utama pembekal (email, phone, supplier code, status, currency, tax id, dll.)
- Tab butiran pembekal (Payment Config, Tax, Address, Contact, Credit Term and Limit, Peppol, E-Invoice, Documents, dll.)

### Personalization

Laluan personalization merangkumi:
- `personalization/personal-default-selection`
- `personalization/sidebar`

{{< figure src="/images/supplier-applet/personal.png" alt="Tetapan personalization" caption="Personalization: Tetapan tersuai bagi setiap pengguna (tersedia untuk memilih default branch dan default location)." >}}


---

## Integration Points

| Module | Tujuan Integrasi |
|--------|---------------------|
| **Purchasing** | Rujukan pembekal dalam dokumen pembelian dan transaksi berkaitan pembekal |
| **Accounts Payable** | Pemprosesan bayaran dan penggunaan data pembekal di sisi payable |
| **E-Invoice / Peppol** | Data identiti e-invoice dan konfigurasi peserta Peppol |
| **Master Data Services** | Import/export pembekal secara pukal dan penyelenggaraan rentas entiti |
| **Reporting** | Penapisan dan konsolidasi pembekal menggunakan output listing/export |

---

## Troubleshooting

### Entity Merging Menunjukkan Tiada Data

**Masalah:** Grid Entity Merging kosong.  
**Punca Berkemungkinan:** Merge criteria belum dipilih.  
**Cara Atasi:** Pilih **Merge Criteria** terlebih dahulu (Entity Name, ID No, Phone, atau Email), kemudian semak kumpulan yang dimuatkan.

### Swift Code dalam Payment Config Kosong

**Masalah:** `Swift Code` tidak dipaparkan.  
**Punca Berkemungkinan:** Bank belum dipilih atau pilihan bank berubah.  
**Cara Atasi:** Pilih `Country`, kemudian pilih `Bank`; borang akan auto-fill `Swift Code`.

### Status Proses File Import Gagal

**Masalah:** Import selesai tetapi status menunjukkan ralat.  
**Punca Berkemungkinan:** Delimiter/template tidak sepadan atau nilai baris tidak sah.  
**Cara Atasi:** Muat turun **Sample Format**, sahkan pilihan delimiter, kemudian muat naik semula dan semak `Error Message`.

### Tab atau Menu Tidak Kelihatan

**Masalah:** Pengguna tidak dapat melihat tab/menu yang dijangka.  
**Punca Berkemungkinan:** Disembunyikan melalui field settings atau role/menu permissions.  
**Cara Atasi:** Semak **Settings > Field Settings** dan kebolehlihatan permission untuk role berkenaan.

---

## Related Applets

### Core Module Applets
- **[Customer Maintenance Applet](/applets/customer-maintenance-applet/)** - Data induk pelanggan
- **[Inventory Item Maintenance Applet](/applets/inv-item-maintenance-applet/)** - Hubungan produk pembekal
- **[Tax Configuration Applet](/applets/tax-configuration-applet/)** - Tetapan cukai pembekal

### Procurement Applets
- **[Purchase Order Applet](/applets/purchase-order-applet/)** - Pemprosesan pesanan pembekal
- **[Purchase Requisition Applet](/applets/purchase-requisition-applet/)** - Permintaan perolehan
- **[Supplier Portal Applet](/applets/supplier-portal-applet/)** - Layan diri pembekal

### Financial Applets
- **[Accounts Payable Applet](/applets/accounts-payable-applet/)** - Pembayaran pembekal
- **[Payment Processing Applet](/applets/payment-processing-applet/)** - Pemprosesan bayaran vendor
- **[Expense Management Applet](/applets/expense-management-applet/)** - Perbelanjaan pembekal

---

## Best Practices

- Tetapkan standard penamaan dan kod sebelum import pembekal berskala besar.
- Gunakan **Category**, **Credit Term Listing**, dan **Credit Limit Listing** sebagai data induk terkawal; elakkan nilai ad-hoc.
- Uji file import dengan sampel kecil sebelum muat naik pukal.
- Jadualkan pembersihan pendua menggunakan **Entity Merging** sebagai aktiviti governance data berkala.
- Kekalkan kebolehlihatan tab yang minimum dalam **Field Settings** supaya pengguna hanya melihat medan yang relevan.
- Sahkan medan pembayaran utama sebelum pembekal digunakan dalam operasi aktif.

---

## FAQ

**S: Kenapa listing Entity Merging kosong?**  
J: Listing memang direka kosong pada awalnya sehingga **Merge Criteria** dipilih.

**S: Medan pembayaran apa yang tersedia dalam Payment Config?**  
J: Payee Residential Status, Country, Bank, Swift Code, Bank Acc No., Bank Acc Holder Name, IBN Number, dan Account Expiry.

**S: Format fail apa yang disokong untuk import pembekal?**  
J: CSV disokong, dengan delimiter boleh dikonfigurasi (`PIPE`, `COMMA`, `SEMICOLON`, `TAB`).

**S: Di mana saya boleh muat naik credit term dan credit limit secara pukal?**  
J: Gunakan menu **Upload Credit Terms** dan **Upload Credit Limits**.

**S: Di mana saya boleh jejak status penjanaan eksport?**  
J: Di listing **File Export**, yang memaparkan status/ralat serta tindakan muat turun.

**S: Kenapa sesetengah tab tidak kelihatan dalam Supplier Edit?**  
J: Kebolehlihatan tab dikawal dalam **Settings > Field Settings** dan konfigurasi permission/kebolehlihatan tenant.

**S: Di mana saya boleh lihat sejarah dokumen berkaitan pembekal?**  
J: Di tab **Documents** dalam Supplier Edit.

**S: Kenapa fail import saya kekal dalam status gagal?**  
J: Semak `Error Message`, pastikan delimiter CSV sepadan dengan pilihan anda, dan sahkan fail mengikut **Sample Format**.

**S: Kenapa saya belum boleh muat turun fail eksport?**  
J: Eksport mesti siap dijana dahulu. Tunggu sehingga `Status` selesai, kemudian gunakan tindakan muat turun.

---
