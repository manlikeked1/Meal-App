import 'package:flutter/material.dart';

class CategoryMealsPage extends StatelessWidget {
  // final String categoryId; //Property which is a string
  // final String categoryTitle;//Property which is a string

  // CategoryMealsPage(this.categoryId, this.categoryTitle);//A constructor with the name of the 'class-name','CategoryMealsPage'

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs['title']; //This is used for routing
    final categoryId = routeArgs['id']; //This is used for routing

    return Scaffold(
        appBar: AppBar(
          title: Text(categoryTitle),
        ),
        body: Center(
            child: Text(
          'The Recipes For The Category',
          style: TextStyle(
              color: Theme.of(context)
                  .accentColor), //Provides the text with a text style color using the 'Theme.of(context)' function
        )));
  }
}
