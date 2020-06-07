import 'package:flutter/material.dart';

import './category_meals_page.dart';
import './categories_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'KedMeals',
      theme: ThemeData(
          brightness: Brightness.light,
          primarySwatch:
              Colors.indigo, //This provides the primary color of the app
          accentColor: Colors.amber,
          canvasColor:
              Colors.black45, //This provides the canvas color of the app
          fontFamily: "Raleway",
          textTheme: ThemeData.dark().textTheme.copyWith(
              //Provides the app with a dark mode
              body1: TextStyle(
                color: Color.fromRGBO(
                    20, 51, 51, 1), //This gives the color gradient
              ),
              body2: TextStyle(
                color: Color.fromRGBO(
                    20, 51, 51, 1), //This gives the color gradient
              ),
              title: TextStyle(
                fontSize: 20,
                fontFamily: "RobotoCondensed",
                fontWeight: FontWeight
                    .bold, //This provides the font weight texttheme title
              ))),
      // home:
      //     CategoriesPage(), //This makes the Category Screen/Page to become the homepage
      initialRoute: '/', //The default value is '/'
      routes: {
        //Using named routes is more preferable
        '/': (ctx) =>
            CategoriesPage(), //This also makes the Category Screen/Page to become the homepage but this method is used in the 'named route' method
        CategoryMealsPage.routeName: (ctx) => CategoryMealsPage()
      }, //This 'routes' feature helps to set up routes easily. It is better to set up routes like this incase the project you're working on is a large one.
    );
  }
}
