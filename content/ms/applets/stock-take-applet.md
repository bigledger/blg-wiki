---
title: "Aplet Stock Take"
description: "Sistem pengiraan stok dan pengurusan varians yang komprehensif untuk audit inventori berasaskan sesi, pengiraan dipacu peranti, dan pelaporan rekonsiliasi"
tags:
- stock-take
- inventory-control
- variance-management
- cycle-count
- warehouse-operations
weight: 165
---

{{< callout type="warning" >}}
**Dalam semakan**: Dokumentasi aplet ini masih dalam proses semakan.
{{< /callout >}}

## Tujuan dan Gambaran Keseluruhan

**Aplet Stock Take** ialah alat praktikal yang sedia untuk operasi bagi menjalankan pengiraan inventori yang tepat tanpa bergantung pada spreadsheet dan rekonsiliasi manual. Ia menyokong pengiraan berasaskan sesi, aliran kerja dipacu peranti, dan analisis varians yang pantas supaya pasukan boleh mengira lebih cepat dan menutup proses lebih cepat.

{{< callout type="info" >}}
**Konsep Teras**: Aplet ini menghubungkan proses pengiraan anda dari hujung ke hujung: **Session** (bila/di mana anda mengira), **Device** (siapa yang mengira), **Records** (apa yang dikira), dan **Report** (bagaimana varians direkonsiliasi).
{{< /callout >}}

{{< figure src="/images/stock-take-applet/stock-take-main-overview.png" alt="Paparan utama Aplet Stock Take yang menunjukkan navigasi modul untuk sesi, peranti, laporan, tetapan, dan personalisasi." caption="Gambaran Keseluruhan Aplet Stock Take: Akses semua aliran kerja utama stock take daripada satu ruang kerja operasi." >}}

### Tentang Aplet

- **Tujuan**: Mendigitalkan operasi pengiraan stok dan mengurangkan ketidakpadanan antara stok fizikal dan baki sistem.
- **Pengguna Sasaran**: Pasukan gudang, pengawal inventori, pasukan kewangan/audit, dan pemimpin operasi.
- **Ciri Utama**:
  - Pelaksanaan stock take berasaskan sesi dengan kawalan `OPEN` dan `CLOSED`
  - Peruntukan peranti untuk operasi berbilang pengira yang terkawal
  - Tangkap item dengan pantas melalui scan form atau kemasukan manual berstruktur
  - Pengesahan peka serial dan batch untuk pengiraan yang boleh dijejak
  - Pelaporan varians dengan tangkapan sebab dan muat naik sebab pukal berasaskan Excel

## Gambaran Keseluruhan Ciri Utama

### Siapa yang Mendapat Manfaat daripada Aplet Ini?

**Kakitangan Gudang & Pengira Stok:**
- Pengiraan lebih pantas dengan aliran kerja imbasan barcode/manual
- Kurang keletihan kemasukan data dengan tingkah laku auto-scan pilihan
- Pengendalian stok bersiri dan batch yang lebih baik

**Penyelia Inventori & Pengurus Kedai:**
- Sesi pengiraan berstruktur mengikut lokasi
- Peruntukan peranti dan keterlihatan kemajuan
- Penutupan sesi terkawal untuk tadbir urus

**Pasukan Kewangan & Audit Dalaman:**
- Paparan varians yang jelas (qty dan varians serial)
- Keterlihatan impak kos dan sokongan rekonsiliasi
- Tangkapan sebab untuk pengecualian dan jejak audit

**Kepimpinan Operasi:**
- Ketepatan inventori yang lebih baik dan kurang kejutan pelarasan
- Garis masa rekonsiliasi stok yang lebih boleh diramal
- Keputusan yang lebih bersih daripada laporan stok yang boleh dipercayai

### Masalah Apa yang Diselesaikan?

**Masalah Pengiraan Stok Manual:**

