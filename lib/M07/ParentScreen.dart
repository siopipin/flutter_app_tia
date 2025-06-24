import 'package:flutter/material.dart';
import 'package:flutter_app/M07/child_screen.dart';

class ParentScreen extends StatefulWidget {
  const ParentScreen({super.key});

  @override
  State<ParentScreen> createState() => _ParentScreenState();
}

class _ParentScreenState extends State<ParentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          //anak1
          ChildScreen(judul: "Judul", ttl: 2),

          // anak2
          ChildScreen(judul: "Judul2", ttl: 3),
        ],
      ),
    );
  }
}
