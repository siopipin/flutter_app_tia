import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'book_provider.dart';

class BookScreen extends StatefulWidget {
  const BookScreen({Key? key}) : super(key: key);

  @override
  State<BookScreen> createState() => _BookScreenState();
}

class _BookScreenState extends State<BookScreen> {
  final _titleController = TextEditingController();
  final _authorController = TextEditingController();

  @override
  void initState() {
    super.initState();
    Future.microtask(
      () => Provider.of<BookProvider>(context, listen: false).fetchBooks(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<BookProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Daftar Buku')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: provider.books.length,
              itemBuilder: (context, index) {
                final book = provider.books[index];
                return ListTile(
                  title: Text(book.title),
                  subtitle: Text(book.author),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () async {
                          _titleController.text = book.title;
                          _authorController.text = book.author;
                          final result = await showDialog<bool>(
                            context: context,
                            builder:
                                (context) => AlertDialog(
                                  title: Text('Edit Buku'),
                                  content: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      TextField(
                                        controller: _titleController,
                                        decoration: InputDecoration(
                                          labelText: 'Judul Buku',
                                        ),
                                      ),
                                      TextField(
                                        controller: _authorController,
                                        decoration: InputDecoration(
                                          labelText: 'Penulis',
                                        ),
                                      ),
                                    ],
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed:
                                          () => Navigator.pop(context, false),
                                      child: Text('Batal'),
                                    ),
                                    ElevatedButton(
                                      onPressed: () async {
                                        await provider.updateBook(
                                          book.id,
                                          _titleController.text,
                                          _authorController.text,
                                        );
                                        Navigator.pop(context, true);
                                      },
                                      child: Text('Simpan'),
                                    ),
                                  ],
                                ),
                          );
                          if (result == true) {
                            _titleController.clear();
                            _authorController.clear();
                          }
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () async {
                          final confirm = await showDialog<bool>(
                            context: context,
                            builder:
                                (context) => AlertDialog(
                                  title: Text('Hapus Buku'),
                                  content: Text(
                                    'Yakin ingin menghapus buku ini?',
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed:
                                          () => Navigator.pop(context, false),
                                      child: Text('Batal'),
                                    ),
                                    ElevatedButton(
                                      onPressed:
                                          () => Navigator.pop(context, true),
                                      child: Text('Hapus'),
                                    ),
                                  ],
                                ),
                          );
                          if (confirm == true) {
                            await provider.deleteBook(book.id);
                          }
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                TextField(
                  controller: _titleController,
                  decoration: const InputDecoration(labelText: 'Judul Buku'),
                ),
                TextField(
                  controller: _authorController,
                  decoration: const InputDecoration(labelText: 'Penulis'),
                ),
                ElevatedButton(
                  onPressed: () async {
                    if (_titleController.text.isNotEmpty &&
                        _authorController.text.isNotEmpty) {
                      await provider.addBook(
                        _titleController.text,
                        _authorController.text,
                      );
                      _titleController.clear();
                      _authorController.clear();
                    }
                  },
                  child: const Text('Tambah Buku'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