Proses stock take tradisional biasanya melibatkan helaian yang terpisah, kemas kini tertunda, dan kebolehjejakan yang lemah. Isu lazim termasuk:
- Pengiraan item berganda atau terlepas
- Rekonsiliasi hujung hari yang perlahan
- Ketidakpadanan serial tanpa bukti punca akar
- Tiada tangkapan sebab yang konsisten untuk varians
- Keterlihatan tertunda untuk keputusan pengurusan

**Penyelesaian Aplet Stock Take:**

- **Kawalan sesi** - Jalankan stock take dalam kitaran `OPEN` dan `CLOSED` yang berstruktur
- **Pengiraan berpandu** - Peruntukkan peranti dan lalukan pengira melalui aliran terkawal
- **Tangkapan fleksibel** - Guna scan-first atau kemasukan kiraan manual berdasarkan senario
- **Pengesahan peka serial** - Tingkatkan keyakinan untuk inventori bersiri dan batch
- **Kecerdasan varians** - Analisis varians kuantiti dan serial bersama impak kos
- **Rekonsiliasi pukal** - Eksport, isi sebab, dan import kemas kini rekonsiliasi melalui Excel

## Gambaran Keseluruhan Ciri Utama

{{< cards >}}
  {{< card title="Pengurusan Sesi" subtitle="Cipta, jalankan, dan tutup sesi stock take terkawal" link="#session-management" >}}

  {{< card title="Peruntukan Peranti" subtitle="Lampirkan peranti aktif pada setiap sesi untuk pelaksanaan yang kemas" link="#device-management" >}}

  {{< card title="Pengiraan Pantas" subtitle="Scan form dan kemasukan berstruktur untuk pengiraan berkelajuan tinggi" link="#counting-workflows" >}}

  {{< card title="Kawalan Serial dan Batch" subtitle="Jejak varians bersiri dan batch dengan kebolehjejakan yang lebih baik" link="#counting-workflows" >}}

  {{< card title="Pelaporan Varians" subtitle="Lihat min/max, counted qty, system qty, dan varians dalam satu paparan" link="#reporting-and-reconciliation" >}}

  {{< card title="Muat Naik Sebab" subtitle="Eksport dan import kemas kini sebab dalam Excel" link="#reporting-and-reconciliation" >}}

  {{< card title="Peraturan Boleh Dikonfigurasi" subtitle="Kawal tingkah laku imbasan, pengesahan, aliran kerja, dan keterlihatan" link="#configuration--settings" >}}

  {{< card title="Tetapan Peribadi Lalai" subtitle="Tetapkan default branch dan location mengikut aplet dan pengguna" link="#configuration--settings" >}}
{{< /cards >}}

## Konsep Utama

### Memahami Rangka Kerja Stock Take

| Aspek | Komponen | Contoh Praktikal |
|--------|-----------|------------------|
| **Bila/Di Mana** mengira | Stock Take Session | "KL Warehouse - April Cycle Count" |
| **Siapa** yang mengira | Assigned Devices / Users | Counter Device A, Counter Device B |
| **Apa** yang dikira | Session Records | Item code, quantity, UOM, serial/batch |
| **Bagaimana** hasil direkonsiliasi | Session Report | Variance, serial variance, reason, cost impact |

### Struktur Hierarki Stock Take

```
Stock Take Applet
|
|-- Stock Take Session
|   |-- Details (name, code, location, status, workflow)
|   |-- Devices (assigned active counting devices)
|   |-- Records (all counted lines)
|   `-- Report (variance and reconciliation)
|
|-- Devices (master device setup)
|
`-- Report (cross-session listing and exports)
```

### Status dan Jenis Laporan

| Jenis | Nilai | Maksud |
|------|--------|---------|
| **Session Status** | `OPEN`, `CLOSED` | Sesi terbuka membenarkan pengiraan aktif dan suntingan |
| **Variance Status** | `YES`, `NO` | Menunjukkan sama ada sesi mempunyai varians |
| **Report Type** | `Scanned Items`, `Active Items`, `All Items` | Mengawal skop laporan semasa analisis/eksport |

