import 'package:flutter/material.dart';
import 'package:flutter_app/M12a/toko2_provider.dart';
import 'package:provider/provider.dart';

class Toko2Screen extends StatefulWidget {
  const Toko2Screen({super.key});

  @override
  State<Toko2Screen> createState() => _Toko2ScreenState();
}

class _Toko2ScreenState extends State<Toko2Screen> {
  @override
  Widget build(BuildContext context) {
    final readProvider = context.read<Toko2Provider>();
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              readProvider.getDataToko();
            },
            child: Text("Submit"),
          ),
          Text("data"),
        ],
      ),
    );
  }
}
