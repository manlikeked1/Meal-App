import 'package:flutter/material.dart';
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
          primarySwatch: Colors.indigo,
          // accentColor: Colors.amber,
          canvasColor: Colors.black45,
          fontFamily: "Raleway",
          textTheme: ThemeData.dark().textTheme.copyWith(
              body1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              body2: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              title: TextStyle(
                fontSize: 20,
                fontFamily: "RobotoCondensed",
                fontWeight: FontWeight.bold,
              ))),
      home: CategoriesPage(),
    );
  }
}
