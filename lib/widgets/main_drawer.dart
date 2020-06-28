import 'package:flutter/material.dart';

import '../screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  //Using a builder method to create ListTiles
  Widget buildListTile(String title, IconData icon, Function tapHandler) {
    //Here we passed two arguments into the builder, 'title' and 'icon'
    return ListTile(
      leading: Icon(
        icon, //Here, we placed the 'icon' argumrnt
        size: 24,
        color: Colors.white, //This is the size of the icon
      ),
      title: Text(
        title, //Here we placed the 'title' argument
        style: TextStyle(
            fontFamily: 'RobotoCondensed',
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 120, //This gives the height of the container
            width: double
                .infinity, //This allows the container to take the full width of the screen
            padding: EdgeInsets.all(20), //This gives a padding of 20 all around
            alignment: Alignment.bottomCenter,
            // color: Theme.of(context).accentColor,//This gives the background color to the container
            decoration: BoxDecoration(
                color: Theme.of(context).accentColor,
                borderRadius: BorderRadius.circular(
                    10)), //This is a feature on flutter that helps you to add more than one form of decoration
            child: Text(
              'Cooking Up!',
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 30,
                  color: Theme.of(context).primaryColor),
            ),
          ),
          SizedBox(height: 25), //This helps to give a spacing
          //Using the 'buildListTile' method to pass in 'meals' for the first ListTile and 'icons.restaurant' for the second ListTile
          buildListTile('Meals', Icons.restaurant, () {
            Navigator.of(context).pushReplacementNamed(
                '/'); //The '/' here is used becuase the categoryPage is the main route
          }),
          buildListTile('Filters', Icons.settings, () {
            Navigator.of(context).pushReplacementNamed(FiltersScreen
                .routeName); //'pushReplacementNamed' is used in place of 'pushedNamed' because I was trying to avoid stacking pages on top of one another. Instead, I just replaced the page with the previous one
          }),
        ],
      ),
    );
  }
}
