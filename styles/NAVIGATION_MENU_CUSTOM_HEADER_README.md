# Dokumentasi: Reviewer Guideline Custom Header untuk OJS 3

## Ringkasan Implementasi

Implementasi ini menambahkan custom header yang secara otomatis muncul pada halaman statis navigation menu items yang memiliki URL atau judul mengandung kata 'reviewer-guideline'. Header ini menampilkan badge profesional dengan styling responsif dan mobile-friendly.

## Arsitektur Implementasi

### 1. **File Template yang Dimodifikasi**

**File:** `/lib/pkp/templates/frontend/pages/navigationMenuItemViewContent.tpl`

**Perubahan Utama:**
- Menambahkan logika Smarty untuk mendeteksi pattern 'reviewer-guideline'
- Menggunakan `$navigationMenuItem->getPath()` untuk mendapatkan path halaman
- Mengecek judul halaman juga untuk fleksibilitas yang lebih tinggi
- Secara dinamis menambahkan class `page_reviewer_guideline` ke div kontainer
- Menampilkan custom header div dengan badge ketika pattern cocok

```smarty
{assign var="isReviewerGuideline" value=false}
{if $navigationMenuItem && $navigationMenuItem->getPath()}
    {assign var="pagePath" value=$navigationMenuItem->getPath()}
    {if 'reviewer-guideline'|strpos:$pagePath !== false || 
           'reviewer-guideline'|strpos:$title !== false}
        {assign var="isReviewerGuideline" value=true}
    {/if}
{/if}
```

### 2. **File CSS Baru**

