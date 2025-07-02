class Book {
  final String id;
  final String title;
  final String author;

  Book({required this.id, required this.title, required this.author});

  factory Book.fromMap(Map<String, dynamic> data, String documentId) {
    return Book(
      id: documentId,
      title: data['title'] ?? '',
      author: data['author'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {'title': title, 'author': author};
  }
}
