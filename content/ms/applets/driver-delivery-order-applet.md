---
title: "Applet Pesanan Penghantaran Pemandu (Driver Delivery Order)"
description: "Aplikasi mikro yang diselaraskan untuk mengurus dan mengemas kini pesanan penghantaran keluar dengan cekap."
tags:
- delivery-management
- driver-app
- logistics
- order-tracking
- status-updates
weight: 70
---

## Tujuan dan Gambaran Keseluruhan

**Driver Delivery Order Applet** adalah aplikasi mikro khusus (sebahagian besarnya dibina di atas komponen Sales Invoice / Outbound Delivery Order sedia ada) yang direka untuk menyatukan aliran kerja penghantaran. Ia memindahkan kerumitan sistem ERP penuh dengan menyediakan antara muka khusus yang dipermudah untuk melihat, mengurus, dan mengemas kini status pesanan penghantaran.

{{< callout type="info" >}}
**Konsep Teras**: Sistem ini menghubungkan **siapa** yang menghantar (Pemandu) dengan **apa** yang perlu dihantar (Pesanan Penghantaran) dan **bagaimana** ia dijejaki (Kemas kini status masa nyata).
{{< /callout >}}

## Gambaran Keseluruhan Ciri-ciri Utama

### Siapa yang Mendapat Manfaat daripada Applet Ini?

**Pemandu & Kakitangan Penghantaran:**
- Antara muka mesra mudah alih yang berfokus, hanya memaparkan maklumat penghantaran yang penting
- Kemas kini status pantas semasa keluar menghantar barangan
- Mengurangkan gangguan visual tanpa lambakan skrin perakaunan jualan yang penuh
- Akses mudah kepada butiran penghantaran dan perancangan laluan

**Penyelaras (Dispatchers) & Staf Logistik:**
- Penjejakan dan pengurusan pesanan penghantaran keluar secara masa nyata
- Keupayaan untuk menetapkan dan menyusun semula jadual penghantaran dengan pantas
- Gambaran keseluruhan yang jelas tentang penghantaran yang belum selesai, sedang transit, dan yang telah selesai
- Komunikasi yang diperkemaskan dengan pemandu

**Pengurusan & Pejabat Belakang (Kewangan & Operasi):**
- Kemas kini status masa nyata yang dipantulkan serta-merta dalam sistem ERP pusat
- Ketepatan dan kebolehpercayaan penjejakan yang ditingkatkan
- Pemberitahuan automatik dan pencetus webook (webhook triggers) apabila penghantaran selesai
- Perkhidmatan pelanggan yang lebih baik melalui maklumat penghantaran yang sentiasa terkini

### Apakah Masalah yang Diselesaikannya?

**Masalah ERP Yang Rumit:**

Sistem ERP tradisional selalunya terlalu sukar untuk anggota di lapangan. Isu lazim termasuk:
- Pemandu menavigasi melepasi skrin jualan dan kewangan yang membebankan
- Kemas kini status yang tertangguh mengakibatkan keterlihatan pelanggan yang lemah
- Kesukaran mengemas kini borang pesanan pada peranti mudah alih
- Salah faham komunikasi antara penyelaras logistik dan juga pemandu
- Risiko keselamatan jika membenarkan akses ERP yang luas kepada kebanyakan pekerja bawahan atau lapangan.

**Penyelesaian Driver Delivery Order Applet:**

- **Antara muka khusus** - Sebuah applet yang tertumpu khusus dalam membina fungsi bagi melancarkan proses aliran kerja sebuah pesanan
- **Penyegerakan masa nyata** - Tindakan memuat naik maklumat daripada pemandu di pantulkan serta-merta pada data ERP sistem
- **Penapisan lanjutan** - Mencari maklumat borang mengikut kriteria sistem seperti cawangan, semakan status atau pengesahan tarikh
- **Kebenaran terperinci** - Tindakan penghadan terhadap mereka (pengguna platform), menapis siapakah yang selayaknya layak mentelaah mahupun merombak fungsi penghantaran di sistem tersebut
- **Status tersuai (Customizable statuses)** - Sesuaikan label-label terma spesifik supaya padan bersama operasi rutin harian

## Gambaran Keseluruhan Ciri-ciri Utama

