import 'package:flutter/material.dart';

class MealDetailPage extends StatelessWidget {
  static const routeName =
      '/meal-detail'; //This creates a static const which is used for the routeNmae navigation

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments
        as String; //The arguments object is attached to the icoming route/navigation
    return Scaffold(
      //Always have a scaffold on each screen/page. It helps to make use of the material dart feature.
      appBar: AppBar(
        //Also ensure to have the appBar on each screen/page
        title: Text('$mealId'),
      ),
      body: Center(
        child: Text('The meal - $mealId'),
      ),
    );
  }
}
