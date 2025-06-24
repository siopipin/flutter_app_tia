import 'package:flutter/material.dart';
import 'package:flutter_app/M13/news_provider.dart';
import 'package:provider/provider.dart';

class NewsAddScreen extends StatefulWidget {
  const NewsAddScreen({super.key});

  @override
  State<NewsAddScreen> createState() => _NewsAddScreenState();
}

class _NewsAddScreenState extends State<NewsAddScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = context.read<NewsProvider>();

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            // judul
            TextField(
              controller: provider.judulController,
              decoration: InputDecoration(labelText: 'Judul'),
            ),
            // desc
            TextField(
              controller: provider.descController,
              decoration: InputDecoration(labelText: 'Desc'),
            ),

            // tanggal
            TextField(
              controller: provider.tanggalController,
              decoration: InputDecoration(labelText: 'Tanggal'),
            ),

            // tombol
            ElevatedButton(
              onPressed: () async {
                if (provider.judulController.text.isEmpty) {
                  print('Judul tidak boleh kosong');
                } else {
                  // kirim ke server
                  await provider.postNews(
                    judul: provider.judulController.text,
                    desc: provider.descController.text,
                    tanggal: provider.tanggalController.text,
                  );
                }
              },
              child: Text("Submit"),
            ),
          ],
        ),
      ),
    );
  }
}
