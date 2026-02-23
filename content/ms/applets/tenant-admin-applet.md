---
title: "Applet Pentadbir Tenant"
description: "Applet tadbir urus tenant berpusat untuk katalog, pengguna, peranan, set kebenaran, tetapan dan kebolehkesanan audit"
tags:
- tenant-administration
- access-control
- role-management
- permission-sets
- audit-trail
weight: 61
---

## Tujuan dan Gambaran Keseluruhan

**Tenant Admin Applet** ialah ruang kerja tadbir urus tenant dalam Akaun Platform. Ia memusatkan pentadbiran akses katalog, akses pengguna, penugasan applet, kawalan peranan dan kebenaran, serta keterlihatan audit operasi.

{{< callout type="info" >}}
**Konsep Teras**: Kawal **siapa** yang boleh mengakses tenant, **apa** yang boleh mereka akses (catalogues/applets), dan **bagaimana** akses ditadbir (roles, permission sets, and audit trail).
{{< /callout >}}

{{< figure src="/images/tenant-admin-applet/tenant-main-listing.png" alt="Tenant Admin main listing page showing governance modules" caption="Main Listing Page: Central menu for tenant governance modules" >}}

## Gambaran Keseluruhan Ciri Utama

### Siapa yang Mendapat Manfaat daripada Applet Ini?

**Pentadbir Tenant:**
- Urus pengguna tenant, pentadbir, applet dan katalog di satu tempat
- Konfigurasi struktur peranan dan kebenaran
- Kawal keterlihatan menu/modul melalui tetapan flag

**Pasukan Keselamatan & Operasi:**
- Seragamkan kawalan akses berasaskan peranan
- Kurangkan peralihan akses melalui keterlihatan penugasan dan aliran semakan
- Pantau perubahan berisiko melalui log audit

**Pihak Berkepentingan Pematuhan & Audit:**
- Jejak siapa mengubah apa dan bila
- Semak metadata tindakan untuk kawalan tadbir urus akses
- Sokong pengumpulan bukti audit dalaman/luaran

**Pengguna Akhir Tenant:**
- Menerima penugasan akses yang lebih tepat
- Mendapat keterlihatan applet dan katalog yang sesuai berdasarkan peranan
- Mengalami kurang isu konfigurasi akses

### Masalah Apa yang Diselesaikan?

**Sebelum:**
- Pentadbiran akses sering tersebar merentas pelbagai aliran kerja
- Penugasan pengguna/applet/katalog lebih sukar disahkan secara konsisten
- Perubahan peranan dan kebenaran sukar dijejak hujung-ke-hujung
- Persediaan manual meningkatkan risiko salah konfigurasi

**Selepas:**
- Satu applet berasaskan route untuk aliran kerja pentadbiran tenant
- Tadbir urus peranan dan set kebenaran dengan sokongan skop sasaran
- Keterlihatan penugasan pengguna dan applet yang tersusun (bilangan dan drill-in)
- Kebolehkesanan perubahan pentadbiran berasaskan audit trail

## Gambaran Keseluruhan Ciri Utama

{{< cards >}}
  {{< card title="Catalogue Governance" subtitle="Catalogue records and applet linkage controls" link="#main-modules" >}}

  {{< card title="User Access Control" subtitle="Tenant and platform user assignment workflows" link="#user-access-control" >}}

  {{< card title="Roles & Permissions" subtitle="Role listing, assignment counts, and permission sets" link="#roles--permission-sets" >}}

  {{< card title="Role File Import" subtitle="Template download + bulk upload with status tracking" link="#role-file-import" >}}

  {{< card title="Audit Visibility" subtitle="Searchable action history for governance and compliance" link="#audit-trail" >}}

  {{< card title="Settings & Personalization" subtitle="Menu visibility, defaults, and personalization" link="#configuration--settings" >}}
{{< /cards >}}

{{< figure src="/images/tenant-admin-applet/tenant-admin-overview-infographic.png" alt="Tenant Admin infographic showing before challenges, applet solution, and user roles" caption="Tenant Admin Overview: Before-state challenges, applet solution, and who benefits" >}}

## Konsep Utama

### Model Tadbir Urus Akses Tenant