---

## Panduan Mula Pantas

Gunakan aliran kerja khusus peranan ini untuk go live dengan cepat.

### Untuk Pengira Stok: Mula Mengira Item

**Matlamat:** Tangkap rekod stok yang tepat dengan cepat menggunakan imbasan atau kemasukan manual.

1. Pergi ke **Stock Take Session** dan buka sesi yang diperuntukkan.
2. Dalam tab **Devices**, pilih peranti aktif yang diperuntukkan kepada anda.
3. Buka **Records** dan mula daripada **Scan Form** atau **Add Item**.
4. Imbas atau masukkan item code, pilih UOM, kemudian masukkan kuantiti.
5. Untuk item bersiri/batch, masukkan butiran serial atau batch seperti diperlukan.
6. Simpan dan sahkan baris tersebut muncul dalam senarai.

**Tip:** Untuk item bersiri, pastikan kuantiti dan senarai serial selaras untuk mengelakkan ralat simpan.

---

### Untuk Penyelia Inventori: Jalankan Sesi End-to-End

**Matlamat:** Sediakan stock take yang terkawal dan pantau pelaksanaan.

1. Buka **Stock Take Session** dan klik **Create**.
2. Isi **Session Name**, **Session Code**, **Location**, dan kekalkan status sebagai `OPEN`.
3. Simpan sesi, kemudian buka tab **Devices**.
4. Tambah peranti aktif untuk setiap pasukan pengiraan.
5. Pantau **Records** semasa pengira menghantar baris.
6. Dalam tab **Report**, klik **GENERATE** atau **REGENERATE** untuk menyegarkan varians.
7. Selepas semakan dan rekonsiliasi, tukar status kepada `CLOSED`.

---

### Untuk Admin: Konfigurasi Aplet Sebelum Go-Live

**Matlamat:** Pastikan aplet dikonfigurasi dengan betul sebelum pasukan mula mengira.

1. Buka **Settings > Field Settings**.
2. Tetapkan toggle yang diperlukan:
   - `ENABLE_AUTO_SCAN` (jika anda mahu automasi scan-to-list)
   - `ENABLE_VALIDATE_SERIAL` (untuk kawalan stok bersiri)
   - `SCAN_CODE_MOBILE_VIEW` (jika imbasan kamera mudah alih digunakan)

3. Konfigurasikan `WORKFLOW_PROCESS_GUID` jika kawalan workflow diperlukan untuk progres sesi.

{{< figure src="/images/stock-take-applet/auto-scan.png" alt="Skrin Field Settings dengan pilihan auto scan, pengesahan serial, mobile scan, dan konfigurasi proses workflow." caption="Field Settings: Konfigurasikan tingkah laku imbasan, kawalan pengesahan, dan pautan proses workflow sebelum go-live." >}}

4. Buka **Settings > Default Selection** dan tetapkan Branch dan Location lalai.
5. Buka **Personalization > Default Selection** dan sahkan override pada peringkat pengguna untuk pengguna perintis.
6. Uji end-to-end dengan satu sesi sampel:
   - Create session
   - Assign device
   - Add records
   - Generate report
   - Fill reason
   - Close session

---

### Untuk Kewangan/Audit: Rekonsiliasi Varians dan Tutup Pengecualian

**Matlamat:** Lengkapkan semakan varians dengan nota yang sedia sebagai bukti.

1. Buka sesi sasaran dan pergi ke tab **Report**.

{{< figure src="/images/stock-take-applet/session-report.png" alt="Tab Session Report memaparkan baris laporan terjana, lajur varians, dan konteks rekonsiliasi untuk sesi stock take terpilih." caption="Paparan Session Report: Analisis varians peringkat item dan sediakan rekonsiliasi dalam sesi stock take aktif." >}}

