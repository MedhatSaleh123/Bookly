import 'package:bookly_app/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/Features/home/presentation/manager/search_book_cubit/search_book_cubit.dart';
import 'package:bookly_app/Features/search/presention/views/widgets/search_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchView extends StatefulWidget {
  SearchView({super.key,required this.bookModel});
BookModel bookModel;

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  //   void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   BlocProvider.of<SearchBookCubit>(context).searchBooks(
  // name:     widget.bookModel.volumeInfo.categories![0],
  //   );
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: SearchViewBody(
        bookModel: widget.bookModel,
      )),
    );
  }
}
