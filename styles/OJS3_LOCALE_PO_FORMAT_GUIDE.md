# Panduan Mengubah Label "Mailing Address" di OJS 3 Indonesia

## 📋 Ringkasan

File locale OJS 3 menggunakan format **.po (Portable Object)** bukan XML. Format ini mirip dengan format gettext standar yang digunakan banyak aplikasi PHP. Setiap string terjemahan terdiri dari pasangan `msgid` (kunci) dan `msgstr` (nilai terjemahan).

## 🗂️ Lokasi File-File yang Perlu Diubah

Ada **3 file utama** yang mengandung label "Mailing Address" dalam bahasa Indonesia. Semuanya berada di folder locale `id_ID`:

### 1. **File Utama untuk User Profile** (PRIORITAS)
**Path:** `/lib/pkp/locale/id_ID/user.po`  
**Baris:** 134-135  
**Kunci:** `user.mailingAddress`  
**Terjemahan Saat Ini:** "Alamat Surat Menyurat"  

**Lokasi dalam file:**
```po
msgid "user.mailingAddress"
msgstr "Alamat Surat Menyurat"
```

**Gunakan untuk:** Form profil user, halaman akun, dan setting user address

---

### 2. **File untuk Label Umum**
**Path:** `/lib/pkp/locale/id_ID/common.po`  
**Baris:** 327-328  
**Kunci:** `common.mailingAddress`  
**Terjemahan Saat Ini:** "Alamat Surat Menyurat"  

**Lokasi dalam file:**
```po
msgid "common.mailingAddress"
msgstr "Alamat Surat Menyurat"
```

**Gunakan untuk:** Label umum di berbagai halaman, contact information

---

### 3. **File untuk Subscription/Institusi**
**Path:** `/locale/id_ID/manager.po`  
**Baris:** 1253-1254  
**Kunci:** `manager.subscriptions.form.institutionMailingAddress`  
**Terjemahan Saat Ini:** "Alamat Surat Menyurat"  

**Lokasi dalam file:**
```po
msgid "manager.subscriptions.form.institutionMailingAddress"
msgstr "Alamat Surat Menyurat"
```

**Gunakan untuk:** Form langganan institusi, setting alamat organisasi

---

## 📝 Format File .po - Struktur Dasar

Setiap entry dalam file .po memiliki struktur ini:

```po
# Komentar (opsional)
#: referensi file dimana string digunakan
msgid "kunci.string"
msgstr "Terjemahan dalam bahasa Indonesia"
```

### Contoh Lengkap:
```po
#: lib/pkp/templates/frontend/pages/contact.tpl
#: classes/subscription/InstitutionalSubscription.inc.php
msgid "user.mailingAddress"
msgstr "Alamat Surat Menyurat"
```

### Penjelasan Setiap Bagian:

| Bagian | Arti | Contoh |
|--------|------|--------|
| `#` | Komentar (dimulai dengan `#`) | `# Author:` |
| `#:` | Referensi file (dimulai dengan `#:`) | `#: lib/pkp/templates/user.tpl` |
| `msgid` | Kunci string unik | `"user.mailingAddress"` |
| `msgstr` | Terjemahan | `"Alamat Surat Menyurat"` |

---

## ✏️ Cara Mengubah Teks Dengan Aman

### LANGKAH 1: Buka File dengan Text Editor

**File 1: user.po**
```
Buka: /lib/pkp/locale/id_ID/user.po
```

**File 2: common.po**
```
Buka: /lib/pkp/locale/id_ID/common.po
```

**File 3: manager.po**
```
Buka: /locale/id_ID/manager.po
```

### LANGKAH 2: Cari Kunci yang Tepat

Gunakan **Find/Search** di editor (Ctrl+F atau Cmd+F):

**Untuk user profile:**
```
Cari: msgid "user.mailingAddress"
```

**Untuk label umum:**
```
Cari: msgid "common.mailingAddress"
```

**Untuk institusi:**
```
Cari: msgid "manager.subscriptions.form.institutionMailingAddress"
```

### LANGKAH 3: Edit Hanya Bagian `msgstr`

**❌ JANGAN UBAH:**
```po
msgid "user.mailingAddress"  ← JANGAN UBAH INI!
msgstr "..."
```

