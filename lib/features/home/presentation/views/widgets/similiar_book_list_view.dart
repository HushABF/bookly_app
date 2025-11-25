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
                'https://www.google.com/imgres?q=book%20images&imgurl=https%3A%2F%2Fwww.shutterstock.com%2Fimage-photo%2Fbook-open-pages-close-up-600nw-2562942291.jpg&imgrefurl=https%3A%2F%2Fwww.shutterstock.com%2Fsearch%2Fbook-study&docid=UGqMiYou3UOKjM&tbnid=VZZmzZ87LpeD9M&vet=12ahUKEwiRytXp6Y2RAxUXTqQEHecXDrEQM3oECBgQAA..i&w=600&h=400&hcb=2&ved=2ahUKEwiRytXp6Y2RAxUXTqQEHecXDrEQM3oECBgQAA',
          );
        },
      ),
    );
  }
}
