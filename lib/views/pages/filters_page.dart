import 'package:flutter/material.dart';

import '/views/widgets/main_drawer.dart';

class FiltersPage extends StatefulWidget {
  static String routeName = '/filters';
  const FiltersPage({Key? key}) : super(key: key);

  @override
  State<FiltersPage> createState() => _FiltersPageState();
}

class _FiltersPageState extends State<FiltersPage> {
  bool _isGlutenFree = false;
  bool _isVegetarian = false;
  bool _isVegan = false;
  bool _isLactoseFree = false;
  @override
  Widget build(BuildContext context) {
    Widget _buildSwitchTile(
      String title,
      String subtitle,
      bool currentValue,
      Function(bool)? updateValue,
    ) {
      return SwitchListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        value: currentValue,
        onChanged: updateValue,
      );
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Filters')),
      drawer: MainDrawer(),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                'Adjust meal  selection',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            Expanded(
                child: ListView(
              children: [
                _buildSwitchTile(
                    'Gluten-free',
                    'Only include gluten-free meals',
                    _isGlutenFree, (newValue) {
                  setState(() {
                    _isGlutenFree = newValue;
                  });
                }),
                _buildSwitchTile(
                  'Vegetarian',
                  'Only include vegetarian meals',
                  _isVegetarian,
                  (newValue) {
                    setState(() {
                      _isVegetarian = newValue;
                    });
                  },
                ),
                _buildSwitchTile('Vegan', 'Only include vegan meals', _isVegan,
                    (newValue) {
                  setState(() {
                    _isVegan = newValue;
                  });
                }),
                _buildSwitchTile(
                    'Lactose-free',
                    'Only include lactose-free meals',
                    _isLactoseFree, (newValue) {
                  setState(() {
                    _isLactoseFree = newValue;
                  });
                }),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