**✅ UBAH HANYA:**
```po
msgid "user.mailingAddress"
msgstr "Alamat Korespondensi Kantor Redaksi"  ← UBAH INI
```

### LANGKAH 4: Simpan File

- **Encoding:** UTF-8 (PENTING!)
- **Format:** Plain text (.po)
- **Jangan tambahkan karakter khusus** di luar string

---

## 🔄 Contoh Perubahan Lengkap

### Contoh Sebelum:
```po
msgid "user.mailingAddress"
msgstr "Alamat Surat Menyurat"
```

### Contoh Sesudah:
```po
msgid "user.mailingAddress"
msgstr "Alamat Korespondensi Kantor Redaksi"
```

---

## ⚠️ ATURAN PENTING - Jangan Lakukan Ini!

### ❌ SALAH 1: Menghapus msgid
```po
# ❌ JANGAN!
# msgid "user.mailingAddress"
msgstr "Alamat Korespondensi Kantor Redaksi"
```

### ❌ SALAH 2: Mengubah Struktur Baris
```po
# ❌ JANGAN!
msgid "user.mailingAddress" msgstr "Alamat Korespondensi Kantor Redaksi"
```

### ❌ SALAH 3: Menghapus Kutip
```po
# ❌ JANGAN!
msgid user.mailingAddress
msgstr Alamat Korespondensi Kantor Redaksi
```

### ❌ SALAH 4: Menambah Spasi Berlebih
```po
# ❌ JANGAN!
msgid "user.mailingAddress"
msgstr   "Alamat Korespondensi Kantor Redaksi"
```

### ✅ BENAR: Format yang Tepat
```po
# Komentar (opsional)
msgid "user.mailingAddress"
msgstr "Alamat Korespondensi Kantor Redaksi"
```

---

## 🎯 Skenario Penggunaan

### Skenario 1: Hanya Ubah untuk User Profile
**Ubah file:** `/lib/pkp/locale/id_ID/user.po`
```po
msgid "user.mailingAddress"
msgstr "Alamat Korespondensi Kantor Redaksi"
```

### Skenario 2: Ubah Semua Label "Mailing Address"
**Ubah 3 file:**
1. `/lib/pkp/locale/id_ID/user.po` → `user.mailingAddress`
2. `/lib/pkp/locale/id_ID/common.po` → `common.mailingAddress`
3. `/locale/id_ID/manager.po` → `manager.subscriptions.form.institutionMailingAddress`

### Skenario 3: Ubah Hanya untuk Institusi
**Ubah file:** `/locale/id_ID/manager.po`
```po
msgid "manager.subscriptions.form.institutionMailingAddress"
msgstr "Alamat Korespondensi Kantor Redaksi"
```

---

## 🔍 Verifikasi Perubahan

### Cek 1: Buka File di Text Editor
Pastikan:
- ✅ `msgid` tidak berubah
- ✅ `msgstr` sudah berubah ke teks baru
- ✅ Tanda kutip masih ada di awal & akhir
- ✅ File tersimpan sebagai UTF-8

### Cek 2: Verifikasi di Terminal
```bash
# Cek encoding file
file /lib/pkp/locale/id_ID/user.po
# Output: UTF-8 Unicode text

# Cek syntax sederhana (grep)
grep "Alamat Korespondensi Kantor Redaksi" /lib/pkp/locale/id_ID/user.po
# Harusnya muncul baris yang ada msgstr-nya
```

### Cek 3: Bersihkan Cache OJS
Setelah mengubah file locale, harus bersihkan cache:
1. **Via Admin Panel:** Website Settings → Clear Cache
2. **Via Terminal:**
   ```bash
   rm -rf /cache/fc-locale-*.php
   ```

### Cek 4: Verifikasi di Frontend
1. Login ke OJS
2. Buka halaman yang menampilkan "Mailing Address"
3. Refresh page (Ctrl+F5)
4. Lihat apakah teks sudah berubah

---

## 📍 Dimana Muncul di OJS?

### "Mailing Address" Muncul di:

1. **User Profile Page** → `user.mailingAddress`
   - Website URL: `/user/profile`
   - Form input: User dapat mengisi alamat mereka

2. **Contact Information** → `common.mailingAddress`
   - Website URL: `/about/contact`
   - Halaman kontak umum, informasi organisasi

