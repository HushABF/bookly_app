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
                'https://www.google.com/imgres?q=book%20images&imgurl=https%3A%2F%2Fwww.shutterstock.com%2Fimage-photo%2Fbook-open-pages-close-up-600nw-2562942291.jpg&imgrefurl=https%3A%2F%2Fwww.shutterstock.com%2Fsearch%2Fbook-study&docid=UGqMiYou3UOKjM&tbnid=VZZmzZ87LpeD9M&vet=12ahUKEwiRytXp6Y2RAxUXTqQEHecXDrEQM3oECBgQAA..i&w=600&h=400&hcb=2&ved=2ahUKEwiRytXp6Y2RAxUXTqQEHecXDrEQM3oECBgQAA',
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
        const BookRating(mainAxisAlignment: MainAxisAlignment.center),
        const SizedBox(height: 35),

        BooksAction(),
      ],
    );
  }
}
