import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dars_69/bloc/book_bloc/book-state.dart';
import 'package:dars_69/bloc/book_bloc/book_event.dart';
import 'package:dars_69/services/permission_services.dart';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
import '../../data/book/book.dart';
import '../../data/repositories/book_repository.dart';
import 'package:open_filex/open_filex.dart';

class BookBloc extends Bloc<BookEvent,BookState> {
  final BookRepository _repository;
  List<Book> _books = [];

  BookBloc({required BookRepository repo})
      : _repository = repo,
        super(InitialBookState()) {
    on<AllBooksBookEvent>(getAllListBooks);
    on<DownloadBookEvenet>(_getDownloadBook);
  }

  void _getDownloadBook(DownloadBookEvenet event, emit) async {
    final dio = Dio();

    if (await PermissionService.requestStoragePermission()) {
      try {
        final fullPath = await _getSavePath(event.book);

        if (_checkFileExists(fullPath)) {
          add(OpenFile(path: fullPath));
          event.book.isDownloaded = true;
          event.book.isLoading = false;
          emit(LoadedBookState(_books));
        } else {
          final response = await dio.download(
            event.book.url,
            fullPath,
            onReceiveProgress: (count, total) {
              event.book.progress = count / total;
              emit(DownloadBookState(count / total));
            },
          );
        }
      } on DioException catch (e) {
        event.book.isLoading = false;
        emit(LoadedBookState(_books));
      } catch (e) {
        event.book.isLoading = false;
        emit(LoadedBookState(_books));
      }
    }
    print("vanihoyat tugadi");
  }

  bool _checkFileExists(String filePath) {
    final file = File(filePath);

    return file.existsSync();
  }


  Future<String> _getSavePath(Book file) async {
    final savePath =
    await getApplicationDocumentsDirectory(); // iphone/application/documents
    final fileExtension =
        file.url
            .split('.')
            .last; // https://www.hp.com/video.mp4
    final fileName = "${file.title}.$fileExtension"; // Harry Potter Video.mp4
    final fullPath = "${savePath.path}/$fileName";

    return fullPath;
  }

  void getAllListBooks(AllBooksBookEvent event, emit) {
    emit(LoadingBookState());
    _books = _repository.getAllBooks();
    emit(LoadedBookState(_books));
  }
}