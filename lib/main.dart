import 'package:flutter/material.dart';
// import 'package:meal_app/screens/categories_page.dart';

import './dummy_data.dart';
import './screens/filters_screen.dart';
import './screens/tabs_screen.dart';
import './screens/meal_detail_page.dart';
import './screens/category_meals_page.dart';
import './screens/home_screen.dart';
import './models/meal.dart';
// import './screens/categories_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favoriteMeal = [];

  //Method
  //This method should be called from inside the 'Filter's Screen'
  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;

      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['gluten'] == true && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['lactose'] == true && !meal.isLactoseFree) {
          return false;
        }
        if (_filters['vegan'] == true && !meal.isVegan) {
          return false;
        }
        if (_filters['vegetarian'] == true && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _toggleFavorite(String mealId) {
    final existingIndex = _favoriteMeal.indexWhere((meal) => meal.id == mealId);
    if (existingIndex >= 0) {
      setState(() {
        _favoriteMeal.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favoriteMeal.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
      });
    }
  }

  bool _isMealFavorite(String id) {
    return _favoriteMeal.any((meal) => meal.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'KedMeals',
      theme: ThemeData(
          // brightness: Brightness.dark,

          //This provides the primary color of the app
          primarySwatch: Colors.indigo,
          // accentColor: Colors.amberAccent,

          //Provides the app with a dark mode
          canvasColor: Colors.black87,

          //Default Font-family
          fontFamily: "Raleway",

          //Default text-theme
          textTheme: ThemeData.dark().textTheme.copyWith(
              body1: TextStyle(
                color: Color.fromRGBO(
                    20, 51, 51, 1), //This gives the color gradient
              ),
              body2: TextStyle(
                color: Color.fromRGBO(
                    20, 51, 51, 1), //This gives the color gradient
              ),
              title: TextStyle(
                color: Colors.white,
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
            HomeScreen(), //This also makes the Tabs Screen/Page to become the homepage but this method is used in the 'named route' method
        CategoryMealsPage.routeName: (ctx) =>
            CategoryMealsPage(_availableMeals),
        MealDetailPage.routeName: (ctx) =>
            MealDetailPage(_toggleFavorite, _isMealFavorite),
        FiltersScreen.routeName: (ctx) => FiltersScreen(_filters, _setFilters),
        TabsScreen.routeName: (ctx) => TabsScreen(_favoriteMeal),
        // CategoriesPage.routeName: (ctx) => CategoriesPage(),
      }, //This 'routes' feature helps to set up routes easily. It is better to set up routes like this incase the project you're working on is a large one.
      // onGenerateRoute: (settings) {
      //   print(settings.arguments)
      //   return MaterialPageRoute(builder: (ctx) => CategoriesPage())
      // },//This takes a function. This is used in scenarios where you build highly dynamic applications  where you have route names that are generated dynamically during the lifetime of the app and hence you can know them in advance when you building the app
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (ctx) => TabsScreen(_favoriteMeal));
      }, //This does not take a function. It also takes a anonymous function
      //'onUnknownRoute' is reached when flutter failed to build a page or screen with all other measures
      //In other words, when you define nothing as a root route, if you don't use 'onGenerateRoute' then in the end as a last resort before it throws an error, Flutter will try to use onUknownRoute to show something on the screen
      //So basically, this provides some sort of fallback. Either a generic starting page or some we couldnt't find page such as a '404' fallback page in the web
    );
  }
}
