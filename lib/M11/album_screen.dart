import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AlbumScreen extends StatefulWidget {
  const AlbumScreen({super.key});

  @override
  State<AlbumScreen> createState() => _AlbumScreenState();
}

class _AlbumScreenState extends State<AlbumScreen> {
  String judul = "";
  var data = [];
  getDataServer() async {
    // http get
    var res = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/albums'),
    );
    // print(res.body[0].title);
    setState(() {
      data = json.decode(res.body);
      judul = data[0]['title'];
    });
    print('judul: $judul');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Text(judul),
          ElevatedButton(onPressed: getDataServer, child: Text("Get Data")),
          ListView.builder(
            itemBuilder: (contex, i) {
              return ListTile(title: Text(data[i]['title']));
            },
            itemCount: data.length,
            shrinkWrap: true,
          ),
        ],
      ),
    );
  }
}
