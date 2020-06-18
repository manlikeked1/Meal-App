import 'package:flutter/material.dart';

class FiltersScreen extends StatelessWidget {
  static const routeName = '/FiltersScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
      ),
      body: Center(
        child: Text(
          'Filters!',
          style: TextStyle(color: Colors.white, fontSize: 25),
        ),
      ),
      //   Container(
      //   child: Text('Filters!'),
      // ),
    );
  }
}
