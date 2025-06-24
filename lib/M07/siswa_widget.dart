import 'package:flutter/material.dart';
import 'package:flutter_app/M07/kalkulator.dart';

class SiswaWidget extends StatefulWidget {
  const SiswaWidget({super.key});

  @override
  State<SiswaWidget> createState() => _SiswaWidgetState();
}

class _SiswaWidgetState extends State<SiswaWidget> {
  int nilai = 0;
  String nama = 'Kevin';
  String status = 'tidak hadir';
  List<String> namaPegawai = ['Kevin', 'Devin', 'Salsa'];

  bool? isLoadAds;
  @override
  void initState() {
    isLoadAds = false;
    tungguIklanDariServer();
    super.initState();
  }

  tungguIklanDariServer() async {
    await Future.delayed(Duration(seconds: 3));
    setState(() {
      isLoadAds = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Text(nilai.toString()),
          Text(namaPegawai[nilai]),
          Text(status),

          isLoadAds!
              ? Image.network(
                'https://uploads-ssl.webflow.com/61af164800e38cf1b6c60b55/6371d1bc0d7d56ea12a7bc05_google%20ads%20revou.webp',
              )
              : CircularProgressIndicator(),

          TextButton(
            onPressed: () {
              setState(() {
                if (nilai < 2) {
                  nilai = nilai + 1;
                  status = 'hadir';
                } else {
                  // tampilkan pesan dialog
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('Peringatan'),
                        content: Column(
                          children: [Text("data"), Icon(Icons.warning)],
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                  nama = 'Devin';
                }
              });
            },
            child: Text("Tambah"),
          ),
          SizedBox(height: 100),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => KalkulatorWidget(counter: 1),
                ),
              );
            },
            child: Text("Ke halaman Kalkulator"),
          ),
        ],
      ),
    );
  }
}
