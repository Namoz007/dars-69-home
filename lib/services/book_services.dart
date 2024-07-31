import 'package:dio/dio.dart';

class BookServices{
  final _dio = Dio();


  Future<void> getAllBooks() async{
    final res = await _dio.get("https://openlibrary.org/works/OL45804W.json");
    print("bu res ${res.data}");
  }
}