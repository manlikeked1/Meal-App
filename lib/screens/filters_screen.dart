import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/FiltersScreen';

  //'SaveFilters' Function
  final Function saveFilters;

  //'CurrentFilters' Function
  final Map<String, bool> currentFilters;

  //'SaveFilters' and 'CurrentFilters' Constructor
  FiltersScreen(this.currentFilters, this.saveFilters);

  // FiltersScreen(this.currentFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  //Here, a builder widget is used instead of repeating ...
  //the code in mutiple places.
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

  //This sets the initial state when the state gets creates
  @override
  void initState() {
    _glutenFree = widget.currentFilters['gluten'];
    _lactoseFree = widget.currentFilters['lactose'];
    _vegetarian = widget.currentFilters['vegetarian'];
    _vegan = widget.currentFilters['vegan'];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),

        //In the aspect of the 'onPressed', you can reach out to your widgete using the
        //Special Widget Property
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final selectedFilters = {
                'gluten': _glutenFree,
                'lactose': _lactoseFree,
                'vegan': _vegan,
                'vegetarian': _vegetarian,
              };
              widget.saveFilters(selectedFilters);
            },
          )
        ],
      ),
      drawer: MainDrawer(), //Adding a drawer in the filters screen
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection.',
              // style: Theme.of(context).textTheme.title,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontFamily: "RobotoCondensed"),
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
                //This is what the builder widget does. It allows what has...
                //been created above to be called
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

                //This is what the builder widget does. It allows what has...
                //been created above to be called
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

                //This is what the builder widget does. It allows what has...
                //been created above to be called
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

                //This is what the builder widget does. It allows what has...
                //been created above to be called
                _buildSwitchListTile(
                    'Lactose-free',
                    'Only include lactose-free meals.',
                    _lactoseFree, (newValue) {
                  setState(() {
                    _lactoseFree = newValue;
                  });
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
