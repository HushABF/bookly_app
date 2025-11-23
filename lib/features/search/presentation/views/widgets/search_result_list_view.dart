
import 'package:bookly_app/features/home/presentation/views/widgets/book_list_view_item.dart';
import 'package:flutter/material.dart';

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        // shrinkWrap: true,
        // physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        itemCount: 5,
        itemBuilder: (context, index) {
          return const BookListViewItem();
        },
      ),
    );
  }
}