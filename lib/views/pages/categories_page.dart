import 'package:flutter/material.dart';

import '/constants/dummy_data.dart';
import '/views/widgets/category_item.dart';

class CategoriesPage extends StatelessWidget {
  static String routeName = "/home";
  const CategoriesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(25),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      children: dummyCategories.map((data) {
        return CategoryItem(
          id: data.id,
          title: data.title,
          color: data.color,
        );
      }).toList(),
    );
  }
}
