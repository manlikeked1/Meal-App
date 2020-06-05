import 'package:flutter/material.dart';
// import 'package:meal_app/category_meals_page.dart';
import './category_meals_page.dart';

class CategoryItem extends StatelessWidget {
  final color;
  final String title;

  CategoryItem(this.title, this.color);

  void selectCategory(BuildContext ctx) {
    Navigator.of(
      // Special flutter feature for navigating between pages/screens
      ctx,
    ).push(MaterialPageRoute(builder: (_) {
      //This is responsible for addition of the new page/screen on top of the previous one. It also provides an empty builder function because it isn't required
      return CategoryMealsPage(); //This is a function that returns the page to be added when you select any of the category item
    }));
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(
          context), //This provides the function that will enable another screen to appear when selected
      splashColor: Theme.of(context)
          .primaryColor, //This provides a ripple effect that will be displayed with the primary swatch color when selected
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15), //Gives an all round padding of 15
        child: Text(
          title, //Hard coded the different colors for the dummy data categories
          style: Theme.of(context).textTheme.title,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            color.withOpacity(0.7),
            color, //Hard coded the different colors for the dummy data categories
          ], begin: Alignment.topLeft, end: Alignment.bottomRight),
          borderRadius:
              BorderRadius.circular(15), //Gives a borderradius(circular) of 15
        ),
      ),
    );
  }
}