{{< cards >}}
  {{< card title="Senarai Pesanan Penghantaran Pemandu (Driver Delivery Order Listing)" subtitle="Grid data yang menunjukkan fail senarai penyerahan serta pemuka angka-angka helaian berdaftar." link="#driver-delivery-order-listing" >}}

  {{< card title="Carian & Penapisan Lanjutan (Advanced Search & Filtering)" subtitle="Tapislah berpandukan kategori seperti cawangan mahupun posting status" link="#advanced-search--filtering" >}}

  {{< card title="Suntingan & Kemas Kini Status (Edit & Status Updates)" subtitle="Kemas kini butiran dasar, tilik barang isi dalam dan memugar status kemajuan." link="#edit--status-updates" >}}

  {{< card title="Status Tersuai (Custom Statuses)" subtitle="Mendefinisikan setiap terminologi istilah yang terpakai untuk tujuan penyerahan logistik itu." link="#configuration--settings" >}}

  {{< card title="Integrasi Webhook (Webhook Integrations)" subtitle="Memberi arahan kepada kelakuan aktiviti sewaktu pertukaran status telah dijalankan " link="#configuration--settings" >}}

  {{< card title="Keterlihatan Medan & Pemperibadian (Field Visibility & Personalization)" subtitle="Suai padankan pengalaman optimum untuk seorang pemandu " link="#configuration--settings" >}}

  {{< card title="Pengurusan Kebenaran (Permission Management)" subtitle="Kelolaan spesifik untuk penetapan batasan dokumen fail tugasan." link="#configuration--settings" >}}
{{< /cards >}}

{{< figure src="/images/driver-delivery-applet/driver-delivery-order-overview-infographic.png" alt="Streamlined Deliveries: Your Guide to the Driver Delivery Order Applet - comparing complex ERP challenges with the focused applet solution" caption="Selaraskan Aliran Kerja Penghantaran Anda: Cara Lama (skrin kompleks, kemas kini tertangguh, salah faham komunikasi) vs Cara Baru (mesra mudah alih, penyegerakan masa nyata, penjejakan pantas)." >}}

{{< figure src="/images/driver-delivery-applet/driver-delivery-overview.png" alt="Driver Delivery Order Applet Dashboard Overview" caption="Gambaran Keseluruhan Applet: Paparan komprehensif bagi papan pemuka Driver Delivery Order." >}}

---

## Panduan Mula Pantas (Quick Start Guide)

Mulakan perjalanan aplikasi secara pantas menggunakan contoh-contoh aliran kerja mudah yang disenaraikan di bawah.

### Untuk Penggunaan Pemandu: Menguruskan Kerja-Kerja Penyerahan Anda

**Matlamat:** Paparan fail rujukan tugasan serahan dan mengemaskini status rekod ketika berada di lapangan kerja.

1. **Navigasi**: Pilih tab panel **Driver Delivery Order Listing** menerusi applet menu anda
2. **Cari Pesanan Anda**: 
   - Anda boleh menyemak pandangan paparan susunan senarai default (asal) yang tertuju pada kategori bertanda "Pending" (Tergantung) mahupun "In Transit" (Di dalam Perjalanan)
   - Boleh juga merujuk padang menaip carian bagi memasukkan Nombor Pengecaman Kod Delivery Order yang dibekalkan (Sekiranya Ada)
3. **Semak Butiran Details**: 
   - Klik di atas fail senarai nombor pesan untuk membuka borang layaran (atau klik 'Add' menambahkan maklumat Delivery bersituasi ad-hocs (Serta Merta))

   - Lihat ruang tab **Main Details** mendalami ulasan alamat dan petunjuk berbayar pelanggan 
   - Rujuk ruangan tab **Lines** memastikan komoditi jualan logistik anda
4. **Kemas Kini Status Update**: 
   - Setelah sampai pada pelanggan (atau seandainya mendepani aral rintangan), tekan butang rentap turun **Status** tersebut.
   - Pilihlah mod senarai (Status Tersuai) mengikut keperluan sepadan (contoh: *Delivered*, *Failed*, *Rescheduled*)
5. **Menyimpan**: Tekan punat **Save** sejurus selepas diusulkan pindaan semakannya bagi pengemaskinian pesat di aplikasi back-office (Pengurusan Sistem Belakang)!

**Petua Pro:** Gunakan profil menu panel sidebar yang telah di konfigurasikan peribadi untuk mendapat kemudahan segerak sepantas 'tekanan butang'.

