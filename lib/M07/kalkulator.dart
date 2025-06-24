import 'package:flutter/material.dart';

class KalkulatorWidget extends StatelessWidget {
  int counter = 0;
  KalkulatorWidget({super.key, required this.counter});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Text(counter.toString()),
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.navigate_before),
          ),
        ],
      ),
    );
  }
}
