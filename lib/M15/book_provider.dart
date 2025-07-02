import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'book_model.dart';

class BookProvider with ChangeNotifier {
  final List<Book> _books = [];
  List<Book> get books => _books;

  final _collection = FirebaseFirestore.instance.collection('books');

  Future<void> fetchBooks() async {
    final snapshot = await _collection.get();
    _books.clear();
    for (var doc in snapshot.docs) {
      _books.add(Book.fromMap(doc.data(), doc.id));
    }
    notifyListeners();
  }

  Future<void> addBook(String title, String author) async {
    final docRef = await _collection.add({'title': title, 'author': author});
    _books.add(Book(id: docRef.id, title: title, author: author));
    notifyListeners();
  }

  Future<void> updateBook(String id, String title, String author) async {
    await _collection.doc(id).update({'title': title, 'author': author});
    final index = _books.indexWhere((b) => b.id == id);
    if (index != -1) {
      _books[index] = Book(id: id, title: title, author: author);
      notifyListeners();
    }
  }

  Future<void> deleteBook(String id) async {
    await _collection.doc(id).delete();
    _books.removeWhere((b) => b.id == id);
    notifyListeners();
  }
}
