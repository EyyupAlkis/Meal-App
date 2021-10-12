import 'package:flutter/material.dart';

class FavoritesPage extends StatelessWidget {
  static String routeName = "/favorites";
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Favorites'));
  }
}
