import 'package:flutter/material.dart';
import 'package:flutter_app/M14a/signin_app_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? _username;

  @override
  void initState() {
    super.initState();
    _loadUsername();
  }

  void _loadUsername() async {
    // 1. Dapatkan instance SharedPreferences
    final prefs = await SharedPreferences.getInstance();
    // 2. Baca data username, jika tidak ada, beri nilai default 'Guest'
    setState(() {
      _username = prefs.getString('username') ?? 'Guest';
    });
  }

  void _logout() async {
    final prefs = await SharedPreferences.getInstance();
    // Hapus data username dari SharedPreferences
    await prefs.remove('username');

    if (mounted) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const SigninAppScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(icon: const Icon(Icons.logout), onPressed: _logout),
        ],
      ),
      body: Center(
        child: Text(
          'Selamat Datang, ${_username ?? "memuat..."}!',
          style: const TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
