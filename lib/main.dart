import 'package:dars_69/bloc/book_bloc/book_bloc.dart';
import 'package:dars_69/data/repositories/book_repository.dart';
import 'package:dars_69/ui/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => BookRepository(),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => BookBloc(repo: context.read<BookRepository>())),
        ],
        child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: HomeScreen()
        ),
      ),
    );
  }
}
