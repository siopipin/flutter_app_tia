import 'package:flutter/material.dart';
import 'package:flutter_app/M13/news_detail_model.dart';

class NewsDetailProvider extends ChangeNotifier {
  NewsDetailModel _newsDetailModel = NewsDetailModel();
  NewsDetailModel get dataDetailBerita => _newsDetailModel;
  set setDataDetailBerita(val) {
    _newsDetailModel = val;
    notifyListeners();
  }
}