---

### Untuk Penyelaras Logistik: Usaha Susul Kes dan Penyelarasaan Pasukan

**Matlamat:** Memberi pantaun terus dan menyelaras panduan yang kukuh terhadap unit operasi lapangan (pemandu logistik) .

1. **Memantau Ruang Listing**: Lawati masuk muka depan navigasi  **Driver Delivery Order Listing**
2. **Menapis Ikut Aturan Status**: 
   - Kemudahan Search Terperinci (Advanced Search) membolehkan rujukan berdasarkan penampisan  `DEFAULT_POSTING_STATUS`
   - Lebih pantas menemui keseluruhan borang berindikasi "Pending" menggesa atur jalan seliaan
3. **Saringan Melalui Nama-Nama Cabang Rantaian**: Pada situasi memandu mengurus aneka lapangan, tapislah paparan bersandar label Cawangan untuk lebih fokus di ruang kerja tempatan terdekat.
4. **Penjejakan Rapat**: Setiap catatan pengubahsuaian  maklumat di ruangan pemandu akan serta merta berubah pantas dengan memperbaharui ('refreshing') grid supaya status log paparan kelihatan dengan data yang nyata 
5. **Mengendali Ralat Bermasalah**: Pada keadaan supir menyatakan laporan ganjilan (sebagai contoh: pertukaran status meluru bertukar menjadi rentetan log merah *Failed*), dengan sekadar satu picit klik pesanan tersebut, ianya berupaya mengakses liputan dan ruang rujukan bagi pertimbangan tarikh penghantaran masa depan.

---

### Untuk Penggunaan Admin (Pentadbir): Persediaan Peringkat Tetapan Menyeluruh 

**Matlamat:** Strukturisasi applet untuk memandu kelolaan aliran staf lojistik.

**Langkah 3: Urus Cerminan Server Side Permissions** (`Settings > User / Role Permissions`)
Aplikasi memberikan kelegaan terhadap modul berpiawan memelihara sistem kebenaran (Permission modules). Peraturan yang digariskan sama ada melalui hierarki level peranan / pasukan bakal sentiasa menyaring lalu menentukan hak pengguna. Contoh aplikasinya meliputi menghad kebenaran setiap operator pemanduan cuma setakat rujukan lokal operasi mereka dan sekadar menyerah pemerhatian log skop besar pada level pemantauan penyelarasan.

**Langkah 4: Tentukan Format Custom Statuses** (`Settings > Custom Status`)
- Wujudkan tetapan penalaan status mengikut terminologi piawai tugasan seharian logistik anda (Erti umum , "Sedia Diambil" , "Dalam Pengiriman", "Berjaya Dihantar", atau "Gagal Dikirim").

**Langkah 5: Tatacara Percubaan (Test flow)**
- Mulai membina corak borang Pesanan Keluar Outbound Delivery Order ringkas di ruangan pusat utama ERP pelayan web .
- Masuk pada pelayar pemandu dan mempamerkan proses menyusuri pengolahan maklumat terkini pesanan senarai dokumen.
- Rungkaikan adakah log pemanduan ERP sejajar membenarkan mod pertukaran fasa yang di lakar oleh Applet sebentar tadi!.

---

### Carian Lanjutan & Penapisan Tersuai (Advanced Search & Filtering)

**Matlamat:** Kaedah menjumpai rantaian khusus logistik sambil mampu  mengemaskini rekod status carian mendalam berserta kefahaman perangkaan kerja.

1. **Jelmakan Ruang Layar Penapisan**: Perhatikan bahagian panel atas ruangan paparan utama Driver Delivery Order Listing, tekan bukaan Advanced Search (Carian Kehadapan) .
2. **Tapis Menghuruf Cawangan Berantai**: Mahu meneliti laporan cawangan berdaftar pada tapak stesen pusat pengedaran barangan operasi syarikat ?  Anda pilih pada susunan drop down. 
3. **Senaringan Pada Label Kemajuan Peringkat**: Mengguna pakai tatacara rentetan Penapisan label "Posting Status" secara menyempit dan menyekat capaian dapatan semata-mata carian berformat logik "In Transit" untuk pantaun jejak kejayaan.
4. **Kekunci Semakan**: Secara gopoh pantas mencedok dokumen rasmi yang bernotiskan ID yang lengkap demi membantu kelancaran semakan balas panggilan siasatan di jalan.

