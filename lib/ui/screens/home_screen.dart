import 'package:dars_69/bloc/book_bloc/book-state.dart';
import 'package:dars_69/bloc/book_bloc/book_bloc.dart';
import 'package:dars_69/bloc/book_bloc/book_event.dart';
import 'package:dars_69/data/book/book.dart';
import 'package:dars_69/ui/screens/show_book.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _serachController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: _serachController,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15)
            ),
            hintText: "Search book"
          ),
        ),
      ),
      body: BlocBuilder<BookBloc,BookState>(
        bloc: context.read<BookBloc>()..add(AllBooksBookEvent()),
        builder: (context,state){
          if(state is LoadingBookState){
            return const Center(child: CircularProgressIndicator(color: Colors.red,),);
          }

          if(state is LoadedBookState){
            return ListView.builder(
              itemCount: state.books.length,
              itemBuilder: (context, index) {
                Book book = state.books[index];
                return InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ShowBook(book: book)));
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                    width: double.infinity,
                    height: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15,),
                      border: Border.all(color: Colors.grey,width: 2,),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 250,
                          height: 150,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage("https://i.pinimg.com/originals/37/d6/35/37d6359b1e8340b669e4910359022a51.jpg"),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(15,),bottomLeft: Radius.circular(15,),),
                          ),
                        ),

                        Expanded(child: Text("${book.title}")),
                        SizedBox()
                      ],
                    ),
                  ),
                );
              },
            );
          }

          return Container();
        },
      )
    );
  }
}
