import 'package:flutter/material.dart';

class FacebookScreen extends StatefulWidget {
  final String? username;
  final String? password;
  const FacebookScreen({
    super.key,
    required this.username,
    this.password = '123',
  });

  @override
  State<FacebookScreen> createState() => _FacebookScreenState();
}

class _FacebookScreenState extends State<FacebookScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [Text(widget.username ?? ''), Text(widget.password!)],
        ),
      ),
    );
  }
}