{{< figure src="/images/driver-delivery-applet/advance-filter.png" alt="Driver Delivery Order Advanced Filtering" caption="Carian Tambahan Maju: Mengendali masalah keciciran maklumat penghantaran tanpa ada isu rumit di masa hadapan." >}}

---

## Konfigurasi Utama & Pilihan Menu Seting Tetapan (Configuration & Settings)

Applet  Driver Delivery Order merintis pada kuasa menyeluruh dari kawalan laluan **Settings menu**. Paparan menu kelola ini dicerakinkan perkelompok mengikut kemunasaban kriteria dan corak pengguna dengan mudah memperkasa suai suana digital staf kerja tersebut .

{{< figure src="/images/driver-delivery-applet/setting-page.png" alt="Driver Delivery Order Settings Page" caption="Tetapan Applet: Kategorisasi penuh kesemua ciri pilihan boleh dikonfigurasi dalam menu paparan navigasi Applet." >}}

### System Configuration
Simbiosis penyatuan dan perubahan kepada perlakuan pada struktur fail.

*   **Application Settings:** Mod kebenaran suis toggle mengelola dasar polisi pembenaran Applet secara sedunia 

{{< figure src="/images/driver-delivery-applet/application-setting-driver-do.png" alt="Application setting for driver delivery order applet" caption="Tetapan Applet : tetapkan kesesuaian ruang pilihan antaramuka bagi melekasi kemudahan menelusuri susur galur applet . " >}}

*   **Default Selection:** Ketapan pengisian kendiri keatas input form tanpa mendesak tenaga logistik kerap berfikir memilih pilihan isi tempat kosong.

{{< figure src="/images/driver-delivery-applet/default-selection.png" alt="Default selection on Driver Delivery Order Applet" caption="Tetapan Applet : Menjurus kepada pendaftar log pusat , menambat dan meletak set kriteria kepada kemudahaan cabang stesen ." >}}

*   **Custom Status:** Kemudahan penyelarasan yang maha penting ! Lakaran perjalanan  kriteria kitar kemajuan bersabit "logistik penyerahan"(cth. `Packing`, `Loading`, `In Transit`, `Delivered`, `Failed Delivery`).

{{< figure src="/images/driver-delivery-applet/custom-status.png" alt="Custom status on Driver Delivery Order Applet" caption="Tetapan Applet: Pihan rujukan merombak parameter bagi memudahkan takrifan spesifikasi status khusus penghantaran syarikat ." >}}

### Server Side Permissions
Kekal memelihara maklumat kepunyaan rahsia anda di dalam mematerikan undang-undang kelayakan terhadap kapasiti "melihat","menyunting" ataupun melenyapkan bukti borang rujukan operasi.

*   **Permission Wizard:** Cepat, Pintas tanpa leceh. Sistem bantu mengemudi bagi kemudahan akses kebenarannya 

{{< figure src="/images/driver-delivery-applet/permission-wizard.png" alt="Permission wizard on Driver Delivery Order Applet" caption="Tetapan Applet : Suatu format bantuan bagi proses pantas menyerat parameter akses kuasa sistem  " >}}

*   **Permission Set:** Perihalkan permohonan berserta rangkuman templet set yang boleh diamalkan pada bila - bila perlunya kelak. 
{{< figure src="/images/driver-delivery-applet/permission-set.png" alt="Permission set on Driver Delivery Order Applet" caption="Tetapan Applet : Pengawal dapat menggunakan modul antaramuka peranti ini untuk diguna pakai menimpa keatas spesifikasi Perincian Kebenaran Pengguna / Peranan . " >}}

*   **User / Role Permission:** Gali lebih lagi! Mengehad dan mengikat kawalan rujukan maklumat setakat di takat lingkungan skop kendiri setiap operator memandu mahupun skop zon stesen pengkalan markaz berdaftar log . 

{{< figure src="/images/driver-delivery-applet/role-permission.png" alt="Role permission on Driver Delivery Order Applet" caption="Tetapan Applet : Fasiliti sistem merangka dan mengekspresikan darjat kawalan skrin peribadi." >}}

### Developer Tools
Kemudakan operasi pentadbir .

*   **Release Notes:** Membolehkan pelayaran penampakan segala isu makluman log-log aktiviti bagi pelbagai ralat-ralat gangguan dalam fasa membaikpulih yang tersiar terbaharu..

