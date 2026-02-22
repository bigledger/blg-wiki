---
title: "Applet Job Order Dalaman"
description: "Sistem perancangan dan pemantauan pengeluaran untuk menguruskan job order, proses, dan integrasi jualan"
tags:
  - perancangan-pengeluaran
  - job-order
  - integrasi-sales-order
  - pemantauan-kilang
  - penjejakan-proses
weight: 70
---

## Tujuan dan Gambaran Keseluruhan

**Applet Job Order Dalaman** adalah penyelesaian komprehensif untuk perancangan dan pemantauan pengeluaran. Ia berfungsi sebagai penghubung antara permintaan jualan dan pelaksanaan kilang, membolehkan pasukan menukar sales order menjadi permintaan pengeluaran yang boleh diambil tindakan sambil menjejak setiap peringkat proses pembuatan.

{{< callout type="info" >}}
**Konsep Teras**: Sistem ini menukar **permintaan pelanggan** (Sales Order) menjadi **tugasan pengeluaran** (Job Order) melalui **aliran kerja** (Proses) yang telah ditetapkan.
{{< /callout >}}

### Siapa yang Mendapat Manfaat daripada Applet Ini?

**Pasukan Jualan:**

- Menukar sales order kepada permintaan pengeluaran secara merta
- Kelihatan status pengeluaran masa nyata untuk kemas kini pelanggan
- Anggaran masa mendahulu (lead time) yang tepat berdasarkan beban semasa
- Pemberitahuan automatik apabila pengeluaran selesai

**Pengurus Pengeluaran & Ketua Jabatan (HOD):**

- Peruntukan sumber dan pusat kerja yang cekap
- Mengenal pasti kesesakan (bottlenecks) dalam barisan pengeluaran
- Pengawasan lengkap terhadap job order yang belum selesai
- Perancangan kapasiti berasaskan data

**Kakitangan Kilang & Lantai Kerja:**

- Arahan yang jelas mengenai proses dan urutan
- Pelaporan status yang dipermudahkan untuk setiap peringkat pengeluaran
- Akses kepada spesifikasi induk yang terperinci
- Pengurangan kerja kertas manual dan ralat komunikasi

### Apakah Masalah yang Diselesaikan?

**Masalah Jurang Komunikasi:**

Penjejakan pengeluaran tradisional bergantung pada papan putih dan hamparan (spreadsheets). Isu biasa termasuk:

- Sales order hilang semasa peralihan ke pengeluaran
- Status pesanan pelanggan yang mendesak tidak jelas
- Pusat kerja yang terlalu sarat kerana kurangnya penglihatan
- Penjejakan manual yang membawa kepada ralat data
- Kesukaran mengenal pasti punca kelewatan pengeluaran

**Penyelesaian Job Order Dalaman:**

- **Integrasi Lancar** - Hubungkan pengeluaran terus ke sales order
- **Proses Pra-tetap** - Pastikan kualiti dengan mengikuti langkah kilang yang standard
- **Pemantauan Masa Nyata** - Kemas kini status segera dari lantai kilang
- **Tarikh Akhir & Keutamaan** - Penglihatan jelas tentang apa yang perlu diselesaikan dahulu
- **Pelaporan Terperinci** - Laporan tunggakan yang komprehensif untuk mengelakkan timbunan pesanan

## Gambaran Keseluruhan Ciri Utama

{{< cards >}}
{{< card title="Senarai Induk" subtitle="Urus pusat kerja dan sumber" link="#master-list" >}}

{{< card title="Proses" subtitle="Tentukan peringkat pengeluaran dan aliran kerja" link="#processes" >}}

{{< card title="Sales Order" subtitle="Pantau permintaan jualan bersepadu" link="#sales-order" >}}

{{< card title="Permintaan Pengeluaran" subtitle="Mulakan dan jejak tugas pembuatan" link="#production-request" >}}

{{< card title="Laporan Tunggakan" subtitle="Kenal pasti pesanan tertunda dan lewat" link="#outstanding-report" >}}
{{< /cards >}}

{{< figure src="/images/internal-job-order-applet/internal-job-order-overview-infographic.png" alt="Infografik Gambaran Keseluruhan Applet Job Order Dalaman" caption="Gambaran visual tentang cabaran, penyelesaian, dan manfaat pengguna Applet Job Order Dalaman." >}}

---

## Konsep Utama

### Memahami Rangka Kerja Pengeluaran

Setiap sistem pengeluaran mesti menangani tiga aspek asas. Applet Job Order Dalaman menyediakan pengendalian berstruktur:

| Aspek                      | Komponen                  | Contoh Praktikal                          |
| -------------------------- | ------------------------- | ----------------------------------------- |
| **Siapa** yang meminta?    | Sales Order / Pelanggan   | Pelanggan Runcit, Pengedar Borong         |
| **Apa** yang dibuat?       | Induk (SKU) & Pusat Kerja | Bahagian Keluli A, Pusat Kisar 1          |
| **Bagaimana** ia diproses? | Proses & Job Order        | Pemasangan 3 peringkat, Pembuatan tersuai |

