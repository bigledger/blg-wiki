---
title: "Applet Pekerja"
description: "Pengurusan data induk pekerja berpusat dengan org chart, kawalan akses, payroll dan konfigurasi claim"
tags:
- employee-master
- hr-management
- org-chart
- payroll-setup
- access-control
weight: 61
---

## Tujuan dan Gambaran Keseluruhan

**Employee Applet** ialah hab utama untuk mengurus data induk pekerja dalam Akaun Platform. Ia menggabungkan profil pekerja, garis pelaporan, akses login, konfigurasi payroll dan cukai, tetapan claim, serta rekod pematuhan dalam satu sistem berstruktur.

{{< callout type="info" >}}
**Konsep Teras**: Satu rekod pekerja harus menghubungkan **siapa** pekerja itu, **di mana** kedudukannya dalam organisasi, **apa** akses yang dimiliki, dan **bagaimana** pembayaran serta bayaran balik dibuat.
{{< /callout >}}

### Tentang Applet

**Tujuan:** Mengekalkan data induk pekerja yang tepat dan tetapan operasi merentas aliran kerja HR, kewangan, dan kawalan akses.

**Pengguna Sasaran:** HR dan People Ops, Finance dan Payroll, Pengurus Jabatan, IT dan Admin Sistem.

**Ciri Utama:**
- Penciptaan dan penyelenggaraan profil pekerja
- Pengurusan kategori pekerja dan pelabelan
- Org chart dan struktur report-to
- Akses login dan kawalan permission
- Konfigurasi payroll, cukai, dan pembayaran
- Keterlihatan akaun claim dan entitlements
- Import fail secara pukal dan audit trail

## Gambaran Keseluruhan Ciri Utama

### Siapa yang mendapat manfaat daripada Applet ini?

**HR dan People Ops:**
- Onboarding berstruktur dan penyelenggaraan profil
- Paparan berpusat untuk data hubungan dan alamat pekerja
- Kemas kini pantas cawangan, jabatan, dan peranan

**Finance dan Payroll:**
- Konfigurasi pembayaran dan cukai yang konsisten
- Had perbelanjaan dan pautan entitlements claim
- Data bersih untuk pemprosesan payroll dan bayaran balik

**Pengurus Jabatan:**
- Struktur report-to yang jelas dan keterlihatan pasukan
- Jejak dan kemas kini leave yang diluluskan
- Penjajaran org chart yang tepat

**IT dan Admin Sistem:**
- Kawalan login dan permission
- Keterlihatan ciri dan pengurusan akses
- Audit trail Applet untuk pematuhan

### Apakah masalah yang diselesaikan?

**Masalah Data Pekerja yang Berpecah:**

Pengurusan pekerja secara tradisional tersebar dalam spreadsheet, rangkaian emel, dan sistem HR atau payroll yang berasingan. Isu biasa termasuk:
- Rekod pekerja berganda atau tidak konsisten
- Garis pelaporan hilang dan kelulusan tidak jelas
- Konfigurasi payroll dan cukai tidak tepat
- Onboarding tertangguh akibat tetapan manual
- Kekurangan kebolehkesanan audit

**Penyelesaian Employee Applet:**

- **Single source of truth** untuk data pekerja
- **Org chart berstruktur** dan hubungan report-to
- **Tetapan akses bersepadu** untuk login dan permission
- **Konfigurasi siap-payroll** untuk tetapan cukai dan pembayaran
- **Alat import pukal** untuk onboarding lebih pantas
- **Audit trail** untuk pematuhan dan akauntabiliti

## Gambaran Keseluruhan Ciri Utama

{{< cards >}}
  {{< card title="Employee Master Data" subtitle="Cipta, edit dan urus profil pekerja" link="#employee-master-data" >}}

  {{< card title="Org Chart & Reporting" subtitle="Tetapkan hubungan report-to dan struktur organisasi" link="#org-chart-and-reporting" >}}

  {{< card title="Login & Access" subtitle="Kawal login pekerja, permission dan peranan" link="#login-and-access" >}}

  {{< card title="Payroll & Tax" subtitle="Konfigurasi butiran pembayaran dan cukai" link="#payroll-and-tax-configuration" >}}

  {{< card title="Claims & Entitlements" subtitle="Urus akaun claim, had dan laporan" link="#claims-and-entitlements" >}}

  {{< card title="File Import" subtitle="Muat naik dan kemas kini rekod pekerja secara pukal" link="#file-import" >}}

  {{< card title="Audit & Compliance" subtitle="Log Applet dan kebolehkesanan" link="#audit-and-compliance" >}}

  {{< card title="Configuration & Settings" subtitle="Defaults, tetapan medan dan keterlihatan" link="#configuration--settings" >}}
{{< /cards >}}

