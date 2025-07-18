import 'package:flutter/material.dart';
import 'package:flutter_app/M13/news_detail_provider.dart';
import 'package:provider/provider.dart';

class NewDetailScreen extends StatefulWidget {
  final String id;
  const NewDetailScreen({super.key, required this.id});

  @override
  State<NewDetailScreen> createState() => _NewDetailScreenState();
}

class _NewDetailScreenState extends State<NewDetailScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      final provider = context.read<NewsDetailProvider>();
      provider.getNewsDetail(widget.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    final watchProvider = context.watch<NewsDetailProvider>();
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          watchProvider.isLoading
              ? Center(child: CircularProgressIndicator())
              : Column(
                children: [
                  // title
                  Text(watchProvider.dataDetailBerita.data!.judul ?? '-'),
                  // desc
                  Text(watchProvider.dataDetailBerita.data!.deskripsi ?? '-'),
                ],
              ),
        ],
      ),
    );
  }
}