{{< callout type="tip" >}}
**Nota Teknikal**: Sistem menjejak pengeluaran aktif melalui struktur data `JobOrderMain`, memastikan medan seperti `jobOrderNo`, `itemCode`, dan `completionDate` dikekalkan sepanjang kitaran hayat.
{{< /callout >}}

### Struktur Hierarki Pengeluaran

Fikirkan proses pengeluaran sebagai aliran berstruktur:

```
Kilang Pembuatan
│
├── Sumber (Senarai Induk) ──→ APA yang sedang digunakan?
│   │
│   └── Proses ──→ BAGAIMANA ia dibuat?
│       │
│       └── Job Order ──→ Tugasan pengeluaran SPESIFIK
│           │
│           └── Kemas Kini Status ──→ Penjejakan kemajuan SEMASA
│
└── Integrasi Jualan ──→ MENGAPA ia dihasilkan?
```

### "Triniti Pengeluaran"

Untuk menguruskan sistem dengan berkesan, adalah penting untuk memahami bagaimana **Induk**, **Proses**, dan **Job Order** bekerjasama.

| Komponen      | Analogi          | Definisi                                                  | Contoh                         |
| ------------- | ---------------- | --------------------------------------------------------- | ------------------------------ |
| **Master**    | "Pelan Tindakan" | Spesifikasi teknikal item atau sumber.                    | **Mesin CNC 01**               |
| **Process**   | "Resipi"         | Urutan langkah yang diperlukan untuk menyelesaikan kerja. | **Penggerudian → Penggilapan** |
| **Job Order** | "Tugasan Aktif"  | Contoh sebenar pengeluaran yang diminta untuk pelanggan.  | **Job #882 - 500 unit**        |

**Bagaimana ia dihubungkan:**

1. Anda tentukan **Senarai Induk** (mesin, pusat, dan alatan).
2. Anda cipta templat **Proses** menggunakan induk tersebut.
3. Anda hasilkan **Job Order** (melalui Permintaan Pengeluaran) yang mengikuti Proses tersebut.
4. Sistem menjejak Job Order terhadap peringkat Proses untuk melaporkan kemajuan masa nyata.

---

## Panduan Mula Pantas

Mulakan kerja dengan aliran kerja pengeluaran yang penting.

### Untuk Pasukan Jualan: Meminta Pengeluaran

**Matlamat:** Tukar pesanan pelanggan menjadi tugasan pengeluaran dalam 4 langkah.

1. **Cari Permintaan**: Pergi ke **Sales Order** dari bar sisi
2. **Pilih Pesanan**: Cari baris sales order yang diluluskan (ditapis untuk item yang memerlukan pengeluaran)
3. **Tentukan Butiran**: Pilih kuantiti yang diperlukan dan tetapkan `completionDate`
4. **Hantar**: Klik **Hasilkan Job Order** → Pasukan pengeluaran akan dimaklumkan dengan segera

{{< figure src="/images/internal-job-order-applet/job-order-form.png" alt="Borang Cipta/Edit Job Order" caption="Borang Job Order: Tentukan kuantiti pengeluaran, tarikh siap, dan keperluan QC." >}}

---

### Untuk Pasukan Pengeluaran: Memantau Kemajuan

**Matlamat:** Kemas kini dan jejak status tugas aktif dalam 3 langkah.

1. **Lihat Tugas**: Pergi ke papan pemuka **Permintaan Pengeluaran**
2. **Kemas Kini Proses**: Apabila kerja fizikal selesai, kemas kini **Status Proses** (cth., "In Progress" → "QC Output")
3. **Lengkapkan Tugas**: Setelah semua peringkat selesai, tanda tugas sebagai tamat untuk memaklumkan bahagian Jualan

{{< figure src="/images/internal-job-order-applet/production-request-listing.png" alt="Papan Pemuka Permintaan Pengeluaran" caption="Senarai Permintaan Pengeluaran: Gunakan carian lanjutan dan togol lajur untuk menjejak job order yang aktif." >}}

---

### Untuk Admin: Persediaan Awal Sistem

**Matlamat:** Konfigurasi persekitaran pengeluaran dalam 4 langkah.

1. **Sediakan Induk**: Tentukan sumber lantai kilang anda dalam **Senarai Induk**
2. **Bina Proses**: Cipta aliran kerja pengeluaran (ID Langkah, urutan, dan tempoh) dalam **Proses**
3. **Konfigurasi Tetapan**: Sediakan parameter global, status tersuai, dan keterlihatan medan dalam `Tetapan`
4. **Uji Aliran**: Cipta sales order dummy dan sahkan pencetus permintaan pengeluaran berfungsi dengan betul

