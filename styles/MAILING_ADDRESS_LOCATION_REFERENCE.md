# File Referensi: Lokasi Kunci "Mailing Address" di OJS 3

## 📍 File #1: User Mailing Address
**Path:** `/lib/pkp/locale/id_ID/user.po`  
**Baris:** 134-135  
**Kunci:** `user.mailingAddress`

### Format .po:
```po
msgid "user.mailingAddress"
msgstr "Alamat Surat Menyurat"
```

### Ubah Menjadi:
```po
msgid "user.mailingAddress"
msgstr "Alamat Korespondensi Kantor Redaksi"
```

### Konteks: Digunakan di mana?
- Form profil user (User Profile Page)
- Setting alamat user
- Halaman akun pengguna
- Field input untuk alamat surat menyurat user

### Contoh di OJS:
```
Website Settings → Users & Roles → Users → Edit User → [Mailing Address field]
```

---

## 📍 File #2: Common Mailing Address
**Path:** `/lib/pkp/locale/id_ID/common.po`  
**Baris:** 327-328  
**Kunci:** `common.mailingAddress`

### Format .po:
```po
msgid "common.mailingAddress"
msgstr "Alamat Surat Menyurat"
```

### Ubah Menjadi:
```po
msgid "common.mailingAddress"
msgstr "Alamat Korespondensi Kantor Redaksi"
```

### Konteks: Digunakan di mana?
- Label umum di berbagai halaman
- Informasi kontak organisasi
- Halaman About/Contact
- Footer dan contact information

### Contoh di OJS:
```
Website Settings → Contact → [Mailing Address field]
```

---

## 📍 File #3: Institution Mailing Address (Subscription)
**Path:** `/locale/id_ID/manager.po`  
**Baris:** 1253-1254  
**Kunci:** `manager.subscriptions.form.institutionMailingAddress`

### Format .po:
```po
msgid "manager.subscriptions.form.institutionMailingAddress"
msgstr "Alamat Surat Menyurat"
```

### Ubah Menjadi:
```po
msgid "manager.subscriptions.form.institutionMailingAddress"
msgstr "Alamat Korespondensi Kantor Redaksi"
```

### Konteks: Digunakan di mana?
- Form langganan institusi
- Management subscription
- Setting alamat organisasi pelanggan
- Institutional subscriber information

### Contoh di OJS:
```
Website Settings → Subscriptions → Institutional Subscriptions → [Mailing Address field]
```

---

## 🔧 Struktur .po File Lengkap

Setiap entry dalam file .po biasanya memiliki konteks tambahan:

### Contoh File user.po (Baris 130-145):
```po
#: lib/pkp/templates/frontend/pages/contact.tpl
#: classes/subscription/InstitutionalSubscription.inc.php
msgid "user.mailingAddress"
msgstr "Alamat Surat Menyurat"

msgid "user.myAccount"
msgstr "Akun Saya"

msgid "user.name"
msgstr "Nama"

msgid "user.password"
msgstr "Kata Sandi"
```

### Penjelasan:
- `#:` = Referensi file tempat string digunakan (untuk bantuan developer)
- `msgid` = Kunci unik (JANGAN DIUBAH)
- `msgstr` = Terjemahan dalam bahasa Indonesia (UBAH INI)

---

## 🎯 Pilih File yang Sesuai Kebutuhan

### Opsi A: Ubah Hanya User Address
**File yang diubah:** File #1 saja  
**Lokasi file:** `/lib/pkp/locale/id_ID/user.po`

```po
msgid "user.mailingAddress"
msgstr "Alamat Korespondensi Kantor Redaksi"
```

---

### Opsi B: Ubah Hanya Label Umum
**File yang diubah:** File #2 saja  
**Lokasi file:** `/lib/pkp/locale/id_ID/common.po`

```po
msgid "common.mailingAddress"
msgstr "Alamat Korespondensi Kantor Redaksi"
```

---

### Opsi C: Ubah Hanya Institusi/Subscription
**File yang diubah:** File #3 saja  
**Lokasi file:** `/locale/id_ID/manager.po`