3. **Subscription Management** → `manager.subscriptions.form.institutionMailingAddress`
   - Website URL: `/management/subscriptions`
   - Form untuk mengisi alamat institusi pelanggan

---

## 🛠️ Tools untuk Edit File .po

### Rekomendasi Editor:

1. **VS Code** (Recommended)
   - Install extension: "i18n Ally" atau "Gettext"
   - Syntax highlighting untuk .po files
   - Easy find & replace

2. **Sublime Text 3**
   - Built-in support untuk .po files
   - Find & replace yang powerful

3. **GNU Poedit**
   - Aplikasi desktop khusus untuk mengedit .po files
   - User-friendly GUI
   - Download: https://poedit.net/

4. **Terminal/Command Line**
   ```bash
   # Edit dengan nano
   nano /lib/pkp/locale/id_ID/user.po
   
   # Edit dengan vi/vim
   vi /lib/pkp/locale/id_ID/user.po
   
   # Edit dengan sed (dangerous, gunakan dengan hati-hati!)
   sed -i 's/msgstr "Alamat Surat Menyurat"/msgstr "Alamat Korespondensi Kantor Redaksi"/g' /lib/pkp/locale/id_ID/user.po
   ```

---

## 📊 Perbandingan Format: .po vs XML

### Format .po (OJS 3 - Current)
```po
msgid "user.mailingAddress"
msgstr "Alamat Surat Menyurat"
```

### Format XML (Jika Ada)
```xml
<message key="user.mailingAddress">
  <translation locale="id_ID">Alamat Surat Menyurat</translation>
</message>
```

**Catatan:** OJS 3 menggunakan `.po`, bukan XML. File XML hanya digunakan untuk konfigurasi sistem (genres.xml, emailTemplates.xml, dll).

---

## ❓ FAQ - Pertanyaan Umum

### Q1: Apakah ada file XML locale di OJS 3?
**A:** Tidak. OJS 3 menggunakan format `.po` (Portable Object) sepenuhnya. File XML hanya untuk konfigurasi, bukan locale strings.

### Q2: Bagaimana jika saya mengubah msgid?
**A:** Jangan lakukan! OJS menggunakan `msgid` sebagai kunci referensi di code. Jika diubah, sistem tidak akan menemukan terjemahan.

### Q3: Berapa banyak file yang harus saya ubah?
**A:** Minimum 1 file (tergantung kebutuhan Anda). Jika ingin semua label "Mailing Address" berubah, ubah 3 file.

### Q4: Apa yang terjadi jika cache tidak dihapus?
**A:** OJS mungkin masih menampilkan terjemahan lama karena file cache `.php` tidak ter-update.

### Q5: Dapatkah saya mengedit file dari web browser?
**A:** Tidak disarankan. Gunakan FTP client atau SSH terminal untuk edit file server.

### Q6: Apakah perubahan akan hilang saat update OJS?
**A:** Bisa. Jika Anda update OJS ke versi baru, file locale mungkin akan di-overwrite. Backup terlebih dahulu sebelum update.

---

## 💾 Backup Sebelum Mengubah

Selalu buat backup sebelum mengedit file locale:

```bash
# Backup 3 file sebelum mengubah
cp /lib/pkp/locale/id_ID/user.po /lib/pkp/locale/id_ID/user.po.backup
cp /lib/pkp/locale/id_ID/common.po /lib/pkp/locale/id_ID/common.po.backup
cp /locale/id_ID/manager.po /locale/id_ID/manager.po.backup
```

Jika ada kesalahan, restore dengan:
```bash
cp /lib/pkp/locale/id_ID/user.po.backup /lib/pkp/locale/id_ID/user.po
```

---

## 🚀 Ringkasan Langkah-Langkah Cepat

1. **Buka file** `/lib/pkp/locale/id_ID/user.po`
2. **Cari** `msgid "user.mailingAddress"`
3. **Ubah** `msgstr "Alamat Surat Menyurat"` menjadi `msgstr "Alamat Korespondensi Kantor Redaksi"`
4. **Simpan** file (UTF-8)
5. **Bersihkan cache**: Hapus folder `/cache/fc-locale-*.php`
6. **Refresh browser** untuk verifikasi

---

**Terakhir diupdate:** May 2, 2026  
**OJS Version:** 3.x  
**Format Locale:** .po (Portable Object)
