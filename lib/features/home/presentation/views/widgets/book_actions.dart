import 'package:bookly_app/core/utils/functions/custom_url.dart';
import 'package:bookly_app/core/widgets/custom_buttom.dart';
import 'package:bookly_app/core/models/book_model/book_model.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BooksAction extends StatelessWidget {
  const BooksAction({super.key, required this.book});

  final BookModel book;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: [
          Expanded(
            child: CustomButton(
              backgroundColor: Colors.white,
              textColor: Colors.black,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(16),
                topLeft: Radius.circular(16),
              ),
              text: '19.99\$',
              onPressed: () {},
            ),
          ),
          Expanded(
            child: CustomButton(
              backgroundColor: Color(0xffEF8262),
              textColor: Colors.white,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
              text: 'Free Preview',
              onPressed: book.volumeInfo.previewLink != null
                  ? () {
                      launchCustomUrl(context, book.volumeInfo.previewLink!);
                    }
                  : null,
            ),
          ),
        ],
      ),
    );
  }
}
