# CSS Custom untuk Halaman Reviewer Guidelines dan Information Pages

## Deskripsi
File `reviewer-guidelines.css` menyediakan styling profesional dan mobile-friendly untuk semua halaman informasi di OJS 3, termasuk halaman **Reviewer Guidelines**, Author Guidelines, Reader Guidelines, dan halaman informasi lainnya.

## Fitur Utama
✅ **Border Kiri** - Border biru 5px pada sisi kiri content untuk aksen visual  
✅ **Font Sans-serif** - Menggunakan font system default yang modern dan bersih  
✅ **Padding Nyaman** - Spacing yang optimal untuk kenyamanan membaca desktop dan mobile  
✅ **Mobile-Friendly** - Responsive design dengan breakpoints di 768px dan 480px  
✅ **Tema Default OJS** - Menggunakan warna biru (#007bff) yang konsisten dengan OJS  
✅ **Aksesibilitas** - Contrast warna yang baik dan ukuran font yang readable  

## Struktur CSS

### Class Utama
- `.page_information` - Semua halaman informasi
- `.page_reviewer_guidelines` - Class spesifik untuk reviewer guidelines

### Elemen yang Diatur
- **Heading** (h1, h2, h3) - Font weight, size, color, spacing
- **Description/Content** - Border kiri, background, padding
- **Links** - Warna dan hover state
- **Lists** - Margin dan line-height
- **Tables** - Header styling, alternating row colors
- **Blockquotes** - Border kiri dan background highlight
- **Code blocks** - Background color dan font family

## Customization

### Mengubah Warna Brand
Edit warna `#007bff` (biru default OJS) ke warna brand Anda:

```css
/* Di reviewer-guidelines.css, ganti semua #007bff dengan warna pilihan Anda */
#0056b3 /* Warna hover - lebih gelap dari warna utama */
#f0f7ff /* Background highlight - lebih terang dari warna utama */
```

### Mengubah Lebar Border Kiri
Cari `.description` dan ubah nilai `border-left`:

```css
.page_information .description {
	border-left: 5px solid #007bff;  /* Ubah 5px ke ukuran pilihan Anda */
}
```

### Mengubah Font Family
Edit deklarasi font di `.page_information`:

```css
.page_information {
	font-family: 'Segoe UI', Roboto, 'Helvetica Neue', Arial, sans-serif;
	/* Atau pilih font dari Google Fonts, misalnya: 'Lato', sans-serif */
}
```

### Menambah Styling Anda Sendiri

Buat file CSS tambahan atau edit `reviewer-guidelines.css`:

```css
/* Contoh: Menambah styling untuk emphasis text */
.page_reviewer_guidelines .description strong {
	font-weight: 700;
	color: #0056b3;
}

.page_reviewer_guidelines .description em {
	font-style: italic;
	color: #666;
}
```

## Breakpoints Mobile

### Desktop (≥ 769px)
- Font size: 1rem
- Heading h1: 2rem
- Padding: 1.5rem

### Tablet (768px ke bawah)
- Font size: tetap 1rem
- Heading h1: 1.75rem
- Padding: 1rem
- Border left: 4px

### Mobile (480px ke bawah)
- Font size: 0.95rem
- Heading h1: 1.5rem
- Padding: 0.75rem
- List margin: 1.5rem

## Testing

### Desktop
1. Buka halaman Reviewer Guidelines di desktop browser
2. Verifikasi:
   - Border kiri berwarna biru 5px terlihat
   - Font sans-serif digunakan
   - Spacing/padding nyaman untuk dibaca
   - Heading terlihat menonjol dengan border bawah

### Tablet (iPad)
1. Zoom browser ke 768px lebar
2. Verifikasi:
   - Border tetap terlihat
   - Heading tetap readable
   - Padding disesuaikan untuk ukuran tablet

### Mobile (iPhone/Android)
1. Test di mobile browser atau zoom ke 480px
2. Verifikasi:
   - Layout tetap responsif
   - Font masih readable (tidak terlalu kecil)
   - Border kiri tetap terlihat
   - List dan table dapat di-scroll horizontal jika perlu

## File Lokasi

- **CSS File**: `/styles/reviewer-guidelines.css`
- **Template**: `/lib/pkp/templates/frontend/pages/information.tpl`
- **Handler**: `/pages/information/InformationHandler.inc.php`

## Integrasi

File CSS sudah otomatis di-include dalam template `information.tpl` di baris:

```html
<link rel="stylesheet" href="{$baseUrl}/styles/reviewer-guidelines.css" type="text/css" />
```

Jika Anda ingin include file CSS di tempat lain, gunakan tag `<link>` dengan path relativ atau absolute sesuai struktur folder.

## Browser Support

✅ Chrome/Edge 90+  
✅ Firefox 88+  
✅ Safari 14+  
✅ Mobile browsers (iOS Safari, Chrome Mobile)  

## Notes

- File CSS tidak akan hilang saat OJS update karena tersimpan di folder `/styles/`
- Semua styling menggunakan CSS standard, tidak memerlukan JavaScript
- Print stylesheet disertakan untuk print-friendly output

## Troubleshooting

### CSS tidak ter-load
- Verifikasi path file CSS benar: `/styles/reviewer-guidelines.css`
- Clear browser cache (Ctrl+Shift+Delete atau Cmd+Shift+Delete)
- Check browser console untuk error message

### Styling tidak sesuai
- Cek apakah CSS ada konflik dengan CSS lain di OJS
- Gunakan Chrome DevTools (F12) untuk inspect element dan lihat cascade CSS
- Prioritaskan dengan `!important` jika diperlukan (gunakan dengan hati-hati)

### Font tidak berubah
- Verifikasi font-family declaration tidak di-override oleh CSS lain
- Clear cache browser
- Reload halaman (Ctrl+F5 atau Cmd+Shift+R)
