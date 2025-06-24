import 'package:flutter/material.dart';
import 'package:flutter_app/M13/news_add_screen.dart';
import 'package:flutter_app/M13/news_detail_screen.dart';
import 'package:flutter_app/M13/news_provider.dart';
import 'package:provider/provider.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  @override
  void initState() {
    super.initState();

    final provider = context.read<NewsProvider>();
    Future.microtask(() async {
      await provider.getAllNews();
    });
  }

  @override
  Widget build(BuildContext context) {
    final watchProvider = context.watch<NewsProvider>();

    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          // pencarian

          // list berita
          watchProvider.isLoading
              ? Center(child: CircularProgressIndicator())
              : ListView.builder(
                shrinkWrap: true,
                itemCount: watchProvider.dataBerita.data!.length,
                itemBuilder: (context, i) {
                  return ListTile(
                    onTap:
                        () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (context) => NewDetailScreen(
                                  id:
                                      watchProvider.dataBerita.data![i].id
                                          .toString(),
                                ),
                          ),
                        ),
                    trailing: Image.network('https://picsum.photos/0'),
                    title: Text(watchProvider.dataBerita.data![i].judul ?? '-'),
                    subtitle: Text(
                      watchProvider.dataBerita.data![i].deskripsi ?? '-',
                    ),
                  );
                },
              ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:
            () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => NewsAddScreen()),
            ),
        child: Icon(Icons.add),
      ),
    );
  }
}