2. Tapis mengikut jenis laporan (`Scanned Items`, `Active Items`, atau `All Items`).


{{< figure src="/images/stock-take-applet/session-report-search.png" alt="Carian lanjutan Session Report dengan penapis jenis laporan untuk Scanned Items, Active Items, atau All Items." caption="Carian Session Report: Tapis skop laporan dengan cepat untuk fokus pada set rekonsiliasi yang tepat." >}}

3. Semak varians kuantiti, varians serial, dan jumlah impak kos.
4. Masukkan sebab secara inline untuk pengecualian utama, atau klik **UPLOAD REASON**.
5. Eksport templat laporan, isi `TotalQty` dan `reason`, kemudian import semula.
6. Sahkan baris laporan telah dikemas kini dan eksport laporan akhir jika perlu.

{{< callout type="tip" >}}
**Urutan Go-Live Praktikal**: Mulakan dengan satu lokasi perintis dan satu pasukan pengiraan. Sahkan masa proses, kemudian skala ke semua lokasi.
{{< /callout >}}

---

## Pengurusan Sesi

### Senarai Sesi

Grid sesi memberikan paparan operasi pantas dengan medan seperti:
- Session Name dan Session Code
- Location dan Company
- Status (`OPEN` / `CLOSED`)
- Start Date dan Modified Date

{{< figure src="/images/stock-take-applet/stock-take-session-listing.png" alt="Senarai Stock Take Session dengan rekod boleh cari, metadata sesi, dan penjejakan status operasi." caption="Halaman Senarai Sesi: Semak sesi aktif dan selesai dengan penapisan serta tindakan akses pantas." >}}

### Butiran Sesi

Tab **Details** merangkumi:
- Identiti sesi: nama, kod, deskripsi
- Konteks operasi: lokasi dan syarikat
- Medan kawalan: status, tarikh mula/tamat
- Medan workflow: status dan resolusi
- Medan audit: created/modified by dan cap masa

{{< figure src="/images/stock-take-applet/stock-take-session-create-form.png" alt="Borang Create Stock Take Session dengan medan teras seperti session code, location, dan butiran workflow." caption="Borang Cipta Sesi: Konfigurasikan sesi stock take baharu dengan maklumat operasi yang diperlukan." >}}

{{< figure src="/images/stock-take-applet/stock-take-session-edit-form.png" alt="Borang Edit Stock Take Session menunjukkan kawalan kemas kini untuk status, butiran, dan tab pengiraan yang dipautkan." caption="Borang Edit Sesi: Kekalkan butiran sesi dan kawal progres daripada pengiraan terbuka hingga penutupan." >}}

### Tab Devices

Gunakan tab ini untuk melampirkan peranti aktif kepada sesi. Peranti tersebut kemudian boleh digunakan oleh pengira untuk merekod baris stok semasa sesi itu.

{{< figure src="/images/stock-take-applet/device-tab.png" alt="Tab Devices di dalam Session Edit menunjukkan peranti pengiraan yang diperuntukkan dan status semasanya." caption="Tab Devices Sesi: Lampirkan dan semak peranti pengiraan aktif untuk sesi stock take terpilih." >}}

### Tab Records

Memberi keterlihatan seluruh sesi terhadap baris pengiraan merentas peranti yang diperuntukkan. Penyelia boleh mengesan baris yang hilang, ketidakpadanan, dan outlier dengan cepat.

{{< figure src="/images/stock-take-applet/session-record.png" alt="Tab Records menunjukkan baris item yang dikira dengan item code, quantity, UOM, dan maklumat kemas kini terakhir." caption="Tab Records Sesi: Jejak kiraan stok yang ditangkap dan semak butiran peringkat rekod semasa pelaksanaan." >}}

### Tab Report

Ini ialah ruang kerja rekonsiliasi:
- Jana atau jana semula baris laporan
- Tapis dan periksa varians
- Tangkap sebab
- Lancarkan aliran muat naik sebab

