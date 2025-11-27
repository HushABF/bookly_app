import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_actions.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_rating.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';

class BooksDetailsSection extends StatelessWidget {
  const BooksDetailsSection({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.22, vertical: 36),
          child: const CustomBookImage(
            imageUrl:
                'https://www.writersofusa.com/blogs/wp-content/uploads/2023/08/large_aa7b8fcc4ee3a86626aca3157bbd8d697c38429a.jpg',
          ),
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
        const BookRating(
          mainAxisAlignment: MainAxisAlignment.center,
          rating: 4,
          count: 24234,
        ),
        const SizedBox(height: 35),

        BooksAction(),
      ],
    );
  }
}
