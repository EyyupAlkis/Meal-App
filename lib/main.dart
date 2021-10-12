import 'package:flutter/material.dart';

import '/views/pages/categories_page.dart';
import '/views/pages/category_meals_page.dart';
import '/views/pages/favorites_page.dart';
import '/views/pages/filters_page.dart';
import '/views/pages/meal_detail_page.dart';
import '/views/pages/tabs_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: Theme.of(context).appBarTheme.copyWith(color: Colors.pink),
        colorScheme:
            Theme.of(context).colorScheme.copyWith(secondary: Colors.amber),
        primarySwatch: Colors.pink,
        primaryColor: Colors.pink,
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: const TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodyText2: const TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              headline6: const TextStyle(
                  fontSize: 20,
                  fontFamily: 'RobotoCondensed',
                  fontWeight: FontWeight.bold),
            ),
      ),
      initialRoute: TabsPage.routeName,
      routes: {
        TabsPage.routeName: (ctx) => TabsPage(),
        FiltersPage.routeName: (ctx) => FiltersPage(),
        FavoritesPage.routeName: (ctx) => const FavoritesPage(),
        CategoriesPage.routeName: (ctx) => const CategoriesPage(),
        CategoryMealsPage.routeName: (ctx) => const CategoryMealsPage(),
        MealDetail.routeName: (ctx) => const MealDetail()
      },
      // @onGenerateRoute executes for any unregistered named route, @onUnknownRoute
      //executes if onGenerateRoute is not defined or does not return valid navigation action
      // onGenerateRoute: (settings) {
      //   return MaterialPageRoute(builder: (ctx) => CategoriesPage());
      // },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (ctx) => CategoriesPage());
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DeliMeals'),
      ),
      body: const Center(child: Text('Navigation Time!')),
    );
  }
}
