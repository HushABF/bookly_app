import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_actions.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_details_list_view.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_rating.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_book_details_app_bar.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const CustomBooksDetailsAppBar(),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: width * 0.22,
              vertical: 36,
            ),
            child: const CustomBookImage(),
          ),
          const Text('The Jungle Book', style: Styles.textStyle30),
          const SizedBox(height: 6),
          Opacity(
            opacity: 0.7,
            child: Text(
              'Rudyard Kipling',
              style: Styles.textStyle18.copyWith(fontStyle: FontStyle.italic),
            ),
          ),
          const SizedBox(height: 12),
          const BookRating(mainAxisAlignment: MainAxisAlignment.center),
          const SizedBox(height: 35),
          BooksAction(),
          const SizedBox(height: 48),
          Align(
            alignment: Alignment.centerLeft,
            child: Text('You can also like', style: Styles.textStyle14),
          ),
          const SizedBox(height: 16),
          BooksDetailsListView(),
        ],
      ),
    );
  }
}
