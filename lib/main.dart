import 'package:flutter/material.dart';

import './screens/filters_screen.dart';
import './screens/tabs_screen.dart';
import './screens/meal_detail_page.dart';
import './screens/category_meals_page.dart';
// import './screens/categories_page.dart';

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
                color: Colors.white70,
                fontSize: 20,
                fontFamily: "RobotoCondensed",
                fontWeight: FontWeight
                    .bold, //This provides the font weight texttheme title
              ))),
      // home:
      //     CategoriesPage(), //This makes the Category Screen/Page to become the homepage
      initialRoute: '/', //The default value is '/'
      routes: {
        //Using named routes is more preferable//This is a route table
        '/': (ctx) =>
            TabsScreen(), //This also makes the Tabs Screen/Page to become the homepage but this method is used in the 'named route' method
        CategoryMealsPage.routeName: (ctx) => CategoryMealsPage(),
        MealDetailPage.routeName: (ctx) => MealDetailPage(),
        FiltersScreen.routeName: (ctx) => FiltersScreen(),
      }, //This 'routes' feature helps to set up routes easily. It is better to set up routes like this incase the project you're working on is a large one.
      // onGenerateRoute: (settings) {
      //   print(settings.arguments)
      //   return MaterialPageRoute(builder: (ctx) => CategoriesPage())
      // },//This takes a function. This is used in scenarios where you build highly dynamic applications  where you have route names that are generated dynamically during the lifetime of the app and hence you can know them in advance when you building the app
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (ctx) => TabsScreen());
      }, //This does not take a function. It also takes a anonymous function
      //'onUnknownRoute' is reached when flutter failed to build a page or screen with all other measures
      //In other words, when you define nothing as a root route, if you don't use 'onGenerateRoute' then in the end as a last resort before it throws an error, Flutter will try to use onUknownRoute to show something on the screen
      //So basically, this provides some sort of fallback. Either a generic starting page or some we couldnt't find page such as a '404' fallback page in the web
    );
  }
}
