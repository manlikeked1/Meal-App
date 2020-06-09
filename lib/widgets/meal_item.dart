import 'package:flutter/material.dart';

import '../models/meal.dart';

class MealItem extends StatelessWidget {
  final String title; //properties
  final String imageUrl; //properties
  final int duration; //properties
  final Complexity complexity; //properties
  final Affordability affordability; //properties

  MealItem(
      {@required
          this.title,
      @required
          this.imageUrl,
      @required
          this.affordability,
      @required
          this.complexity,
      @required
          this.duration}); //this is a constructor which uses named arguments

  void selectMeal() {} //this is a method

  @override
  Widget build(BuildContext context) {
    return InkWell(
      //Inkwell  is used to have a clickable item which has a ripple effect
      onTap: selectMeal,
      child: Card(
        shape: RoundedRectangleBorder(
          //Here, I was able to override the default shape of a card by giving it a 'RoundedRectangularBorder'
          borderRadius: BorderRadius.circular(
              15), //Here I gave the RoundedRectangularBorder a borderRdius.circular of 15
        ),
        elevation:
            4, //I gave the card an elevation of 4 in oder to give it a shadow
        margin: EdgeInsets.all(
            10), //I gave it a margin of EdgeInsects.all(10) so that I can have more margin around each element
        child: Column(
          //this is used to have multiple widgets on top of each other
          children: <Widget>[
            //column takes a children widget where I provide a list of widgets that should be part of the column
            Stack(
              //this is a built in widget that allows us to add items on top of ech other in a three dimensional space
              children: <Widget>[
                ClipRRect(
                  //This is a helper widget which is part of flutter. This is used to force a widget as a child into a certain form
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                  child: Image.network(
                      imageUrl, //this is used because we are getting our images from a web url on the internet. If we were getting it from the computer directlty, we would said "image.assets" instead of "image.network"
                      height: 250,
                      width: double.infinity,
                      fit: BoxFit
                          .cover), //The boxfit.cover argument helps to resize and crop the image so that it fits nicely into the container
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
