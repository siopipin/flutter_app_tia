import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_app/M13/news_model.dart';
import 'package:http/http.dart' as http;

class NewsProvider extends ChangeNotifier {
  TextEditingController judulController = TextEditingController();
  TextEditingController descController = TextEditingController();
  TextEditingController tanggalController = TextEditingController();

  NewsModel _newsModel = NewsModel();
  NewsModel get dataBerita => _newsModel;
  set setDataBerita(val) {
    _newsModel = val;
    notifyListeners();
  }

  bool _isLoading = false;
  get isLoading => _isLoading;
  set setIsLoading(val) {
    _isLoading = val;
    notifyListeners();
  }

  getAllNews() async {
    try {
      setIsLoading = true;
      // coba ambil data dari api
      print('test hallo');
      final url = 'https://7a26-2404-c0-1c20-00-98a-183.ngrok-free.app';

      var response = await http.get(
        Uri.parse(url),
        headers: {'ngrok-skip-browser-warning': 'any'},
      );
      print('response: ${response.body}');

      await Future.delayed(Duration(seconds: 2));

      if (response.statusCode == 200) {
        // decode data
        var dataDummy = json.decode(response.body);

        // modelkan data
        var dataModel = NewsModel.fromJson(dataDummy);
        setDataBerita = dataModel;
        print(dataModel.data![0].judul);
      } else {
        print('gagal');
      }
    } catch (e) {
      setIsLoading = false;
      // apapun kesalahannya tampilkan disini
    } finally {
      setIsLoading = false;
      print('berhasil');
    }
  }

  postNews({String? judul, String? desc, String? tanggal}) async {
    try {
      print('test hallo');
      final url = 'https://7a26-2404-c0-1c20-00-98a-183.ngrok-free.app';
      var body = json.encode({
        "judul": judul,
        "deskripsi": desc,
        "tanggal": tanggal,
      });

      print(body);
      var response = await http.post(Uri.parse(url), body: body);

      if (response.statusCode == 201) {
        print('berhasil');
      }
    } catch (e) {
    } finally {}
  }
}
