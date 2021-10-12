import 'package:flutter/material.dart';

import '/constants/dummy_data.dart';
import '/models/meal.dart';
import '/views/widgets/meal_item.dart';

class CategoryMealsPage extends StatefulWidget {
  static String routeName = "/category-meal";
  const CategoryMealsPage({
    Key? key,
  }) : super(key: key);

  @override
  State<CategoryMealsPage> createState() => _CategoryMealsPageState();
}

class _CategoryMealsPageState extends State<CategoryMealsPage> {
  String? categoryId;
  late List<Meal> categoryMeals;
  String? categoryTitle;
  var _loadedInitData = false;

  @override
  void didChangeDependencies() {
    if (_loadedInitData) {
      var routeArgs =
          ModalRoute.of(context)?.settings.arguments as Map<String, String>;
      categoryId = routeArgs['id'];
      categoryMeals = dummyMeals
          .where((element) => element.categories.contains(categoryId ?? ""))
          .toList();
      categoryTitle = routeArgs['title'];
      _loadedInitData = true;
    }

    super.didChangeDependencies();
  }

  void _removeItemCallback(String id) {
    setState(() {
      categoryMeals.removeWhere((element) => element.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(categoryTitle ?? "Meals")),
      body: SafeArea(
        child: Container(
          child: ListView.builder(
            itemCount: categoryMeals.length,
            itemBuilder: (context, index) {
              return MealItem(
                meal: categoryMeals[index],
                removeItemCallback: _removeItemCallback,
              );
            },
          ),
        ),
      ),
    );
  }
}
