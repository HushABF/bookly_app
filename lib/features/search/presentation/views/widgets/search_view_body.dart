import 'package:bookly_app/core/models/book_model/book_model.dart';
import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/search/presentation/manager/search_books_cubit/search_books_cubit.dart';
import 'package:bookly_app/features/search/presentation/views/widgets/custom_search_text_field.dart';
import 'package:bookly_app/features/search/presentation/views/widgets/search_result_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          SizedBox(height: 12),

          CustomSearchTextField(
            onSubmitted: (value) {
              BlocProvider.of<SearchBooksCubit>(
                context,
              ).fetchSearchBooks(searchText: value);
            },
          ),
          SizedBox(height: 36),
          Align(
            alignment: Alignment.centerLeft,
            child: Text('Results:', style: Styles.textStyle18),
          ),
          SizedBox(height: 24),

          SearchResultListView(),
        ],
      ),
    );
  }
}
