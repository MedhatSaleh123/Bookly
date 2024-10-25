import 'package:bloc/bloc.dart';
import 'package:bookly_app/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/Features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'search_book_state.dart';

class SearchBookCubit extends Cubit<SearchBookState> {
  SearchBookCubit(this.homeRepo) : super(SearchBookInitial());
   final HomeRepo homeRepo;

  Future<void> searchBooks({required String name}) async {
    emit(SearchBookLoading());
    var result = await homeRepo.searchBooks(name: name);
    result.fold((failure) {
      emit(SearchBookFailure(failure.errMessage));
    }, (books) {
      emit(SearchBookSuccess(books));
    });
  }
}
