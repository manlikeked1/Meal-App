import 'package:flutter/material.dart';
import './category_item.dart';
import './dummy_data.dart';

class CategoriesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Basic-Meals'), //Title that appears on the appBar
      ),
      body: GridView(
        padding: const EdgeInsets.all(20), //Provides an all round padding of 20
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            // Special function in flutter that helps to arrange items in grid form
            maxCrossAxisExtent:
                300, //Gives each item a max cross axis extent of width 300px
            childAspectRatio:
                3 / 2, //Gives a ratio of 3 to 2,i.e, 300 width, 200 height
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
        children: DUMMY_CATEGORIES
            .map((catData) => CategoryItem(
                  //Mapping function
                  catData
                      .title, //This provides a mapping function to the 'title' in 'Dummy Data'
                  catData
                      .color, //This provides a mapping function to the 'color' in 'Dummy Data'
                ))
            .toList(),
      ),
    );
  }
}