{{< figure src="/images/employee-applet/employee-applet-overview.png" alt="gambaran keseluruhan ciri utama" caption="Gambaran Keseluruhan Ciri Utama Employee Applet" >}}

## Konsep Utama

### Struktur Employee Master

| Aspek | Komponen | Contoh Praktikal |
|--------|-----------|------------------|
| **Siapa** pekerja? | Profil dan identiti | Nama, ID, jawatan |
| **Di mana** kedudukan mereka? | Cawangan, jabatan, report-to | Cawangan KL, Finance, Pengurus X |
| **Apa** akses diperlukan? | Login dan permission | Approver, HR admin, staff |
| **Bagaimana** pembayaran dibuat? | Konfigurasi pembayaran dan cukai | Butiran bank, profil cukai |
| **Apa** yang boleh dituntut? | Akaun claim dan entitlements | Dana perubatan, had perjalanan |

{{< callout type="tip" >}}
**Contoh Dunia Sebenar**: Seorang eksekutif kewangan baharu menyertai syarikat. HR mencipta profil pekerja, menetapkan jabatan dan pengurus, IT menetapkan permission login, dan Finance mengkonfigurasi butiran cukai dan pembayaran. Pekerja tersebut sedia untuk payroll dan claim dalam satu aliran.
{{< /callout >}}

---

## Panduan Mula Pantas

{{< figure src="/images/employee-applet/employee-applet-quick-start.png" alt="Mula pantas untuk Employee applet" caption="Infografik mula pantas untuk Employee Applet" >}}

Mulakan dengan cepat mengikut peranan anda.

### Untuk HR/Admins: Cipta Pekerja Baharu

**Matlamat:** Tambahkan pekerja baharu dengan butiran profil lengkap.

1. **Navigasi**: Pergi ke **Employee Listing**
{{< figure src="/images/employee-applet/employee-listing.png" alt="Senarai Employee" caption="Imej Employee Listing di mana pengguna boleh melihat semua pekerja yang dicipta" >}}
2. **Cipta**: Klik **+** dan isi butiran asas
{{< figure src="/images/employee-applet/employee-create.png" alt="Butang cipta pekerja" caption="Butang Create untuk mencipta senarai pekerja baharu." >}}
3. **Tambah Kontak**: Kemas kini Employee Name, Employee Code, Employee Nickname, status, dan medan lain
{{< figure src="/images/employee-applet/employee-add-details.png" alt="tambah butiran pekerja" caption="Tambah medan pekerja dalam bahagian Create Employee." >}}
4. **Tetapkan Struktur**: Tetapkan cawangan, jabatan, dan report-to
{{< figure src="/images/employee-applet/employee-create-branch.png" alt="tetapkan cawangan pekerja" caption="Tetapkan cawangan pekerja dalam konfigurasi." >}}
5. **Simpan**: Sahkan dan simpan rekod pekerja
{{< figure src="/images/employee-applet/employee-save.png" alt="butang simpan" caption="Klik CREATE untuk menyimpan butiran pekerja." >}}

---

### Untuk Pengurus: Kekalkan Garis Pelaporan dan Leave

**Matlamat:** Pastikan struktur pasukan dan leave yang diluluskan adalah tepat.

1. **Buka Profil Pekerja** dari senarai
{{< figure src="/images/employee-applet/employee-view.png" alt="lihat butiran pekerja" caption="Klik pada senarai pekerja untuk melihat butiran." >}}
2. **Kemas kini Report-To** untuk mencerminkan perubahan pasukan
{{< figure src="/images/employee-applet/employee-report.png" alt="Tab Report To dalam applet" caption="Tab Report To dalam applet. Pengguna boleh tambah dan edit butiran dalam tab ini." >}}
3. **Semak Approved Leave** untuk keterlihatan
{{< figure src="/images/employee-applet/employee-leave.png" alt="Tab Report To dalam applet" caption="Untuk mencipta senarai Approved Leave baharu" >}}

{{< figure src="/images/employee-applet/employee-create-leave.png" alt="cipta leave untuk pekerja" caption="Tetapkan tarikh untuk approved leave dan klik butang Add untuk simpan" >}}

{{< figure src="/images/employee-applet/employee-success.png" alt="Pop out berjaya" caption="Approved leave berjaya disimpan" >}}
4. **Semak Org Chart** untuk memastikan hierarki dikemas kini
{{< figure src="/images/employee-applet/employee-org-chart.png" alt="org-chart" caption="Semak org chart dan struktur" >}}

