import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final color;
  final String title;

  CategoryItem(this.title, this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      child: Text(
        title,
        style: Theme.of(context).textTheme.title,
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          color.withOpacity(0.7),
          color,
        ], begin: Alignment.topLeft, end: Alignment.bottomRight),
        borderRadius: BorderRadius.circular(15),
      ),
    );
  }
}
