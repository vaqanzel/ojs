# Panduan Cepat: Mengubah "Mailing Address" - Contoh Praktis

## 🎯 Quick Summary

OJS 3 menggunakan file **`.po`** (bukan XML) untuk locale/terjemahan. File-nya berlokasi di:

| Keperluan | File | Baris | Kunci |
|-----------|------|-------|-------|
| User Profile | `/lib/pkp/locale/id_ID/user.po` | 134 | `user.mailingAddress` |
| Label Umum | `/lib/pkp/locale/id_ID/common.po` | 327 | `common.mailingAddress` |
| Institusi | `/locale/id_ID/manager.po` | 1253 | `manager.subscriptions.form.institutionMailingAddress` |

---

## 📖 Struktur File .po - Contoh Real

### Sebelum Perubahan:
```po
#: lib/pkp/classes/user/User.inc.php
#: lib/pkp/templates/user/profile/form.tpl
msgid "user.mailingAddress"
msgstr "Alamat Surat Menyurat"

msgid "user.myAccount"
msgstr "Akun Saya"
```

### Sesudah Perubahan:
```po
#: lib/pkp/classes/user/User.inc.php
#: lib/pkp/templates/user/profile/form.tpl
msgid "user.mailingAddress"
msgstr "Alamat Korespondensi Kantor Redaksi"  ← UBAH INI

msgid "user.myAccount"
msgstr "Akun Saya"
```

---

## ⚡ Cara Cepat Edit via Terminal

### Option 1: Menggunakan sed (Recommended untuk bulk change)

```bash
# BACKUP DULU!
cp /lib/pkp/locale/id_ID/user.po /lib/pkp/locale/id_ID/user.po.backup
cp /lib/pkp/locale/id_ID/common.po /lib/pkp/locale/id_ID/common.po.backup
cp /locale/id_ID/manager.po /locale/id_ID/manager.po.backup

# Edit File 1: user.po
sed -i '/msgid "user.mailingAddress"/,/msgstr/{s/msgstr ".*"/msgstr "Alamat Korespondensi Kantor Redaksi"/}' /lib/pkp/locale/id_ID/user.po

# Edit File 2: common.po
sed -i '/msgid "common.mailingAddress"/,/msgstr/{s/msgstr ".*"/msgstr "Alamat Korespondensi Kantor Redaksi"/}' /lib/pkp/locale/id_ID/common.po

# Edit File 3: manager.po
sed -i '/msgid "manager.subscriptions.form.institutionMailingAddress"/,/msgstr/{s/msgstr ".*"/msgstr "Alamat Korespondensi Kantor Redaksi"/}' /locale/id_ID/manager.po
```

### Option 2: Menggunakan nano (Interactive editor)

```bash
# Edit file 1
nano /lib/pkp/locale/id_ID/user.po
# Tekan Ctrl+W → cari "user.mailingAddress"
# Edit msgstr-nya
# Tekan Ctrl+X → Y → Enter untuk simpan

# Edit file 2
nano /lib/pkp/locale/id_ID/common.po
# (sama dengan di atas)

# Edit file 3
nano /locale/id_ID/manager.po
# (sama dengan di atas)
```

### Option 3: Menggunakan vi/vim (Advanced)

```bash
# Edit file 1
vi /lib/pkp/locale/id_ID/user.po
# Tekan / → ketik: user.mailingAddress
# Tekan Enter → j (down) → i (insert mode)
# Edit msgstr
# Tekan Esc → :wq (write and quit)
```

---

## 🔍 Verifikasi Sebelum & Sesudah

### Verifikasi Sebelum Edit:
```bash
# Cek isi file
grep -A 1 'msgid "user.mailingAddress"' /lib/pkp/locale/id_ID/user.po
# Output:
# msgid "user.mailingAddress"
# msgstr "Alamat Surat Menyurat"
```

### Verifikasi Sesudah Edit:
```bash
# Cek setelah diubah
grep -A 1 'msgid "user.mailingAddress"' /lib/pkp/locale/id_ID/user.po
# Output:
# msgid "user.mailingAddress"
# msgstr "Alamat Korespondensi Kantor Redaksi"
```

---

## 📝 Contoh File .po Lengkap (User.po)

Lokasi Anda harus mencari section ini dalam file `/lib/pkp/locale/id_ID/user.po`:

```po
#: lib/pkp/classes/user/User.inc.php
#, php-format
msgid "user.username.description"
msgstr "Nama pengguna harus terdiri dari setidaknya 3 karakter dan hanya dapat berisi huruf, angka, dan garis bawah (_)."

#: lib/pkp/classes/user/User.inc.php
msgid "user.mailingAddress"
msgstr "Alamat Surat Menyurat"

msgid "user.middleName"
msgstr "Nama Tengah"

#: lib/pkp/templates/frontend/pages/contact.tpl
#: lib/pkp/templates/user/profile/form.tpl
msgid "user.myAccount"
msgstr "Akun Saya"
```

**Ubah baris yang ini:**
```po
msgid "user.mailingAddress"
msgstr "Alamat Korespondensi Kantor Redaksi"  ← UBAH INI
```

---

## 📊 Mapping: Fungsi vs File

### Jika Anda Ingin Mengubah:

