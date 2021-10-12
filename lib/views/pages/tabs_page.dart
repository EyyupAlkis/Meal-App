import 'package:flutter/material.dart';

import '../pages/categories_page.dart';
import '../pages/favorites_page.dart';
import '../widgets/main_drawer.dart';

class TabsPage extends StatefulWidget {
  static String routeName = "/tabs-page";
  int _selectedPageIndex = 0;

  TabsPage({Key? key}) : super(key: key);

  @override
  _TabsPageState createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage> {
  @override
  Widget build(BuildContext context) {
    final List<Widget> _pages = [CategoriesPage(), FavoritesPage()];
    final List<String> _titles = ["Meal Types", "Your Favs"];
    void _selectPage(int index) {
      setState(() {
        widget._selectedPageIndex = index;
      });
    }

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(_titles[widget._selectedPageIndex]),
        ),
        drawer: MainDrawer(),
        body: _pages[widget._selectedPageIndex],
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Theme.of(context).primaryColor,
          unselectedItemColor: Colors.grey.shade300,
          selectedItemColor: Colors.amber.shade300,
          currentIndex: widget._selectedPageIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.category),
              label: 'Categories',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.star),
              label: 'Favorites',
            ),
          ],
          onTap: _selectPage,
        ),
      ),
    );
  }
}