{{< figure src="/images/employee-applet/employee-org-chart-struc.png" alt="struktur org-chart" caption="Struktur organisasi" >}}
5. **Simpan Perubahan** untuk mengemas kini paparan org chart

---

### Untuk Finance/Payroll: Konfigurasi Pembayaran dan Cukai

**Matlamat:** Pastikan tetapan pekerja sedia untuk payroll.

1. **Buka Profil Pekerja**
2. **Pergi ke Payment Config** dan tambah butiran bank
{{< figure src="/images/employee-applet/employee-payment.png" alt="Tab Payment Config" caption="Konfigurasi butiran pembayaran pekerja" >}}
3. **Tetapkan Tax Profile** dan medan statutori
{{< figure src="/images/employee-applet/employee-tax.png" alt="Tab Tax" caption="Konfigurasi butiran cukai pekerja" >}}
4. **Konfigurasi Spending Limits** jika diperlukan
{{< figure src="/images/employee-applet/employee-speending.png" alt="Tab Spending limit" caption="Konfigurasi butiran had perbelanjaan pekerja" >}}
5. **Semak Perubahan** untuk mengesahkan medan payroll
6. **Simpan** untuk mengaktifkan data payroll
{{< figure src="/images/employee-applet/employee-saved.png" alt="Butang simpan" caption="Simpan semua butiran pekerja yang diedit/ditambah" >}}

---

### Untuk IT/Admins: Tetapkan Permission dan Keterlihatan

**Matlamat:** Kawal akses pengguna dan ketersediaan ciri.

1. **Pergi ke Settings**
2. **Konfigurasi Permission Sets** untuk peranan dan pasukan
{{< figure src="/images/employee-applet/employee-set-perm.png" alt="tetapan permission" caption="Tetapkan permission dan peranan untuk setiap pekerja" >}}
3. **Laraskan Feature Visibility** untuk menu dan tab
{{< figure src="/images/employee-applet/employee-app-setting.png" alt="konfigurasi aplikasi" caption="Pilih sama ada mahu sembunyi atau paparkan setiap tab dalam applet" >}}

{{< figure src="/images/employee-applet/employee-hide-unhide.png" alt="konfigurasi aplikasi" caption="Nyahaktif dan aktifkan setiap tab dalam applet" >}}
4. **Assign User Permissions** kepada login pekerja
5. **Simpan** untuk terapkan perubahan akses

---

## Employee Master Data

Senarai pekerja ialah hab utama untuk mencipta dan mengurus rekod pekerja. Ia merangkumi:
- Butiran profil, kategori, dan jenis pekerjaan
- Pengurusan kontak dan alamat
- Penetapan cawangan dan syarikat
- Akses syarikat engagement dan butiran e-invoice
- Pautan Peppol ID dan konfigurasi notifikasi

{{< figure src="/images/employee-applet/employee-listing.png" alt="Halaman Employee Listing" caption="Employee Listing: Urus data induk pekerja dengan carian dan penapis" >}}

{{< figure src="/images/employee-applet/employee-create.png" alt="Borang Create Employee" caption="Employee Create: Kemas kini profil, kontak dan butiran pekerjaan dalam satu borang" >}}

{{< figure src="/images/employee-applet/employee-edit.png" alt="Borang Edit Employee" caption="Employee Edit: Kemas kini profil, kontak dan butiran pekerjaan dalam satu borang" >}}

### Status/State yang Lazim

| Status | Maksud | Kegunaan Lazim |
|--------|---------|-------------|
| **ACTIVE** | Pekerja aktif dalam sistem | Rekod pekerja standard |
| **INACTIVE** | Pekerja tidak lagi aktif | Offboarding atau cuti panjang |
| **DRAFT** | Persediaan profil belum selesai | Semasa onboarding |

## Employee Categories

Gunakan senarai kategori untuk mengklasifikasikan pekerja bagi pelaporan, penapisan dan kawalan polisi:
- Cipta, edit dan tetapkan kategori pekerja
- Pengelompokan berasaskan label untuk paparan HR dan Finance
- Pemilihan Treeview dengan label setempat

{{< figure src="/images/employee-applet/employee-categories.png" alt="Paparan kategori pekerja" caption="Employee categories: Paparkan kategori dan kumpulan pekerja" >}}

## Org Chart dan Reporting

Gunakan alat org chart untuk mentakrif dan memvisualkan garis pelaporan:
- Tetapan report-to bagi setiap pekerja
- Senarai org chart dan paparan hierarki
- Keterlihatan approved leave untuk perancangan pengurus

