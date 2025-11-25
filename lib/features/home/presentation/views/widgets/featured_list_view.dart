import 'package:bookly_app/core/widgets/custom_error_widget.dart';
import 'package:bookly_app/core/widgets/custom_loading_indicator.dart';
import 'package:bookly_app/features/home/presentation/manager/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeaturedListView extends StatelessWidget {
  const FeaturedListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
      builder: (context, state) {
        if (state is FeaturedBooksSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,

            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: state.books.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return CustomBookImage(
                  imageUrl:
                      state.books[index].volumeInfo.imageLinks?.thumbnail ??
                      'https://www.google.com/imgres?q=book%20images&imgurl=https%3A%2F%2Fwww.shutterstock.com%2Fimage-photo%2Fbook-open-pages-close-up-600nw-2562942291.jpg&imgrefurl=https%3A%2F%2Fwww.shutterstock.com%2Fsearch%2Fbook-study&docid=UGqMiYou3UOKjM&tbnid=VZZmzZ87LpeD9M&vet=12ahUKEwiRytXp6Y2RAxUXTqQEHecXDrEQM3oECBgQAA..i&w=600&h=400&hcb=2&ved=2ahUKEwiRytXp6Y2RAxUXTqQEHecXDrEQM3oECBgQAA ',
                );
              },
            ),
          );
        } else if (state is FeaturedBooksFailure) {
          return CustomErrorWidget(errorMessage: state.errorMessage);
        } else {
          return CustomLoadingIndicator();
        }
      },
    );
  }
}
