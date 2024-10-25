part of 'search_book_cubit.dart';

sealed class SearchBookState extends Equatable {
  const SearchBookState();

  @override
  List<Object> get props => [];
}


 class SearchBookInitial extends  SearchBookState{}
  class SearchBookLoading extends SearchBookState{}
   class SearchBookSuccess extends  SearchBookState{
   final List<BookModel> books;
    const SearchBookSuccess(this.books);
   }
    class SearchBookFailure extends  SearchBookState{
      final String errMessage;
      const SearchBookFailure(this.errMessage);
    }