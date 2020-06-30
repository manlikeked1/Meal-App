import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

import '../screens/favorites_page.dart';
import '../screens/categories_page.dart';

class TabsScreen extends StatefulWidget {
  static const routeName = '/tabs';
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Map<String, dynamic>> _pages = [
    //List o widgets that you want to render in each tab
    {'page': CategoriesPage(), 'title': 'Categories'},
    {
      'page': FavoritesPage(),
      'title': 'Favorites Section',
    }
  ];

  int _selectedPageIndex =
      0; //THis is a property which is an integer which is '0' initially

  void _selectPage(int index) {
    //This is the method that 'ontap' listener uses
    setState(() {
      //I called setState which is why I used a stateful widget instead of a stateless widget. The setState is used because we will manually switch that index
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This is for creating a tab bar that is creatred at the bottom of an application
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title']),
      ),
      drawer:
          MainDrawer(), //Here, I placed the drawer in the 'tabs screen' because this the defaukt screen
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
          //This is what a tab bar at the bottom is called
          //For the 'bottomNavigationBar' you manually have to control what the user selected and which content you want to display
          onTap:
              _selectPage, //This is an 'onTap' listener and it is triggered whenever an item is selected
          backgroundColor: Theme.of(context).primaryColor,
          unselectedItemColor: Colors.white,
          selectedItemColor: Theme.of(context).accentColor,
          currentIndex:
              _selectedPageIndex, //This tells the bottomNavigationBar which tab is actually selected
          selectedFontSize: 15,
          unselectedFontSize: 10,
          // type: BottomNavigationBarType.shifting,//For animation
          items: [
            BottomNavigationBarItem(
              //This is just a tab
              backgroundColor: Theme.of(context)
                  .primaryColor, //Used when adding the animation 'shifting'
              icon: Icon(Icons.category), //An Icon
              title: Text(
                  'Categories'), //The title now is a widget and not a plain text
            ),
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context)
                  .primaryColor, //Used when adding the animation 'shifting'
              icon: Icon(Icons.star),
              title: Text('Favorites'),
            )
          ]),

      //FloatingActionButton used to return to the 'Home Screen'
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed('/');
        },
        child: Icon(Icons.home),
      ),
    );
  }
}

// This is for creating a tab bar that is creatred at the top of an application
// return DefaultTabController(
//This is responsible for adding a 'Tab Bar' at the top of the project, just beneath the appbar
// length:
// 2, //This helps us to defiine the amount of tabs that we want in the project. Hence the number 2, which means that we want 2 tabs
// initialIndex: 0,
// child: Scaffold(
//       appBar: AppBar(
//           title: Text('Meals'),
//           bottom: TabBar(tabs: <Widget>[
//             Tab(
//                 icon: Icon(Icons.category),
//                 text:
//                     'Categories'), //This is responsible for the Categories tab. This feature is an inbuilt feature in flutter
//             Tab(
//                 icon: Icon(Icons.star),
//                 text:
//                     'Favorites'), //This is responsible for the Favorites tab. This feature is an inbuilt feature in flutter
//           ])),
//       body: TabBarView(children: <Widget>[
//         CategoriesPage(),
//         FavoritesPage()
//       ]), //Note: Always arrange the screens in the way in which you want them to be arranged. Let the arrangement here correspond with yur arrangement in yoor 'tab()' section above
//     ),
//   );
// }
