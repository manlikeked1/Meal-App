import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class FiltersScreen extends StatelessWidget {
  static const routeName = '/FiltersScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
      ),
      drawer: MainDrawer(), //Adding a drawer in the filters screen
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
