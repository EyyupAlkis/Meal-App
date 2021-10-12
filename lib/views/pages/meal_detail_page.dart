import 'package:flutter/material.dart';

import '/models/meal.dart';

class MealDetail extends StatelessWidget {
  static String routeName = "/meal-detail";
  const MealDetail({Key? key}) : super(key: key);

  Widget buildTitleSection(BuildContext context, String title) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }

  Widget buildInfoContainer(Widget child) {
    return Container(
      height: 200,
      width: 300,
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context)?.settings.arguments as Meal;
    return Scaffold(
      appBar: AppBar(
        title: Text(routeArgs.title),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 300,
                width: double.infinity,
                child: Image.network(
                  routeArgs.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              buildTitleSection(context, "Ingredients"),
              buildInfoContainer(
                ListView.builder(
                  itemCount: routeArgs.ingredients.length,
                  itemBuilder: (context, index) => Card(
                    color: Colors.green.shade100,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      child: Text(routeArgs.ingredients[index]),
                    ),
                  ),
                ),
              ),
              buildTitleSection(context, "Steps"),
              buildInfoContainer(
                ListView.builder(
                  itemCount: routeArgs.steps.length,
                  itemBuilder: (context, index) => Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          child: Text('# ${index + 1}'),
                        ),
                        title: Text(routeArgs.steps[index]),
                      ),
                      const Divider()
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.delete),
        onPressed: () => Navigator.of(context).pop(routeArgs.id),
      ),
    );
  }
}