{{< figure src="/images/driver-delivery-applet/release-note.png" alt="Release note on Driver Delivery Order Applet" caption="Pelayar menyelia semua maklumat penting pelepasan fasa dan penambahbaikan untuk applet . " >}}

*   **Audit Trail:** Pengesanan aktiviti silam operasi dari fail bersejarah tindakan lampau masa . Melucurkan masalah memikirkan soal jawapan bagi persoalan utama mengenai 'siapakah', 'apakah' yang dirombak oleh sesuatu pertukarkan kedudukan ,  waktu ianya terjadi dengan mudah dan lancar tanpa sebarang gangguan.

{{< figure src="/images/driver-delivery-applet/audit-trail.png" alt="Audit trail on Driver Delivery Order Applet">}}

---

## Soalan Lazim (FAQ)

**S: Adakah pasukan pemandu  mengalami kekangan penggunaan fungsian dan perlu bergantung ke paksi utama sistem pengurusan maklumat operasi kewangan ?**  
J: Tentu sekali, tidak. Faedah khusus Applet murni di dedikasikan dengan motif pengkhususan menyingkir keserabutan paparan kelolaan ERP . Tenaga kerja sektor penghantaran ini dibenarkan terus dan tertumpu memanfaatkan skop capaian Appletnya bagi menyelamatkan data-data pengurusan aset tanpa pening-pening menoleh perkara lain. . 

**S: Terdapat keupayaan pencerapan masa-nyata dalam status pemberitahuan kemajuan bungkusan ?**  
J: Betul tu!. Bertunjangkan kepesatan kemampuan Applet disokong rujukan Outbound Delivery Order (Pesanan Penghantaran Keluar) yang tulen, tanpa prejudis sedikit masalahpun segala kelakuan rekod input para anggota serahan luar lapangan , pasti meluncur tanpa sangkut terpapar sinkroninya (synchronise)  kepada kemaskini kelajuan pada panel rujukan pangkalan simpanan. 

**S: Macam manakah  garis pemisah menghalau perhatian mata para utusan kurier/ pemandu perihal perbelanjaan kos barang jelihatan dalam  lembaran serahan barangan terbabit  ?**  
J: Pasukan urustadbir wajib menghidu kaedahnya dari penjuru aturan Server Side Permissions . Membentuk pengalaman sempel yang terasing selamat menghala ruang terhad lalu merungkaikan segala kemungkinan pendedah atau hingar maklumat tersesat !

**S: Apakah arahan terbaik kepada setiap utusan (Driver) jikalau terdapat peristiwa tolakan barangan yang dipulangkan?**  
J: Wajib mematuhi arahan rantaian pesanan ( Delivery Order ) lalu mengubahsuai catatan  ‘ Custom Status’ kepada kategori kod luar jangka iaitu  "Failed " atau senarai  penolakan  seperti " Rejected " dengan penambahan penjelasan rekod ulasan rasmi didalam kotak ulasan di situ . Dispatcher (Pihak Penyelaras) secara sendirinya mengamati , menelaah , dan menyusul rancangan jadual tarikh pesanan ulangan . 

**S: Bolehkah satu pengasingan yang spesifik hanya semata mewawarkan senarai daftar edisi tugasan pautan cabang lokasi tempatan stesen kerja peribadi diwujudkan pada ruang tapisan ?**  
J: Sudah pasti. Gunakan tapisan (Advanced Search filter ) serta menjodohkan dengan paparan  cawangan Branch . Jika hendakkan corak susulan yang abadi perhatikan atur cara , susun lah " *Personal Default Settings*" buat rujukan yang secara langsung setiap kali menghadap laluan log masuk profil peribadinya . .

**S: Sekiranya kelakuan tidak sengaja akibat kecuaian yang mencatat kesilapan log  perlaksaan pengemaskinian atas nombor rujukan pelanggan ?**
J: Jangan khuatir.! Pemusatan  struktur sistem merekod tindakan aktiviti membolehkan sesiapa yang sah dilantik untuk urusan pantaun di Applet ini  menelusuri dan mencantas  keralatan pemindahan status lalu diperbetulkan log asalnya . Tetaplah di ingati pesanan terpenting agar menyemak nama profil sasaran serahan dengan Nombor kod ID agar kekeliruan membelengu tidak kunjung tiba . 
