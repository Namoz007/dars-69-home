class Book {
  final String title;
  final String author;
  final String url;
  String savePath;
  double progress;
  bool isLoading;
  bool isDownloaded;

  Book({
    required this.title,
    required this.author,
    required this.url,
    required this.savePath,
    required this.progress,
    required this.isLoading,
    required this.isDownloaded,
  });
}
