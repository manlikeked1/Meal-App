//This whole screen represents the homepage of the application.

import 'package:flutter/material.dart';
// import 'package:meal_app/screens/favorites_page.dart';

import '../screens/favorites_page.dart';
import '../screens/categories_page.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Map<String, dynamic>> _pages = [
    {'page': CategoriesPage(), 'title': 'Categories'},
    {'page': FavoritesPage(), 'title': 'Favorites Section'}
  ];

  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
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
        body: _pages[_selectedPageIndex]['page'],
        bottomNavigationBar: BottomNavigationBar(
            onTap: _selectPage,
            backgroundColor: Theme.of(context).primaryColor,
            unselectedItemColor: Colors.white,
            selectedItemColor: Theme.of(context).accentColor,
            currentIndex: _selectedPageIndex,
            selectedFontSize: 15,
            unselectedFontSize: 10,
            // type: BottomNavigationBarType.shifting,//For animation
            items: [
              BottomNavigationBarItem(
                backgroundColor: Theme.of(context)
                    .primaryColor, //Used when adding the animation 'shifting'
                icon: Icon(Icons.category),
                title: Text('Categories'),
              ),
              BottomNavigationBarItem(
                backgroundColor: Theme.of(context)
                    .primaryColor, //Used when adding the animation 'shifting'
                icon: Icon(Icons.star),
                title: Text('Favorites'),
              )
            ])

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
        );
  }
}
