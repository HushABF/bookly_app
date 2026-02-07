import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/core/widgets/custom_error_widget.dart';
import 'package:bookly_app/core/widgets/custom_loading_indicator.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_list_view_item.dart';
import 'package:bookly_app/features/search/presentation/manager/search_books_cubit/search_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBooksCubit, SearchBooksState>(
      builder: (context, state) {
        if (state is SearchBooksSuccess) {
          return Expanded(
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: state.books.length,
              itemBuilder: (context, index) {
                return BookListViewItem(book: state.books[index]);
              },
            ),
          );
        } else if (state is SearchBooksFailure) {
          return CustomErrorWidget(errorMessage: state.errorMessage);
        } else if (state is SearchBooksInitial) {
          return Center(
            child: Text('Search for Books above', style: Styles.textStyle30),
          );
        } else {
          return CustomLoadingIndicator();
        }
      },
    );
  }
}
