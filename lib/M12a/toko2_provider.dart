import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Toko2Provider extends ChangeNotifier {
  getDataToko() async {
    var res = await http.get(
      Uri.parse('https://4b3e-202-57-7-18.ngrok-free.app'),
    );
    print(res.statusCode);
  }
}
