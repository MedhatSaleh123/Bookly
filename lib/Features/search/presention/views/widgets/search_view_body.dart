import 'package:bookly_app/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/Features/home/presentation/manager/search_book_cubit/search_book_cubit.dart';
import 'package:bookly_app/Features/home/presentation/views/widgets/best_seller_view_item.dart';
import 'package:bookly_app/Features/search/presention/views/widgets/custom_search_text_field.dart';
import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/core/widgets/custom_error_widget.dart';
import 'package:bookly_app/core/widgets/custom_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(
        children: [
          CustomSearchTextField(
            onSubmitted: (value) {
              BlocProvider.of<SearchBookCubit>(context).searchBooks(
                name: value,
              );
            },
          ),
          Text(
            "Search Result",
            style: Styles.textStyle18,
          ),
          const SizedBox(
            height: 16,
          ),
          BlocBuilder<SearchBookCubit, SearchBookState>(
            builder: (context, state) {
              if (state is SearchBookSuccess) {
  return Expanded(
    child: ListView.builder(
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: state.books.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: BookListViewItem(
            bookModel: state.books[index],
          ),
        );
      },
    ),
  );
}else if (state is SearchBookFailure){
  return CustomErrorWidget(errMessage: state.errMessage);
}else{
  return CustomLoadingIndicator();
}
            },
          )
        ],
      ),
    );
  }
}