| Soalan Tadbir Urus | Modul Utama | Hasil |
|---|---|---|
| Siapa boleh mengakses tenant? | Tenant Users, Platform Users, Tenant Admins | Akses peringkat subjek yang terkawal |
| Apa yang boleh mereka buka? | Catalogue, Applets | Liputan applet/katalog yang terkawal |
| Apa yang boleh mereka lakukan? | Tenant Roles, Permission Sets | Kawalan peringkat tindakan mengikut peranan/set kebenaran |
| Bagaimana perubahan disahkan? | Audit Trail | Sejarah tadbir urus yang boleh dijejak |

{{< callout type="tip" >}}
**Urutan disyorkan**: Konfigurasi Roles dan Permission Sets dahulu, kemudian tetapkan pengguna dan applet, kemudian sahkan semua perubahan dalam Audit Trail.
{{< /callout >}}

---

## Panduan Mula Pantas

Mulakan dengan cepat menggunakan aliran kerja berfokus peranan ini.

### Untuk Pentadbir Tenant: Persediaan Asas

**Matlamat:** Sediakan tadbir urus tenant dalam 10 langkah praktikal.

1. Buka `Tenant Admin` dan sahkan konteks tenant semasa.
2. Pergi ke `Settings` dan pastikan modul diperlukan kelihatan (Catalogue, Users, Roles, Permission Sets, Audit Trail).
3. Konfigurasi pilihan lalai (branch, location, company, row count).
4. Konfigurasi rekod `Catalogue` dan pautan applet.
5. Semak senarai `Applets` dan sahkan status/ketersediaan.
6. Konfigurasi `Tenant Roles` dan semak bilangan taburan peranan.
7. Konfigurasi `Permission Sets` dan petakan kepada keperluan applet/sasaran.
8. Sahkan penugasan `Tenant Users` dan `Platform Users`.
9. Daftarkan dan sahkan sekurang-kurangnya dua `Tenant Admins` yang aktif.
10. Laksanakan satu kemas kini ujian dan sahkan kebolehkesanan dalam `Audit Trail`.

### Untuk Keselamatan & Operasi: Pengukuhan Kawalan

**Matlamat:** Kurangkan salah konfigurasi dan akses berlebihan.

1. Semak peranan pendua atau lapuk dalam `Tenant Roles`.
2. Semak `Permission Sets` untuk kebenaran luas yang tidak perlu.
3. Semak `No. of Users` dan `No. of Teams` pada peranan untuk corak penugasan berlebihan.
4. Laksanakan skop sasaran (company/branch/location) apabila diperlukan.
5. Pastikan liputan kesinambungan melalui akaun pentadbir sandaran.
6. Sahkan polisi keterlihatan modul mengikut peranan (admin vs operations vs audit).
7. Lakukan semakan berkala `Audit Trail` untuk perubahan berkeistimewaan.

### Untuk Pasukan Pematuhan/Audit: Semakan Bukti

**Matlamat:** Hasilkan bukti tadbir urus yang boleh dipertahankan.

1. Tapis `Audit Trail` mengikut tarikh, jenis tindakan, dan pelaku.
2. Ambil sampel perubahan impak tinggi (edit peranan, perubahan kebenaran, kemas kini pentadbir).
3. Sahkan konsistensi cap masa dan data pelaku.
4. Tangkap/eksport artifak untuk kertas kerja audit.
5. Log pengecualian yang belum selesai untuk penjejakan pemulihan.

### Untuk Sokongan Aplikasi: Selesaikan Isu Akses dengan Pantas

**Matlamat:** Tutup tiket akses lazim dengan semakan yang konsisten.

1. Sahkan keterlihatan modul dalam `Settings`.
2. Semak penugasan pengguna dalam `Tenant Users` atau `Platform Users`.
3. Sahkan penugasan peranan dan `Permission Sets` yang berkaitan.
4. Sahkan pautan applet/katalog dalam `Catalogue` dan `Applets`.
5. Gunakan `Audit Trail` untuk mengenal pasti perubahan terkini yang menyebabkan isu.

### Contoh Dunia Sebenar: Pelancaran Akses Tenant Baharu (Hujung-ke-Hujung)

**Senario:** Sebuah tenant sedang menerima masuk pasukan operasi Kewangan baharu dan memerlukan akses terkawal sebelum tamat hari.

