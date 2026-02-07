import 'package:bookly_app/core/utils/app_router.dart';
import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/core/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_rating.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BookListViewItem extends StatelessWidget {
  const BookListViewItem({super.key, required this.book});

  final BookModel book;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouter.kBookDetailsView, extra: book);
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20.0),
        child: SizedBox(
          height: 130,

          child: Row(
            children: [
              // AspectRatio(
              //   aspectRatio: 2 / 3,
              //   child: Container(
              //     margin: const EdgeInsets.only(right: 15),

              //     decoration: const BoxDecoration(
              //       image: DecorationImage(
              //         image: AssetImage(AssetsData.testImage),
              //         fit: BoxFit.fill,
              //       ),
              //     ),
              //   ),
              // ),
              CustomBookImage(
                imageUrl:
                    book.volumeInfo.imageLinks?.thumbnail ??
                    'https://www.google.com/imgres?q=book%20images&imgurl=https%3A%2F%2Fwww.shutterstock.com%2Fimage-photo%2Fbook-open-pages-close-up-600nw-2562942291.jpg&imgrefurl=https%3A%2F%2Fwww.shutterstock.com%2Fsearch%2Fbook-study&docid=UGqMiYou3UOKjM&tbnid=VZZmzZ87LpeD9M&vet=12ahUKEwiRytXp6Y2RAxUXTqQEHecXDrEQM3oECBgQAA..i&w=600&h=400&hcb=2&ved=2ahUKEwiRytXp6Y2RAxUXTqQEHecXDrEQM3oECBgQAA ',
              ),
              const SizedBox(width: 30),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      // width: MediaQuery.of(context).,
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: Text(
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        book.volumeInfo.title ?? 'Unknown Title',
                        style: Styles.textStyle20,
                      ),
                    ),
                    const SizedBox(height: 3),
                    // Text(book.volumeInfo.authors![0] == null ? 'test' :book.volumeInfo.authors![0] ),
                    Text(
                      book.volumeInfo.authors == null ||
                              book.volumeInfo.authors!.isEmpty
                          ? 'Unknown Author' // Provide a default value
                          : book.volumeInfo.authors![0]
                                .split(' ')
                                .take(2)
                                .join(' '), // Access the first author
                    ),
                    const SizedBox(height: 3),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,

                      children: [
                        Text(
                          'Free',
                          style: Styles.textStyle20.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        BookRating(rating: 5, count: 2344),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
