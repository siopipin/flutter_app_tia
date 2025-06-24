import 'package:flutter/material.dart';
import 'package:flutter_app/M12/toko_model.dart';
import 'package:flutter_app/M12/toko_provider.dart';
import 'package:provider/provider.dart';

class TokoScreen extends StatefulWidget {
  const TokoScreen({super.key});

  @override
  State<TokoScreen> createState() => _TokoScreenState();
}

class _TokoScreenState extends State<TokoScreen> {
  @override
  Widget build(BuildContext context) {
    final tokoProvider = context.read<TokoProvider>();
    final watchTokoProvider = context.watch<TokoProvider>();
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          //Tombol
          ElevatedButton(
            onPressed: () async {
              tokoProvider.getDataToko();
            },
            child: Text("GET DATA2"),
          ),

          //Data
          watchTokoProvider.isLoading
              ? Center(child: CircularProgressIndicator())
              : Text(
                watchTokoProvider.dataToko.data?[0].nama ?? 'TIDAK ADA DATA',
              ),
        ],
      ),
    );
  }
}