1. Pentadbir mengaktifkan modul diperlukan dalam `Settings` (`Catalogue`, `Applets`, `Tenant Users`, `Tenant Roles`, `Permission Sets`, `Audit Trail`).
2. Pentadbir mengesahkan atau mencipta entri katalog berkaitan Kewangan dalam `Catalogue`.
3. Pentadbir mengesahkan applet diperlukan aktif dalam `Applets` dan dipautkan ke katalog yang betul.
4. Pentadbir mencipta/mengemas kini `Tenant Roles` untuk Finance Clerk dan Finance Supervisor.
5. Pentadbir memetakan `Permission Sets` yang sesuai kepada setiap peranan dengan skop sasaran yang diperlukan.
6. Pentadbir menugaskan pengguna perintis dalam `Tenant Users` dan mengesahkan keterlihatan applet/katalog.
7. Sokongan menjalankan pengesahan log masuk dengan pengguna perintis dan menyemak akses menu yang dijangka.
8. Pematuhan menyemak `Audit Trail` untuk semua tindakan persediaan dan merekodkan bukti.

**Hasil:** Akses disediakan secara konsisten, disahkan oleh sokongan, dan boleh dijejak untuk audit.

### Kesilapan Lazim (Mula Pantas)

- Mengaktifkan peranan sebelum keterlihatan modul dikonfigurasi dalam `Settings`.
- Menetapkan pengguna sebelum pautan applet-ke-katalog disahkan.
- Mengguna semula set kebenaran luas untuk peranan khusus tanpa skop.
- Melangkau pengesahan pengguna perintis sebelum pelancaran penuh.
- Tidak melakukan pengesahan audit selepas perubahan akses berimpak tinggi.

**Cara elak:** Sentiasa ikut urutan: visibility -> catalogue/applet linkage -> role/permission set -> user assignment -> pilot test -> audit verification.

{{< callout type="tip" >}}
**Senarai semak go-live**: keterlihatan modul disahkan, lalai dikonfigurasi, peranan dimuktamadkan, set kebenaran dipetakan, penugasan pengguna diuji, dan pemantauan audit minggu pertama dijadualkan.
{{< /callout >}}

---

## Modul Utama

Applet ini disusun kepada modul tadbir urus berikut:

| Modul | Kegunaan Utama |
|---|---|
| `Catalogue` | Urus rekod katalog dan pautan applet-ke-katalog |
| `Subscription` | Kendalikan pentadbiran berkaitan langganan tenant |
| `Tenant Users` | Urus akses dan penugasan pengguna peringkat tenant |
| `Platform Users` | Urus akses pengguna peringkat platform dalam konteks tenant |
| `Applets` | Semak dan tadbir ketersediaan applet |
| `Tenant Roles` | Takrif struktur peranan dan semak bilangan penugasan |
| `Role File Import` | Muat naik pukal definisi peranan melalui templat |
| `Tenant Admins` | Selenggara akaun pentadbir tenant |
| `Permission Sets` | Konfigurasi pakej kebenaran boleh guna semula |
| `Data Sync` | Urus kawalan penyegerakan (bergantung kesiapsiagaan branch) |
| `Audit Trail` | Semak sejarah tindakan dan kebolehkesanan |
| `Settings` | Konfigurasi lalai, tetapan medan, webhook, dan paparan kebenaran |
| `Personalization` | Kawalan personalisasi peringkat pengguna |

## Aliran Kerja UI Teras

### Paparan Senarai dan Operasi

UI menyediakan operasi berasaskan grid untuk modul utama:
- Paparan pengguna merangkumi bilangan penugasan (`No. of Catalogue`, `No. of Applets`) dan medan status
- Paparan peranan merangkumi metrik taburan (`No. of Users`, `No. of Teams`)
- Paparan set kebenaran merangkumi jejak code/name/applet/date
- Paparan import peranan merangkumi status fail dan mesej ralat pemprosesan
- Paparan audit merangkumi penapisan actor/action/date untuk kebolehkesanan

### Cipta/Edit dan Aliran Tindakan