{{< figure src="/images/stock-take-applet/session-report-tab.png" alt="Kawalan tab Session Report dengan tindakan Generate/Regenerate, senarai laporan, dan aliran kemas kini sebab." caption="Tab Session Report: Jana output varians dan urus tindakan rekonsiliasi daripada satu tab." >}}

## Pengurusan Peranti

Menu **Devices** mengurus master peranti stock take anda:
- Cipta profil peranti (nama, kod, jenama, model, status)
- Kekalkan hanya peranti yang sah dan aktif untuk peruntukan
- Selenggara status peranti untuk penggunaan sesi yang terkawal

{{< figure src="/images/stock-take-applet/stock-take-device-listing.png" alt="Senarai Stock Take Device dengan device code, maklumat model, dan status aktif untuk peruntukan." caption="Halaman Senarai Peranti: Urus peranti pengiraan yang tersedia sebelum memperuntukkannya kepada sesi stock take." >}}

{{< figure src="/images/stock-take-applet/stock-take-device-create-form.png" alt="Borang Create Device dengan medan device name, code, brand, model, dan status untuk peranti pengiraan baharu." caption="Borang Cipta Peranti: Daftarkan peranti stock take baharu untuk peruntukan ke dalam workflow sesi." >}}

{{< figure src="/images/stock-take-applet/stock-take-device-edit-form.png" alt="Borang Edit Device menunjukkan butiran peranti sedia ada, kemas kini status, dan medan metadata audit." caption="Borang Edit Peranti: Kekalkan butiran profil peranti dan status pengaktifan untuk operasi berterusan." >}}

## Aliran Kerja Pengiraan

### Kemasukan Berstruktur (Add Item)

Terbaik apabila pengira memerlukan kemasukan berpandu baris demi baris:
- Carian Scan Code
- Pemilihan UOM
- Pengendalian imbas/manual kuantiti
- Pengendalian senarai nombor bersiri
- Pilihan simpan seperti **Save & Continue** dan **Save & New**

### Fast Scan Form

Terbaik untuk persekitaran pengiraan yang sangat menekankan kelajuan:
- Mod imbasan kamera mudah alih pilihan
- Pemilihan jenis reader untuk format barcode
- Tambah pantas dengan kuantiti, remarks, dan input serial/batch
- Penyuntingan senarai secara inline untuk remarks dalam senarai imbasan

### Edit dan Pembetulan

Baris pengiraan boleh disemak dan dibetulkan daripada skrin suntingan rekod. Apabila sesi berada dalam status `CLOSED`, tindakan create/update/remove dihadkan untuk melindungi pemuktamadan.

## Pelaporan dan Rekonsiliasi

### Laporan Peringkat Sesi

Baris laporan merangkumi:
- Butiran item: item name, code, EAN
- Isyarat kuantiti: Min, Max, Counted, EMP/System quantity
- Ukuran varians: Variance, Variance 2, SN Variance
- Analisis serial: serial sistem-sahaja vs stock-take-sahaja
- Isyarat kewangan: nilai kos dan jumlah impak kos
- Medan sebab untuk nota rekonsiliasi

{{< callout type="info" >}}
**Nota Istilah**: Dalam skrin laporan, **EMP Quantity** merujuk kepada baki akhir sistem yang digunakan untuk perbandingan varians.
{{< /callout >}}

{{< figure src="/images/stock-take-applet/stock-take-session-report-details.png" alt="Butiran laporan Stock Take Session menunjukkan kuantiti peringkat item, metrik varians, dan medan sebab." caption="Halaman Butiran Session Report: Rekonsiliasikan kuantiti dikira terhadap baki sistem pada peringkat item." >}}

### Senarai Laporan Merentas Sesi

Menu **Report** peringkat atas membantu membandingkan sesi mengikut:
- Location
- Date
- Session status
- Variance status

