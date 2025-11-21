
import 'package:flutter/material.dart';

class CustomBooksDetailsAppBar extends StatelessWidget {
  const CustomBooksDetailsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(onPressed: () {}, icon: const Icon(Icons.close, size: 25)),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.shopping_cart_outlined, size: 25),
        ),
      ],
    );
  }
}
