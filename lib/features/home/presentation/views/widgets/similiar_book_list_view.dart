import 'package:bookly_app/features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';

class SimilarBooksListView extends StatelessWidget {
  const SimilarBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.18,

      child: ListView.builder(
        itemCount: 5,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return const CustomBookImage(
            imageUrl:
                'https://www.writersofusa.com/blogs/wp-content/uploads/2023/08/large_aa7b8fcc4ee3a86626aca3157bbd8d697c38429a.jpg',
          );
        },
      ),
    );
  }
}
