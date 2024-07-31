import 'package:dars_69/bloc/book_bloc/book-state.dart';
import 'package:dars_69/bloc/book_bloc/book_bloc.dart';
import 'package:dars_69/bloc/book_bloc/book_event.dart';
import 'package:dars_69/data/book/book.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShowBook extends StatefulWidget {
  Book book;
  ShowBook({
    super.key,
    required this.book,
  });

  @override
  State<ShowBook> createState() => _ShowBookState();
}

class _ShowBookState extends State<ShowBook> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("${widget.book.title}"),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            children: [
              Text(
                "${widget.book.author}",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 100,
              ),
              Container(
                height: 550,
                width: 350,
                decoration: BoxDecoration(
                    color: Colors.red,
                    image: DecorationImage(
                        image: NetworkImage(
                            "https://i.pinimg.com/originals/37/d6/35/37d6359b1e8340b669e4910359022a51.jpg"))),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BlocBuilder<BookBloc, BookState>(
          builder: (context, state) {
            return InkWell(
              onTap: () {
                context.read<BookBloc>().add(DownloadBookEvenet(widget.book));
              },
              child: Container(
                width: double.infinity,
                height: 70,
                decoration: BoxDecoration(
                    color: Colors.purple,
                    borderRadius: BorderRadius.circular(25)),
                alignment: Alignment.center,
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      height: 70,
                      width: state is DownloadBookState
                          ? state.prosent * MediaQuery.of(context).size.width
                          : 0,
                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(25)),
                    ),
                    widget.book.savePath == ""
                        ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Download",
                          style: TextStyle(
                              fontSize: 25,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        Icon(
                          Icons.cloud_download,
                          color: Colors.white,
                        )
                      ],
                    )
                        : Text(
                      'Read',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
            );
          },
        ));
  }
}
