import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/FiltersScreen';

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  Widget _buildSwitchListTile(
    String title,
    String description,
    bool currentValue,
    Function updateValue,
  ) {
    return SwitchListTile(
      inactiveTrackColor: Colors.red,
      // activeTrackColor: Colors.b,
      activeColor: Colors.green,
      secondary: Icon(
        Icons.restaurant_menu,
        color: Colors.white,
      ),
      title: Text(title),
      value: currentValue,
      subtitle: Text(description),
      onChanged: updateValue,
    );
  }

  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
      ),
      drawer: MainDrawer(), //Adding a drawer in the filters screen
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection.',
              style: Theme.of(context).textTheme.title,
              // style: TextStyle(color: Colors.white),
            ),
          ),
          Divider(
            //This provides each item with a division line
            color: Theme.of(context)
                .accentColor, //This gives the division line a ThemeColor of the accent color.
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                _buildSwitchListTile('Gluten-free',
                    'Only include gluten-free meals.', _glutenFree, (newValue) {
                  setState(() {
                    _glutenFree = newValue;
                  });
                }),
                Divider(
                  //This provides each item with a division line
                  color: Theme.of(context)
                      .accentColor, //This gives the division line a ThemeColor of the accent color.
                ),
                _buildSwitchListTile(
                    'Vegetarian', 'Only include vegetarian meals.', _vegetarian,
                    (newValue) {
                  setState(() {
                    _vegetarian = newValue;
                  });
                }),
                Divider(
                  //This provides each item with a division line
                  color: Theme.of(context)
                      .accentColor, //This gives the division line a ThemeColor of the accent color.
                ),
                _buildSwitchListTile(
                    'Vegan', 'Only include vegan meals.', _vegan, (newValue) {
                  setState(() {
                    _vegan = newValue;
                  });
                }),
                Divider(
                  //This provides each item with a division line
                  color: Theme.of(context)
                      .accentColor, //This gives the division line a ThemeColor of the accent color.
                ),
                _buildSwitchListTile(
                    'Lactose-free',
                    'Only include lactose-free meals.',
                    _lactoseFree, (newValue) {
                  setState(() {
                    _lactoseFree = newValue;
                  });
                  // Divider(
                  //   //This provides each item with a division line
                  //   color: Theme.of(context)
                  //       .accentColor, //This gives the division line a ThemeColor of the accent color.
                  // );
                }),
              ],
            ),
          )
        ],
      ),
      //   Container(
      //   child: Text('Filters!'),
      // ),
    );
  }
}
