import 'package:dars_69/data/book/book.dart';

sealed class BookEvent{}

final class OpenFile extends BookEvent {
  final String path;

  OpenFile({required this.path});
}

final class AllBooksBookEvent extends BookEvent{}

final class DownloadBookEvenet extends BookEvent{
  Book book;

  DownloadBookEvenet(this.book);

}