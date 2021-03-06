//This whole screen represents the homepage of the application.

import 'package:flutter/material.dart';

import '../screens/tabs_screen.dart';
// import '../screens/home_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomPaint(
        painter: PurplePainter(),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  // color: Theme.of(context).,
                ),
                child: Text('Welcome!',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 45,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RaisedButton(
                  color: Colors.purple.shade700,
                  textColor: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  elevation: 20,
                  // highlightElevation: 10,
                  shape: Border.all(width: 2, color: Colors.white),
                  onPressed: () {
                    Navigator.of(context).pushNamed(TabsScreen.routeName);
                  },
                  child: Text('Go To Meals'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// final provider = BlocProvider.of<ModelBloc>(context).provider;
class PurplePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final height = size.height;
    final width = size.width;
    Paint paint = Paint();

    //Path for the color of the screen
    Path mainBackground = Path();
    mainBackground.addRect(Rect.fromLTRB(0, 0, width, height));
    paint.color = Colors.purple.shade700;
    canvas.drawPath(mainBackground, paint);

    //Path for the oval
    Path ovalPath = Path();
    // Start paint from 20% height to the left
    ovalPath.moveTo(0, height * 0.2);
    // Print a curve from current position to middle of the screen
    ovalPath.quadraticBezierTo(
        width * 0.55, height * 0.25, width * 0.2, height * 0.5);

    // Path a curve from current position to bottom left of screen at width * 0.1
    ovalPath.quadraticBezierTo(width * 0.99, height * 0.8, width * 0.1, height);

    // Draw remaining line to bottom left side
    ovalPath.lineTo(0, height);

    //Close line to reset it back
    ovalPath.close();

    paint.color = Colors.purple.shade500;
    canvas.drawPath(ovalPath, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}
