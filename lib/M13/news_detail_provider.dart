import 'package:flutter/material.dart';
import 'package:flutter_app/M13/news_detail_model.dart';
import 'package:http/http.dart' as http;

class NewsDetailProvider extends ChangeNotifier {
  NewsDetailModel _newsDetailModel = NewsDetailModel();
  NewsDetailModel get dataDetailBerita => _newsDetailModel;
  set setDataDetailBerita(val) {
    _newsDetailModel = val;
    notifyListeners();
  }

  getNewsDetail(String id) async {
    try {
      final url =
          'https://7a26-2404-c0-1c20-00-98a-183.ngrok-free.app/detail/$id';

      var response = await http.get(
        Uri.parse(url),
        headers: {'ngrok-skip-browser-warning': 'any'},
      );
    } catch (e) {
    } finally {}
  }
}
