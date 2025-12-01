import 'package:bloc/bloc.dart';
import 'package:bookly_app/core/models/book_model/book_model.dart';
import 'package:bookly_app/features/search/data/repos/search_repo.dart';
import 'package:equatable/equatable.dart';

part 'search_books_state.dart';

class SearchBooksCubit extends Cubit<SearchBooksState> {
  SearchBooksCubit(this.searchRepo) : super(SearchBooksInitial());

  final SearchRepo searchRepo;

  Future<void> fetchSearchBooks({required String searchText}) async {
    emit(SearchBooksLoading());
    // print('Fetching featured books...');
    var result = await searchRepo.fetchSearchResult(searchText: searchText);
    // print('API result: $result');
    result.fold((failure) {
      emit(SearchBooksFailure(failure.errorMessage));
    }, (books) => emit(SearchBooksSuccess(books)));
  }
}
