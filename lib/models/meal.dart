import 'package:flutter/foundation.dart'; //This package helps to unclock the "@required" function

enum Complexity {
  Simple, //Now behind the scenes, what dart does is to map the different values to normal integers
  Challenging,
  Hard,
} // These are enums, they are created to help you create a type that aids to create a choice among a couple of alternatives and always give the enum a name. For example, here we gave it a name of 'Complexity'

enum Affordability {
  Affordable,
  Pricey,
  Luxurious
} // These are enums, they are created to help you create a type that aids to create a choice among a couple of alternatives and always give the enum a name. For example, here we gave it a name of 'Affordability'

class Meal {
  final String id;
  final List<String> categories;
  final String title;
  final String imageUrl;
  final List<String> ingredients;
  final List<String> steps;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  final bool isGlutenFree;
  final bool isLactoseFree;
  final bool isVegan;
  final bool isVegetarian;

  const Meal(
      {@required this.id,
      @required this.categories,
      @required this.title,
      @required this.imageUrl,
      @required this.affordability,
      @required this.complexity,
      @required this.duration,
      @required this.ingredients,
      @required this.isGlutenFree,
      @required this.isLactoseFree,
      @required this.isVegan,
      @required this.isVegetarian,
      @required this.steps});
}
