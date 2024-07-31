import 'package:dars_69/data/book/book.dart';

sealed class BookState{}

final class InitialBookState extends BookState{}

final class LoadingBookState extends BookState{}

final class LoadedBookState extends BookState{
  List<Book> books;

  LoadedBookState(this.books);
}

final class DownloadBookState extends BookState{
  double prosent;

  DownloadBookState(this.prosent);
}

final class ErrorBookState extends BookState{}