{{< figure src="/images/internal-job-order-applet/settings-page.png" alt="Tetapan Konfigurasi Pengeluaran" caption="Konfigurasi & Tetapan: Tentukan sandaran proses, status tersuai, dan dokumen boleh cetak." >}}

---

## Bahagian Ciri

### Senarai Induk

Asas sistem pengeluaran anda. Di sini anda menentukan "infrastruktur" kilang anda, termasuk **Pusat Kerja**, **Jenis Sumber**, dan **Pilihan Mesin**. Ia berfungsi sebagai pendaftaran induk untuk semua aset pengeluaran.

{{< figure src="/images/internal-job-order-applet/master-list.png" alt="Pengurusan Senarai Induk" caption="Senarai Induk: Urus pusat kerja, sumber, dan infrastruktur pengeluaran." >}}

### Proses

Tentukan urutan langkah demi langkah untuk pembuatan anda. Anda boleh mencipta templat proses yang berbeza (cth., "Pembuatan Standard" vs "Pemasangan Pantas") dan menghubungkannya dengan pilihan mesin tertentu untuk penjadualan automatik.

{{< figure src="/images/internal-job-order-applet/processes-page.png" alt="Halaman Proses Pengeluaran" caption="Proses: Seragamkan peringkat pengeluaran, tempoh masa, dan urutan sumber." >}}

### Sales Order

Paparan bersepadu bagi semua permintaan jualan. Modul ini menapis baris sales order yang memerlukan pembuatan, membolehkan anda menjejak mana-mana job order kembali kepada perjanjian pelanggan yang spesifik.

{{< figure src="/images/internal-job-order-applet/sales-order-list.png" alt="Paparan Bersepadu Sales Order" caption="Senarai Sales Order: Pantau permintaan pelanggan dan mulakan permintaan pengeluaran." >}}

### Laporan Tunggakan

Alat utama anda untuk pengesanan kesesakan (bottleneck). Ia menyenaraikan semua pesanan yang telah melepasi `completionDate` atau terhenti dalam `process_status` tertentu terlalu lama, membolehkan pengurusan proaktif terhadap kelewatan kilang.

{{< figure src="/images/internal-job-order-applet/outstanding-report.png" alt="Laporan Pengeluaran Tunggakan" caption="Laporan Tunggakan: Kenal pasti kelewatan dan pantau job order yang belum selesai mengikut jabatan atau cawangan." >}}

### Jejak Audit & Log

#### Applet Log (`Tetapan > Applet Log`)

Audit Trail adalah "kotak hitam" sistem anda—log komprehensif bagi setiap tindakan yang diambil.

| Tindakan   | Penerangan                            | Contoh                                      |
| ---------- | ------------------------------------- | ------------------------------------------- |
| **CREATE** | Permintaan pengeluaran baru dimulakan | Pengguna A mencipta Job #JO-2024-001        |
| **UPDATE** | Status proses atau kuantiti diubah    | Tarikh siap dipindahkan ke 2024-12-15       |
| **DELETE** | Induk atau Proses dialih keluar       | Sumber "Pusat 01" dialih keluar dari sistem |

---

## FAQ

**S: Bolehkah saya membatalkan Job Order setelah ia dimulakan?**
J: Ya, asalkan ia belum mencapai peringkat "QC Akhir". Pembatalan akan mencetuskan pemberitahuan automatik kepada Wakil Jualan yang berkaitan.

**S: Apa yang berlaku jika kuantiti pengeluaran melebihi sales order?**
J: Sistem membolehkan "Pengeluaran Berlebihan" jika dibenarkan dalam tetapan medan. Lebihan `adHocQty` biasanya dijejak secara berasingan atau dipindahkan ke stok penimbal.

**S: Bolehkah satu Sales Order menghasilkan berbilang Job Order?**
J: Ya. Anda boleh membahagikan satu sales order besar kepada berbilang job order yang lebih kecil untuk mengedarkan kerja merentasi pusat kerja atau mesin yang berbeza.

**S: Bagaimana saya memberi keutamaan kepada pesanan yang mendesak?**
J: Gunakan penanda "Priority" semasa penciptaan Job Order. Ini menyerlahkan tugasan dalam papan pemuka Permintaan Pengeluaran untuk perhatian segera.

**S: Di mana saya boleh melihat sejarah status tugasan yang telah diubah?**
J: Semak **Log Applet** dalam Tetapan untuk rekod sejarah penuh semua peralihan keadaan dan tindakan pengguna.

**S: Mengapa saya tidak dapat melihat Mesin tertentu dalam senarai proses?**
J: Pastikan mesin tersebut telah ditakrifkan dalam **Senarai Induk** dan statusnya ditetapkan sebagai "Aktif".
