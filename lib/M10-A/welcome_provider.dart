import 'package:flutter/material.dart';

class WelcomeProvider extends ChangeNotifier {
  String _nama = 'Andi';
  String get dataNama => _nama;

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  set dataLoading(x) {
    _isLoading = x;
    notifyListeners();
  }

  set ubahNama(x) {
    _nama = x;
    notifyListeners();
  }

  getDataNamaFromServer(x) async {
    try {
      dataLoading = true;
      await Future.delayed(Duration(seconds: 3));

      ubahNama = x;
      dataLoading = false;
    } catch (e) {
      dataLoading = false;
    }
  }
}