{{< figure src="/images/employee-applet/employee-org-chart.png" alt="Paparan org chart" caption="Org Chart: Visualkan garis pelaporan dan struktur pasukan" >}}

## Login dan Access

Kawal login dan hak akses terus dari profil pekerja:
- Cipta dan edit kredensial login pekerja
{{< figure src="/images/employee-applet/employee-login.png" alt="Tab login" caption="Tab Login dalam butiran Employee" >}}
- Tetapkan rank, status, dan akses applet catalog
{{< figure src="/images/employee-applet/employee-login-create.png" alt="tab login" caption="Konfigurasi login pekerja" >}}


## Konfigurasi Payroll dan Cukai

Kesiapsiagaan payroll memerlukan tetapan kewangan yang konsisten:
- Konfigurasi pembayaran dan butiran bank
- Profil cukai dan tetapan statutori
- Had perbelanjaan pekerja untuk bayaran balik terkawal

## Claims dan Entitlements

Applet ini mengaitkan rekod pekerja dengan pengurusan claim:
- Pautan akaun claim dan entitlements
- Keterlihatan laporan untuk HR dan Finance
- Jejak baki dan penggunaan entitlements

## File Import

Import pukal memudahkan onboarding dan kemas kini besar:
- Muat naik fail data pekerja
- Validasi dan prapapar sebelum import
- Kurangkan kemasukan manual untuk pasukan besar
- Gunakan fail template untuk elak ralat validasi
{{< figure src="/images/employee-applet/employee-file-import.png" alt="Menu File import" caption="Membolehkan pengguna import butiran pekerja dalam fail CSV untuk menjimatkan masa" >}}


### Sample File Import Template

Gunakan CSV atau Excel (XLSX) dengan header pada baris pertama. Format yang disyorkan:

| Column | Required | Example | Notes |
|--------|----------|---------|-------|
| **Employee Code** | Yes | EMP001 | Must be unique |
| **Employee Name** | Yes | Nur Aisyah | Legal name |
| **Employee Type** | Yes | Merchant | Employee type |
| **ID Number** | Yes | EMP1234 | Employee identification |
| **Email** | Yes | nur@example.com | Used for login |
| **Phone** | No | +60 12-345 6789 | Include country code |
| **Branch Code** | Yes | KL01 | Must exist in Branch setup |
| **Department** | No | Finance | Use standard department names |
| **Report To (Employee ID)** | No | EMP0005 | Manager ID |
| **Join Date** | No | 2026-01-15 | YYYY-MM-DD |
| **Status** | No | ACTIVE | ACTIVE/INACTIVE |

---

## Configuration & Settings

Akses tetapan di `Settings` untuk mengawal tingkah laku applet.

**Key configuration areas:**
- **Default Selection**: Cawangan, jabatan dan tetapan default
- **Field Settings**: Aktifkan atau sembunyikan medan dan tab
- **Webhook**: Integrasi event pekerja dengan sistem luaran
- **Feature Visibility**: Kawal akses menu dan modul
- **Permission Wizard and Sets**: Pengurusan akses berdasarkan peranan
- **User, Team, and Role Permissions**: Kawalan permission terperinci
- **Personalization**: Keutamaan default dan susun atur sidebar
- **Applet Log**: Jejak tindakan untuk audit pematuhan

{{< figure src="/images/employee-applet/settings.png" alt="Halaman tetapan Employee Applet" caption="Settings: Konfigurasi default, keterlihatan medan dan permission" >}}

---

## FAQ

**Q: Mengapa saya tidak nampak butang Create Employee?**
A: Anda mungkin tidak mempunyai permission yang diperlukan. Semak peranan atau permission pengguna di Settings.

**Q: Bagaimana saya boleh memuat naik pekerja secara pukal?**
A: Pergi ke **File Import**, muat naik fail template, sahkan, dan import.

**Q: Bagaimana saya boleh menukar pengurus laporan pekerja?**
A: Buka profil pekerja dan kemas kini bahagian **Report-To**.

**Q: Mengapa medan payroll atau tax disembunyikan?**
A: Keterlihatan medan boleh dikonfigurasi di `Settings > Field Settings`.

**Q: Bagaimana saya mahu pautkan Peppol ID untuk e-invoicing?**
A: Gunakan bahagian **Peppol ID Link** dalam profil pekerja.

**Q: Mengapa saya tidak nampak menu Org Chart?**
A: Feature visibility atau permission peranan mungkin menghadkan akses. Semak `Settings > Feature Visibility`.