#### A. `/styles/reviewer-guidelines.css`
File CSS utama untuk styling informasi dan reviewer guideline pages:
- Border left berwarna biru (#007bff) dengan ketebalan 5px
- Font sans-serif untuk readability
- Padding responsif: 1.5rem (desktop), 1rem (tablet), 0.75rem (mobile)
- Styling untuk heading, list, table, blockquote, dan kode
- Print stylesheet untuk output cetak profesional

#### B. `/styles/reviewer-guideline-header.css` (NEW)
File CSS spesifik untuk custom header badge:
- **Gradient background**: Blue gradient (#007bff ke #0056b3)
- **Badge styling**: Glassmorphism effect dengan backdrop-filter
- **Icon + text**: Emoji 📋 dan teks "Reviewer Guidelines"
- **Responsive design**: Adaptive untuk 768px dan 480px breakpoints
- **Print optimized**: Border style untuk output cetak

### 3. **Variabel Smarty yang Digunakan**

| Variabel | Tipe | Deskripsi |
|----------|------|-----------|
| `$navigationMenuItem` | Object | Objek menu item yang sedang ditampilkan |
| `$navigationMenuItem->getPath()` | String | URL path dari navigation menu item |
| `$title` | String | Judul halaman |
| `$baseUrl` | String | URL base aplikasi OJS |
| `$content` | String | Konten halaman yang di-render |

## Cara Penggunaan

### Untuk Admin OJS

1. **Membuat Navigation Menu Item "Reviewer Guideline"**
   - Login sebagai Journal Manager
   - Buka: Website Settings → Navigation Menu Items
   - Klik "Create Item"
   - Tipe: Custom
   - Judul: "Reviewer Guidelines" (atau nama lain)
   - Path/URL: Gunakan **'reviewer-guideline'** atau format apapun yang mengandung 'reviewer-guideline'
   - Contoh path valid:
     - `reviewer-guideline`
     - `about/reviewer-guideline`
     - `guidelines/reviewer-guideline`
   - Simpan

2. **Konten Halaman**
   - Edit konten dalam text editor yang diberikan
   - Gunakan HTML formatting untuk struktur konten
   - Styling akan otomatis diterapkan dari CSS files

### Untuk Pengembang

**Mengedit Deteksi Pattern:**

Jika Anda ingin mengubah keyword yang di-deteksi, modifikasi baris berikut di `navigationMenuItemViewContent.tpl`:

```smarty
{if 'reviewer-guideline'|strpos:$pagePath !== false || 
       'reviewer-guideline'|strpos:$title !== false}
```

Ganti `'reviewer-guideline'` dengan keyword lain yang ingin Anda deteksi.

**Mengkustomisasi Header Badge:**

Edit `/styles/reviewer-guideline-header.css`:
- Ubah gradient color: Edit `background: linear-gradient(135deg, #007bff 0%, #0056b3 100%);`
- Ubah icon: Edit emoji di file template dari 📋 ke icon lain
- Ubah text: Modifikasi "Reviewer Guidelines" di template

**Menghilangkan Header (Opsional):**

Hapus blok `{if $isReviewerGuideline}...{/if}` dari template jika hanya ingin styling tanpa header.

## Fitur-Fitur

### ✅ Deteksi URL Otomatis
- Tidak perlu modifikasi handler PHP
- Pure Smarty template logic
- Fleksibel: bisa deteksi path atau judul

### ✅ Responsive Design
**Desktop (768px+):**
- Padding: 1.5rem
- Font size: 1.1rem
- Full width badge

**Tablet (768px):**
- Padding: 1rem
- Font size: 1rem
- Adjusted spacing

**Mobile (<480px):**
- Padding: 0.75rem
- Font size: 0.9rem
- Vertical badge layout untuk layar kecil

### ✅ Glassmorphism Effect
- Backdrop blur untuk efek modern
- Semi-transparent background
- Border subtle untuk depth

### ✅ Print Friendly
- Header berubah ke border style untuk cetak
- Warna adjusted untuk print output
- Tidak ada shadow atau blur effects

### ✅ Accessibility
- Semantic HTML
- Proper heading hierarchy
- Color contrast ratio memenuhi WCAG standards

## Troubleshooting

### Header Tidak Muncul
**Penyebab:** Path atau judul tidak mengandung 'reviewer-guideline'

**Solusi:**
1. Pastikan URL item mengandung kata 'reviewer-guideline' (case-sensitive)
2. Periksa di browser: klik navigation item → lihat URL
3. Jika perlu, ubah pattern deteksi di template

### CSS Tidak Ter-load
**Penyebab:** File CSS di lokasi salah atau permission issue

**Solusi:**
1. Pastikan file ada di `/styles/` folder
2. Clear browser cache (Ctrl+F5 atau Cmd+Shift+R)
3. Clear OJS cache: Hapus folder `/cache/` (atau gunakan Settings → Clear Cache)
4. Check file permissions: `ls -la /styles/reviewer-guideline*.css`

### Styling Tidak Sesuai
**Penyebab:** CSS specificity conflict atau tema override

**Solusi:**
1. Buka browser DevTools (F12)
2. Inspect element badge
3. Lihat CSS rules mana yang aktif
4. Override di custom CSS atau tingkatkan specificity di `reviewer-guideline-header.css`

## Customization Examples

### Contoh 1: Ubah Warna Header Gradient

Di `reviewer-guideline-header.css`, ubah:
```css
.page_reviewer_guideline .page-header-special-reviewer-guideline {
    background: linear-gradient(135deg, #28a745 0%, #1e7e34 100%);  /* Green */
}
```

### Contoh 2: Ubah Icon Badge

Di `navigationMenuItemViewContent.tpl`, ubah:
```smarty
<span class="badge-icon">📖</span>  {* Ganti 📋 dengan 📖 *}
```

### Contoh 3: Tambah Deskripsi Tambahan

Di template, edit:
```smarty
<div class="page-header-special-reviewer-guideline">
    <div class="reviewer-guideline-badge">
        <span class="badge-icon">📋</span>
        <div>
            <span class="badge-text">Reviewer Guidelines</span>
            <p style="font-size: 0.8rem; margin: 0;">
                Panduan lengkap untuk reviewer
            </p>
        </div>
    </div>
</div>
```

### Contoh 4: Deteksi Multiple Keywords

Di `navigationMenuItemViewContent.tpl`, ubah condition menjadi:
```smarty
{if ('reviewer-guideline'|strpos:$pagePath !== false || 
      'guidelines'|strpos:$pagePath !== false ||
      'reviewer-guideline'|strpos:$title !== false)}
    {assign var="isReviewerGuideline" value=true}
{/if}
```

## File-File yang Terlibat

| File | Status | Deskripsi |
|------|--------|-----------|
| `/lib/pkp/templates/frontend/pages/navigationMenuItemViewContent.tpl` | **Modified** | Template yang di-update dengan logika deteksi |
| `/styles/reviewer-guidelines.css` | **Existing** | CSS utama untuk styling page |
| `/styles/reviewer-guideline-header.css` | **NEW** | CSS untuk custom header badge |
| `/styles/REVIEWER_GUIDELINES_CSS_README.md` | **Existing** | Dokumentasi sebelumnya |

## Integrasi dengan CSS yang Ada

File `reviewer-guidelines.css` (dibuat sebelumnya) sudah include class `.page_reviewer_guideline` yang sekarang di-gunakan oleh logic baru.

Kedua CSS files bekerja bersama:
1. `reviewer-guidelines.css`: Styling umum untuk information pages
2. `reviewer-guideline-header.css`: Styling khusus header badge

## Testing

### Test Case 1: Navigation Menu Item dengan Path 'reviewer-guideline'

1. Create menu item dengan path: `reviewer-guideline`
2. Buka halaman dari frontend navigation
3. **Expected:** Header badge muncul dengan gradient background biru
4. Resize browser untuk test responsive
5. **Expected:** Layout adapt di tablet dan mobile

### Test Case 2: Navigation Menu Item dengan Path 'about/reviewer-guideline'

1. Create menu item dengan path: `about/reviewer-guideline`
2. Buka halaman
3. **Expected:** Header badge tetap muncul (substring matching)

### Test Case 3: Print Test

1. Buka halaman reviewer-guideline
2. Tekan Ctrl+P (print preview)
3. **Expected:** Header badge berubah ke border style (bukan gradient)

### Test Case 4: Non-Reviewer Pages

1. Create regular navigation item dengan path: `about` (tidak ada 'reviewer-guideline')
2. Buka halaman
3. **Expected:** Header badge TIDAK muncul

## Performance Considerations

- **Template Logic:** Minimal - hanya string comparison
- **CSS:** Lightweight dengan media queries yang optimized
- **Browser Rendering:** Glassmorphism effect menggunakan `backdrop-filter` (well-supported modern browsers)
- **Caching:** Static CSS files dikerjakan oleh web server cache

## Browser Support

| Browser | Versi | Status |
|---------|-------|--------|
| Chrome | 60+ | ✅ Full Support |
| Firefox | 55+ | ✅ Full Support |
| Safari | 12+ | ✅ Full Support |
| Edge | 15+ | ✅ Full Support |
| IE 11 | - | ⚠️ Basic (no backdrop-filter) |

Untuk IE 11, CSS akan degrade gracefully (backdrop-filter tidak bekerja, tapi konten tetap readable).

## Maintenance

- **Update OJS:** File modifications terlokalisasi di template dan CSS - tidak akan confict dengan core updates
- **Backup:** Backup `/lib/pkp/templates/frontend/pages/navigationMenuItemViewContent.tpl` sebelum update OJS
- **Cache Clearing:** Jika ada perubahan, selalu clear OJS cache dan browser cache

## Support & Dokumentasi Tambahan

Untuk informasi lebih lanjut tentang:
- **Navigation Menu Items:** Lihat OJS Admin Guide
- **Smarty Templating:** https://www.smarty.net/docs/en/
- **PKP Framework:** https://github.com/pkp/pkp-lib

---

**Catatan:** Dokumentasi ini dibuat untuk OJS 3.x dengan PKP Framework 3.x+. Kompatibilitas dengan versi yang lebih lama belum diuji.