```po
msgid "manager.subscriptions.form.institutionMailingAddress"
msgstr "Alamat Korespondensi Kantor Redaksi"
```

---

### Opsi D: Ubah Semua (RECOMMENDED)
**File yang diubah:** Ketiga file (#1, #2, #3)

Ubah ketiga file dengan msgstr yang sama:
```po
msgstr "Alamat Korespondensi Kantor Redaksi"
```

---

## ✅ Checklist Sebelum Mengubah

- [ ] Buat backup file original
- [ ] Tentukan pilihan (A, B, C, atau D)
- [ ] Cari file dengan path yang tepat
- [ ] Temukan baris yang benar
- [ ] Edit HANYA bagian `msgstr` (JANGAN ubah `msgid`)
- [ ] Pastikan encoding UTF-8
- [ ] Simpan file
- [ ] Bersihkan cache OJS
- [ ] Test di frontend browser

---

## 🔄 Proses Lengkap untuk Ubah File

### Step 1: Cari File
```
Buka File Manager atau FTP Client
Navigasi ke: /lib/pkp/locale/id_ID/user.po
```

### Step 2: Edit File
**Gunakan Text Editor** (VS Code, Sublime, Notepad++, dsb):
1. Buka file `user.po`
2. Tekan Ctrl+F (Find)
3. Cari: `msgid "user.mailingAddress"`
4. Edit baris `msgstr` di bawahnya
5. Ubah dari: `msgstr "Alamat Surat Menyurat"`
6. Ubah ke: `msgstr "Alamat Korespondensi Kantor Redaksi"`

### Step 3: Simpan File
- Format: Plain Text (.po)
- Encoding: UTF-8 (PENTING!)
- Klik Save

### Step 4: Bersihkan Cache
Hapus file cache OJS:
```bash
# Via terminal/SSH
rm -rf /Applications/XAMPP/xamppfiles/htdocs/ojs/cache/fc-locale-*.php
```

Atau via OJS Admin:
1. Login Website Settings
2. Buka: Website Settings → Appearance
3. Klik "Clear Cache"

### Step 5: Verifikasi
1. Refresh browser (Ctrl+F5)
2. Cek halaman yang menampilkan label
3. Pastikan teks sudah berubah

---

## ⚠️ Error yang Mungkin Terjadi

### Error 1: "File tidak ditemukan"
**Penyebab:** Path salah
**Solusi:** Pastikan path absolut benar sesuai instalasi Anda

### Error 2: "Perubahan tidak muncul di website"
**Penyebab:** Cache belum dihapus
**Solusi:** Hapus folder cache dan clear browser cache (Ctrl+Shift+Del)

### Error 3: "File tidak bisa disimpan"
**Penyebab:** Permission denied
**Solusi:** Check file permission atau gunakan FTP client dengan privilege yang tepat

### Error 4: "Karakter tidak muncul dengan benar"
**Penyebab:** Encoding bukan UTF-8
**Solusi:** Set encoding editor ke UTF-8 sebelum save

---

## 📋 Perbandingan Format Locale di Berbagai Versi

### OJS 2.x (Lama)
```xml
<!-- Menggunakan XML -->
<locale name="locale" key="user.mailingAddress">
  <message locale="id_ID">Alamat Surat Menyurat</message>
</locale>
```

### OJS 3.x (Current) ← Anda di sini
```po
# Menggunakan .po (Portable Object)
msgid "user.mailingAddress"
msgstr "Alamat Surat Menyurat"
```

### OJS 4.x (Future)
```po
# Masih menggunakan .po format
msgid "user.mailingAddress"
msgstr "Alamat Surat Menyurat"
```

---

## 📞 Support & Resources

- **OJS Documentation:** https://docs.pkp.sfu.ca/
- **OJS Localization Guide:** https://docs.pkp.sfu.ca/localization/en/
- **File Format Specs:** https://www.gnu.org/software/gettext/manual/gettext.html

---

**Generated:** May 2, 2026  
**OJS Version:** 3.x  
**Locale Format:** .po (Portable Object / Gettext)
