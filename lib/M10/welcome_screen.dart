import 'package:flutter/material.dart';
import 'package:flutter_app/M10/user_provider.dart';
import 'package:provider/provider.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final watchprovider = context.watch<UserProvider>();
    final readProvider = context.read<UserProvider>();

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            //Header
            Text(
              "Welcome",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            Row(
              children: [
                Text(
                  watchprovider.dataName,
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Text(watchprovider.dataPass),
                ),
              ],
            ),

            SizedBox(height: 20),

            // textfield
            TextField(
              controller: readProvider.usernameCtrl,
              decoration: InputDecoration(
                labelText: "Username",
                hintText: "Enter your username",
                border: OutlineInputBorder(),
              ),
            ),

            SizedBox(height: 20),

            // text field passwd
            TextField(
              controller: readProvider.passCtrl,
              decoration: InputDecoration(
                labelText: "Password",
                hintText: "Enter your password",
                border: OutlineInputBorder(),
              ),
            ),

            // button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: ElevatedButton(
                    onPressed: () {
                      readProvider.resetPassword(readProvider.passCtrl.text);
                    },
                    child: Text("Reset"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: ElevatedButton(
                    onPressed: () {
                      // logic untuk ubah nama
                      readProvider.namaBaru = readProvider.usernameCtrl.text;
                    },
                    child: Text("Change"),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
