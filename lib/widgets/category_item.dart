import 'package:flutter/material.dart';

import '../screens/category_meals_page.dart'; //Make sure to import this when using a 'named route'.

class CategoryItem extends StatelessWidget {
  final color;
  final String title; //Property which is a string
  final String id; //Property which is a string

  CategoryItem(this.id, this.title,
      this.color); //A constructor with the name of the 'class-name','CategoryItem'

  void selectCategory(BuildContext ctx) {
    Navigator.of(
      // Special flutter feature for navigating between pages/screens
      ctx,
    ).pushNamed(CategoryMealsPage.routeName, arguments: {
      //Using the 'named route' approach
      'id': id,
      'title': title
    }); // This is used to place a new page over the previous page using the 'pushNamed' function and its passes two arguments,'title' and 'id'
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