Aliran kerja lazim yang tersedia dalam applet:
- Aliran cipta/edit katalog dan pautan applet
- Tambah/edit set kebenaran dengan konfigurasi baris berbilang langkah
- Muat naik fail peranan dengan sokongan muat turun contoh CSV
- Aliran cipta/edit pentadbir tenant
- Operasi tambah applet ke katalog dan pasang untuk pengguna

{{< figure src="/images/tenant-admin-applet/tenant-main-listing.png" alt="Catalogue listing for tenant-admin" caption="Catalogue Listing: Manage tenant catalogue entries" >}}

{{< figure src="/images/tenant-admin-applet/tenant-catalogue-create.png" alt="Catalogue create form" caption="Create Form: Configure and maintain catalogue records" >}}

{{< figure src="/images/tenant-admin-applet/tenant-catalogue-edit.png" alt="Catalogue edit form" caption="Edit Form: Configure and maintain catalogue records" >}}

## Kawalan Akses Pengguna

Gunakan `Tenant Users`, `Platform Users`, dan `Tenant Admins` untuk operasi akses.

- Semak jejak penugasan dan status
- Selenggara pentadbir peringkat tenant
- Sahkan konsistensi pengguna-ke-applet dan pengguna-ke-katalog

{{< figure src="/images/tenant-admin-applet/tenant-user.png" alt="Tenant users listing" caption="Tenant Users Listing: User access footprint and status" >}}

## Peranan & Set Kebenaran

Komponen peranan dan kebenaran menyediakan asas tadbir urus akses:

- `Tenant Roles` untuk definisi peranan dan metrik penugasan
- `Permission Sets` untuk pakej kebenaran boleh guna semula
- Sokongan skop sasaran dalam aliran kebenaran peranan/aplikasi (company/branch/location)

{{< figure src="/images/tenant-admin-applet/tenant-role.png" alt="Roles listing" caption="Tenant Roles : Structured role-based governance" >}}

{{< figure src="/images/tenant-admin-applet/tenant-permission-set.png" alt="Permission sets listing" caption="Tenant Permission Sets: Structured role-based governance" >}}

## Import Fail Peranan

Onboarding peranan menyokong import pukal:

- Muat turun templat contoh CSV
- Muat naik fail peranan
- Semak status proses dan maklumat ralat per baris

{{< figure src="/images/tenant-admin-applet/role-file-import-page.png" alt="Role file import page" caption="Role File Import: Template-based bulk setup and status monitoring" >}}

## Audit Trail

`Audit Trail` menyokong kebolehkesanan dan pemantauan tadbir urus:

- Tapis mengikut tindakan/tarikh/pelaku
- Semak sejarah perubahan untuk operasi sensitif
- Hasilkan bukti pematuhan

{{< figure src="/images/tenant-admin-applet/tenant-audit-trail-2.png" alt="Audit trail listing" caption="Audit Trail: Searchable administrative change history" >}}

## Konfigurasi & Tetapan

Modul tetapan dan personalisasi merangkumi:

- Flag keterlihatan menu/modul
- Tetapan pemilihan lalai
- Tetapan medan dan konfigurasi webhook
- Sidebar/lalai personalisasi

{{< figure src="/images/tenant-admin-applet/tenant-setting-page.png" alt="Tenant admin settings page" caption="Settings Page: Configure module visibility and defaults" >}}

### Senarai Semak Konfigurasi (Disyorkan)

Gunakan urutan ini semasa mengkonfigurasi tenant baharu:

1. Sahkan flag keterlihatan modul dalam `Settings`.
2. Tetapkan nilai lalai (company, branch, location, row count).

{{< figure src="/images/tenant-admin-applet/tenant-default.png" alt="Tenant defaults configuration for company, branch, location, and list row count" caption="Default Settings: Set company, branch, location, and row-count defaults" >}}

3. Konfigurasi peranan dan set kebenaran.

{{< figure src="/images/tenant-admin-applet/tenant-perm-wizard.png" alt="Permission wizard for target scoping and permission configuration" caption="Permission Wizard: Define scoped permissions by company, branch, and location" >}}

{{< figure src="/images/tenant-admin-applet/tenant-perm-set.png" alt="Permission set configuration screen" caption="Permission Sets: Create reusable access packages for applets" >}}

{{< figure src="/images/tenant-admin-applet/tenant-user-perm.png" alt="User-level permission configuration screen" caption="User Permissions: Override or refine access for specific users" >}}

