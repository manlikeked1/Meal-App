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

  String get complexityText {
    //Due to the fact that 'Complexity' is an enum. I can't call it directly so I have to use a 'get' function to call it
    switch (complexity) {
      //Here, I used a switch-case function in place of an 'if' function
      case Complexity.Simple:
        return 'Simple';
        break;
      case Complexity.Challenging:
        return 'Challenging';
        break;
      case Complexity.Hard:
        return 'Difficult';
        break;
      default:
        return 'Unknown';
    }
  }

  String get affordabilityText {
    //Due to the fact that 'Affordability' is an enum. I can't call it directly so I have to use a 'get' function to call it
    switch (affordability) {
      //Here, I used a switch-case function in place of an 'if' function
      case Affordability.Affordable:
        return 'Affordable';
        break;
      case Affordability.Pricey:
        return 'Moderate';
        break;
      case Affordability.Luxurious:
        return 'Expensive';
        break;
      default:
        return 'Unknown';
    }
  }

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
                      imageUrl, //This is used because we are getting our images from a web url on the internet. If we were getting it from the computer directlty, we would said "image.assets" instead of "image.network"
                      height: 250,
                      width: double.infinity,
                      fit: BoxFit
                          .cover), //The boxfit.cover argument helps to resize and crop the image so that it fits nicely into the container
                ),
                Positioned(
                  //This is an inbuilt dart function that is used to give specific positions
                  bottom:
                      20, //Here, I;m telling flutter that I want the object to be 20px to the bottom
                  right:
                      10, //Here, I;m telling flutter that I want the object to be 10px to the right
                  child: Container(
                    width: 300, //This is the width of the container
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    decoration: BoxDecoration(
                      //This allows me to style the object by giving it a 'border radius' and a background color
                      borderRadius: BorderRadius.circular(20),
                      color: Colors
                          .black54, //This gives it a background color of 'black54' the 54 means that the color, black has an opacity of 54
                    ),
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 26,
                        color: Colors.white,
                      ),
                      softWrap:
                          true, //In case the text is too long for the card container, it helps to wrap it
                      overflow: TextOverflow
                          .clip, //In case this does not fit into its box even with wrapping, the text will simply just fade out and not overflow
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment
                    .spaceAround, //This is an in built flutter enum.
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(Icons.schedule),
                      SizedBox(
                        //This is used to give a certain distance between objects
                        width: 6,
                      ),
                      Text(
                          '$duration min'), //Using string interpolation ($). I used string interpolation here because duration is expressed as an integer in its normal form but it needs to be passed as a string here
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(Icons.work), //This is an in built flutter icon
                      SizedBox(
                        //This is used to give a certain distance between objects
                        width: 6,
                      ),
                      Text(
                          complexityText), //Here I used the complexity getter that was created above
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(Icons
                          .attach_money), //This is an in built flutter icon
                      SizedBox(
                        //This is used to give a certain distance between objects
                        width: 6,
                      ),
                      Text(
                          affordabilityText), //Here I used the affordability getter that was created above
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
