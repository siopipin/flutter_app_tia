import 'package:flutter/material.dart';

class ChildScreen extends StatelessWidget {
  String judul;
  int ttl;
  ChildScreen({super.key, required this.judul, required this.ttl});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        //kiri
        Text(judul),

        // kanan
        Text(ttl.toString()),
      ],
    );
  }
}