Ia juga menyokong eksport laporan secara terus.

{{< figure src="/images/stock-take-applet/stock-take-report-listing.png" alt="Senarai Stock Take Report dengan status varians, paparan berkumpulan, dan susun atur laporan sedia eksport." caption="Halaman Senarai Laporan: Analisis hasil stock take dan kenal pasti sesi yang memerlukan rekonsiliasi." >}}

### Aliran Muat Naik Sebab Excel

Aplet ini menyokong rekonsiliasi pada skala besar:
1. Pilih jenis laporan dan eksport fail.
2. Isi medan utama (`itemCode`, `TotalQty`, `reason`).
3. Import fail untuk mengemas kini baris laporan secara pukal.
4. Buka semula laporan untuk mengesahkan kemas kini.

{{< figure src="/images/stock-take-applet/stock-take-upload-reason.png" alt="Skrin upload reason untuk mengimport nota varians dan pelarasan kuantiti berasaskan Excel." caption="Halaman Upload Reason: Import sebab rekonsiliasi secara pukal menggunakan templat laporan stock take." >}}

{{< figure src="/images/stock-take-applet/stock-take-upload-reason-1.png" alt="Skrin susulan Upload Reason yang menunjukkan status fail dipilih dan kesediaan tindakan import." caption="Pengesahan Upload Reason: Sahkan fail yang disediakan dan teruskan dengan import sebab secara pukal." >}}

## Konfigurasi & Tetapan

### `Settings > Field Settings`

Kawal tingkah laku runtime melalui toggle ini:

| Setting | Impact |
|---------|--------|
| `ENABLE_AUTO_SCAN` | Menolak item yang diimbas ke dalam senarai secara automatik |
| `ENABLE_VALIDATE_SERIAL` | Mengaktifkan logik pengesahan serial |
| `STOCK_DURING_OPENING_SHOP` | Membenarkan konfigurasi dasar masa pengiraan |
| `SERIALIZED_ITEM_EXT` | Membaca tingkah laku bersiri daripada item extension |
| `SCAN_CODE_MOBILE_VIEW` | Mengaktifkan paparan imbasan kamera/mobile |
| `HIDE_ADD_BUTTON` | Menyembunyikan tindakan tambah manual dalam scan form |
| `WORKFLOW_PROCESS_GUID` | Menghubungkan aliran sesi ke konfigurasi workflow |

{{< figure src="/images/stock-take-applet/stock-take-settings-page.png" alt="Tetapan Aplet Stock Take dengan konfigurasi medan, kawalan workflow, dan pilihan default selection." caption="Halaman Tetapan: Konfigurasikan tingkah laku imbasan, peraturan pengesahan, dan kawalan lalai peringkat aplet." >}}

### `Settings > Default Selection`

Tetapkan nilai lalai peringkat aplet:
- Default Branch
- Default Location

### Utiliti Kebenaran dan Integrasi

Laluan tetapan juga mendedahkan kawalan operasi seperti:
- Feature visibility
- Webhook setup
- Permission wizard, permission sets, dan paparan kebenaran peranan/pengguna/pasukan

## Audit & Kebolehjejakan

Aplet ini menyokong operasi berfokus audit melalui:
- Cap masa sesi dan rekod (`created` dan `modified`)
- Atribusi pengguna pada rekod utama (`created by` dan `modified by`)
- Tangkapan sebab varians pada peringkat baris laporan
- Pemuktamadan terkawal menggunakan status sesi (`OPEN` vs `CLOSED`)

**Aliran Audit Praktikal:**
1. Sahkan status sesi dan tarikh penutupan.
2. Semak varians baris laporan dan medan sebab.
3. Sahkan varians serial untuk item bersiri.
4. Eksport laporan akhir sebagai bukti audit.

---

## Aliran Penyelesaian Masalah

Gunakan aliran keputusan pantas ini apabila pengguna melaporkan isu stock take.

