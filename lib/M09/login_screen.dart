import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/M09/facebook_screen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passController = TextEditingController();

  bool isValidLogin = false;
  bool isDataInvalid = false;
  bool isObs = true;

  bool showContainer = true;

  loginGenta() {
    setState(() {
      showContainer = !showContainer;
    });

    print(usernameController.text);
    print(passController.text);
    if (usernameController.text == 'admin1') {
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(
      //     builder:
      //         (context) => FacebookScreen(username: usernameController.text),
      //   ),
      // );
    } else {
      setState(() {
        isDataInvalid = true;
        isValidLogin = false;
      });
    }
  }

  String soalSatu = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          RadioListTile(
            title: Text('Jakarta'),
            value: 'Jakarta',
            groupValue: soalSatu,
            onChanged: (val) {
              setState(() {
                soalSatu = val!;
              });
            },
          ),
          RadioListTile(
            title: Text('Medan'),
            value: 'Medan',
            groupValue: soalSatu,
            onChanged: (val) {
              setState(() {
                soalSatu = val!;
              });
            },
          ),

          // username
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: usernameController,
              decoration: InputDecoration(
                labelText: 'Username',
                hintText: 'Masukkan username',
                border: OutlineInputBorder(),
              ),
            ),
          ),

          SizedBox(height: 10),

          // password
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: passController,
              obscureText: isObs,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      isObs = !isObs;
                    });
                  },
                  icon:
                      isObs
                          ? Icon(Icons.remove_red_eye_rounded)
                          : Icon(Icons.remove_red_eye_outlined),
                ),
              ),
            ),
          ),

          isDataInvalid
              ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Data tidak valid",
                  style: TextStyle(color: Colors.red),
                ),
              )
              : Container(),

          // login button
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(onPressed: loginGenta, child: Text("Login")),
          ),

          // Container warna merah 100 x 100
          showContainer
              ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(width: 100, height: 100, color: Colors.red),
              )
              : Container(child: Icon(Icons.stacked_bar_chart, size: 300)),
        ],
      ),
    );
  }
}
