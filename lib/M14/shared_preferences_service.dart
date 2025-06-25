import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  static const String _usernameKey = 'username';
  static const String _isLoggedInKey = 'isLoggedIn';

  // Menyimpan username ke SharedPreferences
  static Future<void> saveUsername(String username) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_usernameKey, username);
    await prefs.setBool(_isLoggedInKey, true);
  }

  // Mengambil username dari SharedPreferences
  static Future<String?> getUsername() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_usernameKey);
  }

  // Mengecek apakah user sudah login
  static Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_isLoggedInKey) ?? false;
  }

  // Logout - menghapus data dari SharedPreferences
  static Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_usernameKey);
    await prefs.setBool(_isLoggedInKey, false);
  }

  // Menghapus semua data (clear all)
  static Future<void> clearAll() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
