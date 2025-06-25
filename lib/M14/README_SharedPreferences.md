# Demo SharedPreferences Flutter

## 📚 Tujuan Pembelajaran

Demo ini dibuat untuk mengajari siswa tentang penggunaan SharedPreferences dalam Flutter untuk menyimpan data lokal seperti username setelah login.

## 🎯 Konsep yang Dipelajari

1. **SharedPreferences**: Cara menyimpan data sederhana secara lokal
2. **State Management**: Mengelola state aplikasi
3. **Navigation**: Perpindahan antar halaman
4. **Form Validation**: Validasi input user
5. **Async/Await**: Operasi asynchronous

## 📁 Struktur File

```
lib/M14/
├── main_shared_preferences.dart      # Entry point aplikasi
├── shared_preferences_service.dart   # Service untuk SharedPreferences
├── signin_screen.dart               # Halaman login
├── homepage_screen.dart             # Halaman homepage
└── README_SharedPreferences.md      # File ini
```

## 🚀 Cara Menjalankan

1. **Install dependencies**:
   ```bash
   flutter pub get
   ```

2. **Jalankan aplikasi**:
   ```bash
   flutter run -t lib/M14/main_shared_preferences.dart
   ```

## 🔧 Fitur Demo

### 1. Halaman Login (`signin_screen.dart`)
- Form login dengan username dan password
- Validasi input (username minimal 3 karakter, password minimal 6 karakter)
- Menyimpan username ke SharedPreferences setelah login berhasil
- UI yang menarik dengan loading indicator

### 2. Halaman Homepage (`homepage_screen.dart`)
- Menampilkan username yang tersimpan dari SharedPreferences
- Tombol logout untuk menghapus data
- Tombol refresh untuk memuat ulang data
- Tombol hapus semua data untuk demo
- Penjelasan tentang SharedPreferences

### 3. Service SharedPreferences (`shared_preferences_service.dart`)
- Method untuk menyimpan username
- Method untuk mengambil username
- Method untuk cek status login
- Method untuk logout
- Method untuk hapus semua data

## 📖 Penjelasan Kode Penting

### Menyimpan Data
```dart
// Menyimpan username ke SharedPreferences
await SharedPreferencesService.saveUsername(_usernameController.text);
```

### Mengambil Data
```dart
// Mengambil username dari SharedPreferences
final username = await SharedPreferencesService.getUsername();
```

### Cek Status Login
```dart
// Mengecek apakah user sudah login
final isLoggedIn = await SharedPreferencesService.isLoggedIn();
```

## 🎓 Konsep SharedPreferences

### Apa itu SharedPreferences?
SharedPreferences adalah cara untuk menyimpan data sederhana secara lokal di perangkat. Data disimpan dalam format key-value dan akan tetap tersimpan meskipun aplikasi ditutup.

### Tipe Data yang Didukung
- `String`
- `int`
- `bool`
- `double`
- `List<String>`

### Kapan Menggunakan SharedPreferences?
- Menyimpan pengaturan aplikasi
- Menyimpan data login user
- Menyimpan preferensi user
- Data yang tidak terlalu besar

### Kapan TIDAK Menggunakan SharedPreferences?
- Data yang besar (gunakan database)
- Data yang kompleks (gunakan JSON + file)
- Data yang perlu dienkripsi (gunakan secure storage)

## 🔍 Latihan untuk Siswa

1. **Latihan 1**: Tambahkan field email dan simpan ke SharedPreferences
2. **Latihan 2**: Buat halaman settings untuk mengubah username
3. **Latihan 3**: Tambahkan fitur "Remember Me" dengan checkbox
4. **Latihan 4**: Simpan data tambahan seperti umur, alamat, dll
5. **Latihan 5**: Buat fitur export/import data SharedPreferences

## 🐛 Troubleshooting

### Error "Target of URI doesn't exist"
Pastikan dependency `shared_preferences` sudah ditambahkan di `pubspec.yaml`:
```yaml
dependencies:
  shared_preferences: ^2.2.2
```

### Data tidak tersimpan
- Pastikan menggunakan `await` saat memanggil method SharedPreferences
- Cek apakah ada error di console
- Pastikan permission storage sudah diberikan (untuk Android)

### Aplikasi crash saat startup
- Pastikan semua import sudah benar
- Cek apakah ada syntax error
- Restart aplikasi dengan `flutter clean` lalu `flutter run`

## 📱 Testing

Untuk menguji demo ini:

1. **Login pertama kali**: Masukkan username dan password
2. **Tutup aplikasi**: Tekan home button atau swipe up
3. **Buka kembali**: Username masih tersimpan
4. **Logout**: Tekan tombol logout di homepage
5. **Login lagi**: Masukkan username baru
6. **Hapus data**: Tekan "Hapus Semua Data" untuk reset

## 🎯 Kesimpulan

SharedPreferences sangat berguna untuk menyimpan data sederhana secara lokal. Dalam demo ini, siswa belajar:
- Cara menyimpan dan mengambil data
- Penggunaan async/await
- State management sederhana
- Navigation antar halaman
- Form validation

Demo ini memberikan dasar yang kuat untuk memahami konsep penyimpanan data lokal di Flutter. 