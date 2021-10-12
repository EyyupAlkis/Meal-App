import 'package:flutter/material.dart';

import '/models/meal.dart';
import '/views/pages/meal_detail_page.dart';

class MealItem extends StatelessWidget {
  final Meal meal;
  final Function removeItemCallback;
  const MealItem({
    Key? key,
    required this.meal,
    required this.removeItemCallback,
  }) : super(key: key);

  String get complexityText {
    String comp = "Easy";
    switch (meal.complexity) {
      case Complexity.Simple:
        comp = "Simple";
        break;
      case Complexity.Challenging:
        comp = "Challenging";
        break;
      case Complexity.Hard:
        comp = "Hard";
        break;
    }
    return comp;
  }

  String get affordabilityText {
    String comp = "Unknown";
    switch (meal.affordability) {
      case Affordability.Affordable:
        comp = "Affordable";
        break;
      case Affordability.Pricey:
        comp = "Pricey";
        break;
      case Affordability.Luxurious:
        comp = "Luxurious";
        break;
    }
    return comp;
  }

  @override
  Widget build(BuildContext context) {
    void selectMeal() {
      Navigator.of(context)
          .pushNamed(
        MealDetail.routeName,
        arguments: meal,
      )
          .then((value) {
        if (value != null) {
          removeItemCallback(value);
        }
      });
    }

    return InkWell(
      onTap: selectMeal,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    meal.imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(4)),
                    child: Container(
                      color: Colors.black54,
                      width: 300,
                      padding: const EdgeInsets.symmetric(
                          vertical: 4, horizontal: 16),
                      child: Text(
                        meal.title,
                        style: const TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                        ),
                        softWrap: true,
                        overflow: TextOverflow.fade,
                      ),
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.schedule),
                      const SizedBox(width: 6),
                      Text('${meal.duration} min')
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.work),
                      const SizedBox(width: 6),
                      Text(complexityText)
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.attach_money),
                      const SizedBox(width: 6),
                      Text(affordabilityText)
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
