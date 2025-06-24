import 'package:flutter/material.dart';
import 'package:flutter_app/M10-A/welcome_provider.dart';
import 'package:flutter_app/M10/user_provider.dart';
import 'package:provider/provider.dart';

class Welcome2Screen extends StatelessWidget {
  const Welcome2Screen({super.key});

  @override
  Widget build(BuildContext context) {
    final watchProvider = context.watch<WelcomeProvider>();

    final readProvider = context.read<WelcomeProvider>();

    final readUserProvider = context.read<UserProvider>();

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            watchProvider.isLoading
                ? CircularProgressIndicator()
                : Text(watchProvider.dataNama),

            TextField(
              controller: readUserProvider.penerbitCtrl,
              decoration: InputDecoration(
                labelText: "Penerbit",
                hintText: "Masukkan Penerbit",
              ),
            ),
            TextField(
              controller: readUserProvider.tahunCtrl,
              decoration: InputDecoration(
                labelText: "Tahun Terbit",
                hintText: "Masukkan Tahun",
              ),
            ),

            ElevatedButton(
              onPressed: () {
                readUserProvider.updateProfileUser(
                  readUserProvider.penerbitCtrl.text,
                  int.parse(readUserProvider.tahunCtrl.text),
                );
              },
              child: Text("Submit"),
            ),
          ],
        ),
      ),
    );
  }
}
