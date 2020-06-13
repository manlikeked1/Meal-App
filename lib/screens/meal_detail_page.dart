import 'package:flutter/material.dart';

import '../dummy_data.dart';

class MealDetailPage extends StatelessWidget {
  static const routeName =
      '/meal-detail'; //This creates a static const which is used for the routeNmae navigation

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments
        as String; //The arguments object is attached to the icoming route/navigation
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);

    return Scaffold(
        //Always have a scaffold on each screen/page. It helps to make use of the material dart feature.
        appBar: AppBar(
          //Also ensure to have the appBar on each screen/page
          title: Text(
              '${selectedMeal.title}'), //we add curly are required because we don't just refer to a single variable but we have a little bit more complex expression. So therefore we use a dot notation here and that only works with curly braces around it
        ),
        body: SingleChildScrollView(
          //This ensures that the whole 'Column' is scrollable
          child: Column(
            //This helps to arrange diffrent parts of a page/screen one after the other
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white54),
                margin: EdgeInsets.symmetric(vertical: 10),
                //This is the container for the image
                height: 400, //This gives it a height of 400
                width: double
                    .infinity, //This ensures that it takes the full width of the screen/page
                child: Image.network(
                  selectedMeal.imageUrl,
                  fit: BoxFit.contain, //It's a feature on flutter
                ),
              ),
              Container(
                //This conatiner is for the INGREDIENTS
                margin: EdgeInsets.symmetric(
                    vertical:
                        20), //This gives a margin of edgeinsts.symmetrical(vertical:20, horizontal:null)
                child: Text(
                  'Ingredients:',
                  style: Theme.of(context).textTheme.title,
                ),
              ),
              Container(
                //This conatiner is for the INGREDIENTS
                decoration: BoxDecoration(
                    //This is required to make the user know that the list is scrollable. It's a decoration feature
                    color: Colors
                        .white, //This gives the container a background color of white
                    border: Border.all(
                        color: Colors
                            .grey), //Provides a border for the container and a color for the border to be grey
                    borderRadius: BorderRadius.circular(
                        10)), //Gives it a border radius of circular
                margin: EdgeInsets.all(10), //
                padding: EdgeInsets.all(10),
                height: 200,
                width: 400,
                // width: double.infinity,
                child: ListView.builder(
                  //We used a list view builder because it helps when the list we're passing is a long one
                  itemBuilder: (ctx, index) => Card(
                    //The listview builder requires an item builder. Here, we made use of a card
                    color: Theme.of(context).accentColor,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      child: Text(selectedMeal.ingredients[index]),
                    ),
                  ),
                  itemCount: selectedMeal.ingredients
                      .length, //This enables the listview to know what it is passsing and to take note of the number of items in it
                ),
              ),
              Container(
                //This conatiner is for the STEPS
                margin: EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  'Steps:',
                  style: Theme.of(context).textTheme.title,
                ),
              ),
              Container(
                //This conatiner is for the STEPS
                decoration: BoxDecoration(
                    //This is required to make the user know that the list is scrollable. It's a decoration feature
                    // color: Theme.of(context).accentColor,
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10)),
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                height: 400,
                width: 400,
                // width: double.infinity,
                child: ListView.builder(
                  itemBuilder: (ctx, index) => Column(
                    children: <Widget>[
                      ListTile(
                        //We used a list tile here because on the list we two features which are the numbers and the texts
                        leading: CircleAvatar(
                          child: Text(
                              '# ${(index + 1)}'), //THis tile is for the numbers.The 'index + 1' ensures that the list starts from 1 and not from 0.
                        ),
                        title: Text(selectedMeal
                            .steps[index]), //This tile is for the texts
                      ),
                      Divider(
                        //This provides each item with a division line
                        color: Theme.of(context)
                            .accentColor, //This gives the division line a ThemeColor of the accent color.
                      )
                    ],
                  ),
                  itemCount: selectedMeal.steps.length,
                ),
              ),
            ],
          ),
        ));
  }
}