```text
Start
  |
  +-- What is the issue type?
      |
      +-- Scan Issue
      |    |
      |    +-- Item code not recognized?
      |    |    -> Check code exists and item is active
      |    |
      |    +-- Mobile scan not opening?
      |    |    -> Check `SCAN_CODE_MOBILE_VIEW` in Field Settings
      |    |
      |    +-- Add button not visible?
      |         -> Check `HIDE_ADD_BUTTON` in Field Settings
      |
      +-- Serial Issue
      |    |
      |    +-- Save blocked with serial error?
      |    |    -> Ensure qty matches serial count
      |    |
      |    +-- Serial validation failing?
      |         -> Check `ENABLE_VALIDATE_SERIAL`
      |         -> Verify serial belongs to the selected item
      |
      +-- Report Issue
           |
           +-- GENERATE/REGENERATE disabled?
           |    -> Confirm session status is `OPEN`
           |
           +-- Variance lines missing?
           |    -> Regenerate report and check selected report type
           |
           +-- Reason import failed?
                -> Validate Excel template columns (`itemCode`, `TotalQty`, `reason`)
                -> Re-import and review error rows
```

{{< callout type="tip" >}}
Jika isu berterusan selepas aliran ini, tangkap session code, device code, dan tangkapan skrin keadaan ralat sebelum eskalasi.
{{< /callout >}}

---

## FAQ

**Q: Mengapa saya tidak boleh menambah rekod dalam sesi?**  
A: Paling lazim, sesi berada dalam status `CLOSED`. Buka semula workflow/status hanya jika dasar tadbir urus anda membenarkannya.

**Q: Mengapa item bersiri saya gagal disimpan?**  
A: Kemasukan kuantiti dan serial berkemungkinan tidak seimbang, atau satu/lebih nilai serial tidak sah untuk item tersebut.

**Q: Apakah perbezaan antara Variance dan Variance 2?**  
A: Variance menyemak kuantiti dikira terhadap julat min/max yang dikira, manakala Variance 2 membandingkan kuantiti dikira secara terus dengan baki akhir sistem.

**Q: Bolehkah saya rekonsiliasi sebab secara pukal berbanding edit baris demi baris?**  
A: Ya. Gunakan **Upload Reason** untuk mengeksport data laporan, isi kuantiti/sebab dalam Excel, kemudian import.

**Q: Mengapa butang Add tersembunyi dalam mod imbasan?**  
A: `HIDE_ADD_BUTTON` berkemungkinan diaktifkan dalam Field Settings.

**Q: Bagaimana saya masukkan hanya inventori aktif dalam laporan?**  
A: Gunakan penapis jenis laporan dan pilih **Active Items** sebelum menjana/mengeksport.

**Q: Mengapa saya tidak boleh klik GENERATE/REGENERATE dalam tab laporan?**  
A: Penjanaan laporan tersedia hanya semasa sesi berada dalam status `OPEN`.

**Q: Mengapa tiada peranti tersedia untuk peruntukan dalam sesi saya?**  
A: Hanya peranti aktif tersedia. Semak senarai master peranti dan aktifkan peranti yang diperlukan.

**Q: Mengapa item imbasan saya ditandakan tidak sah dalam Scan Form?**  
A: Kod mungkin tidak sepadan dengan tetapan item aktif, atau peraturan pengesahan item/serial sedang menyekatnya.

**Q: Jenis laporan mana patut saya guna: Scanned, Active, atau All Items?**  
A: Guna **Scanned Items** untuk analisis data yang ditangkap sahaja, **Active Items** untuk skop inventori aktif semasa, dan **All Items** untuk liputan rekonsiliasi penuh.

**Q: Bolehkah saya mengedit atau membuang rekod selepas sesi ditutup?**  
A: Tidak. Penutupan sesi direka untuk mengunci suntingan operasi dan memelihara integriti rekonsiliasi.