**❓ User bisa mengisi alamat mereka sendiri**
→ Edit: `/lib/pkp/locale/id_ID/user.po` (File #1)
```po
msgid "user.mailingAddress"
msgstr "Alamat Korespondensi Kantor Redaksi"
```

**❓ Label di halaman About/Contact**
→ Edit: `/lib/pkp/locale/id_ID/common.po` (File #2)
```po
msgid "common.mailingAddress"
msgstr "Alamat Korespondensi Kantor Redaksi"
```

**❓ Form langganan institusi**
→ Edit: `/locale/id_ID/manager.po` (File #3)
```po
msgid "manager.subscriptions.form.institutionMailingAddress"
msgstr "Alamat Korespondensi Kantor Redaksi"
```

**❓ Ubah Semua Sekaligus (SAFEST)**
→ Edit ketiga file dengan msgstr yang sama

---

## 🚨 JANGAN LAKUKAN INI!

```po
# ❌ SALAH - Mengubah msgid
msgid "user.alamat_korespondensi"
msgstr "Alamat Korespondensi Kantor Redaksi"

# ❌ SALAH - Spacing yang aneh
msgid "user.mailingAddress"
msgstr   "Alamat Korespondensi Kantor Redaksi"

# ❌ SALAH - Tanpa kutip
msgid "user.mailingAddress"
msgstr Alamat Korespondensi Kantor Redaksi

# ❌ SALAH - Double quotes dalam string
msgid "user.mailingAddress"
msgstr "Alamat "Korespondensi" Kantor Redaksi"

# ❌ SALAH - Ubah format
msgid "user.mailingAddress": "Alamat Korespondensi Kantor Redaksi"
```

---

## ✅ LAKUKAN INI!

```po
# ✅ BENAR - Format standard
msgid "user.mailingAddress"
msgstr "Alamat Korespondensi Kantor Redaksi"

# ✅ BENAR - Dengan referensi file
#: lib/pkp/templates/user/profile/form.tpl
msgid "user.mailingAddress"
msgstr "Alamat Korespondensi Kantor Redaksi"

# ✅ BENAR - Multi-line string (jika panjang)
msgid "user.mailingAddress"
msgstr ""
"Alamat Korespondensi Kantor Redaksi "
"(Jika ada informasi tambahan)"

# ✅ BENAR - Dengan escape character
msgid "user.mailingAddress"
msgstr "Alamat Korespondensi \"Kantor\" Redaksi"
```

---

## 🔐 Keamanan & Best Practice

### Before You Start:
1. **BACKUP FILES** - Selalu backup sebelum edit
   ```bash
   cp /lib/pkp/locale/id_ID/user.po{,.backup}
   ```

2. **Check Permissions** - Pastikan Anda punya write access
   ```bash
   ls -la /lib/pkp/locale/id_ID/user.po
   # Harus ada 'w' di permission
   ```

3. **Verify Encoding** - File harus UTF-8
   ```bash
   file /lib/pkp/locale/id_ID/user.po
   # Harus: UTF-8 Unicode text
   ```

### After You Change:
1. **Clear Cache** - Hapus cache OJS
   ```bash
   rm -rf /cache/fc-locale-*.php
   ```

2. **Clear Browser Cache** - Ctrl+Shift+Del atau Cmd+Shift+Delete

3. **Test in Incognito Mode** - Untuk memastikan cache browser tidak mempengaruhi

---

## 🧪 Testing Checklist

Setelah mengubah file, check:

- [ ] File .po terbuka di text editor UTF-8
- [ ] `msgid` tidak berubah
- [ ] `msgstr` sudah berubah ke "Alamat Korespondensi Kantor Redaksi"
- [ ] Tanda kutip masih utuh di awal & akhir
- [ ] File tersimpan dengan extension `.po`
- [ ] Tidak ada spasi berlebih sebelum `msgstr`
- [ ] Cache OJS sudah dihapus
- [ ] Browser cache sudah dihapus
- [ ] Halaman sudah di-refresh (Ctrl+F5)
- [ ] Teks sudah berubah di website

---

## 📍 Lokasi Absolut (Copy-Paste Ready)

```
File 1 (User):
/Applications/XAMPP/xamppfiles/htdocs/ojs/lib/pkp/locale/id_ID/user.po

File 2 (Common):
/Applications/XAMPP/xamppfiles/htdocs/ojs/lib/pkp/locale/id_ID/common.po

File 3 (Manager):
/Applications/XAMPP/xamppfiles/htdocs/ojs/locale/id_ID/manager.po
```

---

## 🎓 Penjelasan Format .po

### Bagian 1: Comments (Opsional)
```po
# Ini adalah komentar
# Author: John Doe
#: referensi/file.tpl  ← Dari file mana kunci ini digunakan
```

### Bagian 2: msgid (JANGAN UBAH)
```po
msgid "user.mailingAddress"  ← Ini adalah KUNCI unik, JANGAN diubah
```

### Bagian 3: msgstr (UBAH INI)
```po
msgstr "Alamat Korespondensi Kantor Redaksi"  ← UBAH INI ke terjemahan baru
```

### Bagian 4: Flags (Opsional)
```po
#, fuzzy
#, php-format
```

---

## 🎯 Summary Singkat

| Pertanyaan | Jawaban |
|-----------|---------|
| Format file apa? | `.po` (bukan XML) |
| Encoding berapa? | UTF-8 |
| Yang diubah apa? | Hanya `msgstr` |
| Yang JANGAN diubah? | `msgid` dan `#:` |
| Berapa file? | 1-3 file (tergantung kebutuhan) |
| Dimana file? | `/lib/pkp/locale/id_ID/` dan `/locale/id_ID/` |
| Setelah ubah? | Hapus cache, refresh browser |

---

**Terakhir Updated:** May 2, 2026  
**Format:** .po (Portable Object / GNU Gettext)  
**Encoding:** UTF-8
