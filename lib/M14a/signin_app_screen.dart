import 'package:flutter/material.dart';
import 'package:flutter_app/M14a/home_app_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SigninAppScreen extends StatefulWidget {
  const SigninAppScreen({super.key});

  @override
  State<SigninAppScreen> createState() => _SignInAppScreenState();
}

class _SignInAppScreenState extends State<SigninAppScreen> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(labelText: 'Username'),
            ),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(labelText: 'Password'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: _login, child: const Text('Login')),
          ],
        ),
      ),
    );
  }

  void _login() async {
    // 1. Dapatkan instance SharedPreferences
    final prefs = await SharedPreferences.getInstance();

    // 2. Simpan username. Di aplikasi nyata, Anda akan memvalidasi password terlebih dahulu.
    await prefs.setString('username', _usernameController.text);

    // 3. Navigasi ke HomeScreen
    if (mounted) {
      Navigator.of(
        context,
      ).pushReplacement(MaterialPageRoute(builder: (context) => HomeScreen()));
    }
  }
}