{{< figure src="/images/tenant-admin-applet/tenant-role-perm.png" alt="Role permission mapping screen" caption="Role Permissions: Map roles to permission sets and scoped actions" >}}

4. Sahkan penugasan pengguna tenant/platform.
5. Sahkan keterlihatan logging audit untuk tindakan utama.

### Panduan Keterlihatan Modul Mengikut Peranan

| Peranan | Modul Disyorkan Kelihatan |
|---|---|
| Tenant Administrator | Catalogue, Tenant Users, Platform Users, Applets, Tenant Roles, Permission Sets, Tenant Admins, Audit Trail |
| Security/Operations | Tenant Roles, Permission Sets, Tenant Users, Platform Users, Audit Trail, Data Sync |
| Compliance/Audit | Audit Trail, Tenant Roles (read access), Permission Sets (read access) |

### Tetapan Tadbir Urus Peranan dan Kebenaran

Gunakan kawalan ini untuk mengurangkan risiko salah konfigurasi:

- Kekalkan definisi peranan berasaskan fungsi perniagaan (bukan khusus pengguna).
- Gunakan set kebenaran untuk corak akses yang boleh guna semula.
- Guna skop sasaran (company/branch/location) apabila diperlukan.
- Semak bilangan penugasan peranan (`No. of Users`, `No. of Teams`) secara berkala.

### Konfigurasi Audit dan Pemantauan

Semakan operasi yang disyorkan:

- Harian: semak perubahan berimpak tinggi peranan/kebenaran/pentadbir dalam `Audit Trail`.
- Mingguan: sahkan perubahan keterlihatan modul yang tidak dijangka.
- Bulanan: pensijilan semula penggunaan peranan dan set kebenaran bersama pemilik perniagaan.

### Nota Persekitaran

- `Data Sync` mungkin dilaksanakan sebahagian bergantung pada branch.
- Fungsi berkaitan hostname `Subscription` mungkin memerlukan penyempurnaan integrasi khusus persekitaran.
- Sahkan lalai route settings dalam branch deployment anda untuk elak ketidakselarasan pengalihan.

## FAQ

**Q1: Pengguna sudah ditetapkan tetapi masih tidak nampak modul. Apa patut saya semak dahulu?**  
A: Semak mengikut urutan ini: keterlihatan modul dalam `Settings`, penugasan pengguna (`Tenant Users`/`Platform Users`), penugasan peranan, kemudian set kebenaran yang dipautkan.

**Q2: Bila saya patut guna Tenant Users berbanding Platform Users?**  
A: Guna `Tenant Users` untuk operasi akaun berskop tenant. Guna `Platform Users` apabila akses diurus daripada konteks identiti peringkat platform.

**Q3: Bagaimana saya melancarkan peranan baharu kepada ramai pengguna dengan selamat?**  
A: Cipta dan sahkan peranan dengan pengguna perintis dahulu, petakan set kebenaran yang betul, kemudian lancarkan secara berkelompok sambil memantau `Audit Trail`.

**Q4: Bagaimana saya onboard peranan secara pukal dengan cepat?**  
A: Guna `Role File Import`: muat turun contoh CSV, isi lajur wajib, muat naik, kemudian semak status fail dan baris ralat.

**Q5: Bagaimana saya boleh sahkan siapa yang mengubah tetapan kebenaran atau peranan?**  
A: Gunakan penapis `Audit Trail` (actor, action, date) dan periksa butiran event untuk kebolehkesanan.

**Q6: Kenapa label kadangkala muncul dalam English sahaja?**  
A: Sesetengah paparan bergantung pada terjemahan `labels` hos-kongsi. Jika tiada, komponen akan guna teks fallback English terbina dalam.

**Q7: Apa yang perlu disahkan sebelum go-live?**  
A: Sahkan keterlihatan modul, lalai, peranan, set kebenaran, penugasan pengguna, backup admins, dan jalankan ujian hujung-ke-hujung yang direkod dalam `Audit Trail`.

**Q8: Adakah Data Sync sedia produksi untuk semua persekitaran?**  
A: Tidak semestinya. Sahkan kesiapsiagaan branch/persekitaran kerana sesetengah implementasi masih mengandungi TODO atau wiring sync separa.
