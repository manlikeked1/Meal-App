import 'package:flutter/material.dart';

import '../dummy_data.dart';
import '../widgets/meal_item.dart';

class CategoryMealsPage extends StatelessWidget {
  static const routeName = '/category-meals';
  // final String categoryId; //Property which is a string
  // final String categoryTitle;//Property which is a string

  // CategoryMealsPage(this.categoryId, this.categoryTitle);//A constructor with the name of the 'class-name','CategoryMealsPage'

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs['title']; //This is used for routing
    final categoryId = routeArgs['id']; //This is used for routing
    final categoryMeals = DUMMY_MEALS.where((meal) {
      //The function 'where' returns as a new iterable and it can be converted to a list with the 'toList()' method which only contain elements that satisfy a condition we specify in an anonymous function we pass to where.
      return meal.categories.contains(categoryId);
    }).toList();

    return Scaffold(
        appBar: AppBar(
          title: Text(categoryTitle),
        ),
        body: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
              title: categoryMeals[index].title,
              imageUrl: categoryMeals[index].imageUrl,
              duration: categoryMeals[index].duration,
              complexity: categoryMeals[index].complexity,
              affordability: categoryMeals[index].affordability,
            );
          },
          itemCount: categoryMeals.length,
        ));
  }
}
