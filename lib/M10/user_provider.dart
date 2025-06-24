import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  String _name = 'Astriva';
  String _pass = '12345';

  TextEditingController usernameCtrl = TextEditingController();
  final passCtrl = TextEditingController();

  String penerbit = '';
  int tahun = 2025;

  // ctrl penerbit
  final penerbitCtrl = TextEditingController();
  final tahunCtrl = TextEditingController();

  String get dataName => _name;
  String get dataPass => _pass;

  set namaBaru(x) {
    _name = x;
    notifyListeners();
  }

  resetPassword(String newPass) {
    if (newPass.length >= 8) {
      _pass = newPass;
    } else {
      _pass = _pass;
    }
    notifyListeners();
  }

  updateProfileUser(String penerbit, int tahun) {
    if (penerbit.isEmpty) {
    } else {
      penerbit = penerbit;
      tahun = tahun;
      notifyListeners();
    }
  }
}
