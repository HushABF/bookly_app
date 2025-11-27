import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_actions.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_rating.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';

class BooksDetailsSection extends StatelessWidget {
  const BooksDetailsSection({super.key, required this.book});
  final BookModel book;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.22, vertical: 36),
          child: CustomBookImage(
            imageUrl:
                book.volumeInfo.imageLinks?.thumbnail ??
                'https://www.writersofusa.com/blogs/wp-content/uploads/2023/08/large_aa7b8fcc4ee3a86626aca3157bbd8d697c38429a.jpg',
          ),
        ),
        Text(
          book.volumeInfo.title ?? 'No Title',
          style: Styles.textStyle30,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 6),
        Opacity(
          opacity: 0.7,
          child: Text(
            book.volumeInfo.authors?[0] ?? 'Unkown Author',
            style: Styles.textStyle18.copyWith(fontStyle: FontStyle.italic),
          ),
        ),
        const SizedBox(height: 12),
        const BookRating(
          mainAxisAlignment: MainAxisAlignment.center,
          rating: 4,
          count: 24234,
        ),
        const SizedBox(height: 35),

        BooksAction(book: book),
      ],
    );
  }
}
