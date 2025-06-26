import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RumahScreen extends StatefulWidget {
  const RumahScreen({super.key});

  @override
  State<RumahScreen> createState() => _RumahScreenState();
}

class _RumahScreenState extends State<RumahScreen> {
  String? _nama;

  @override
  void initState() {
    //cek apakah ada username
    cekUserName();

    super.initState();
  }

  cekUserName() async {
    final sharedPref = await SharedPreferences.getInstance();
    var username = sharedPref.getString('nama');
    print('username: $username');
    setState(() {
      _nama = username;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          Text("Username: $_nama"),

          ElevatedButton(
            onPressed: () async {
              final sharedPref = await SharedPreferences.getInstance();
              sharedPref.setString('nama', "Kevin");
            },
            child: Text("Simpan Username"),
          ),
        ],
      ),
    );
  }
}
