import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_app/M12/toko_model.dart';
import 'package:http/http.dart' as http;

class TokoProvider extends ChangeNotifier {
  // GetDataToko
  TokoModel tokoModel = TokoModel();
  TokoModel get dataToko => tokoModel;
  set setDataToko(val) {
    tokoModel = val;
    notifyListeners();
  }

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  set setIsloading(val) {
    _isLoading = val;
    notifyListeners();
  }

  getDataToko() async {
    try {
      setIsloading = true;
      final url = 'http://localhost:3000/tokos';
      var res = await http.get(Uri.parse(url));

      await Future.delayed(Duration(seconds: 3));

      if (res.statusCode == 200) {
        var dataTemp = json.decode(res.body);
        var data = TokoModel.fromJson(dataTemp);
        setDataToko = data;
        print(dataToko.data?[0].nama);

        notifyListeners();
      } else if (res.statusCode == 404) {
        // handle error
      } else {
        // handle error
      }
    } catch (e) {
      setIsloading = false;
    } finally {
      setIsloading = false;
    }
  }
}
