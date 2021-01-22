import 'package:flutter/material.dart';
import '../screens/meal_detail_screen.dart';

import '../models/meal.dart';

class MealItem extends StatelessWidget {
  // final String title;
  // final String imageurl;
  // final int duration;
  // final Complexity complexity;
  // final Affordability affordability;
  final Meal mealInfo;

  // MealItem(
  //     {this.title,
  //     this.imageurl,
  //     this.duration,
  //     this.complexity,
  //     this.affordability});
  MealItem({
    @required this.mealInfo,
  });

  String get complexityAsString {
    switch (mealInfo.complexity) {
      case Complexity.Simple:
        return 'Simple';
        break;
      case Complexity.Hard:
        return 'Hard';
        break;
      case Complexity.Challenging:
        return 'Challenging';
        break;
      default:
        return 'Unknown';
    }
  }

  String get affordabilityAsString {
    switch (mealInfo.affordability) {
      case Affordability.Affordable:
        return 'Cheap';
        break;
      case Affordability.Pricey:
        return 'Pricey';
        break;
      case Affordability.Luxurious:
        return 'Expensive';
        break;
      default:
        return 'Unknown';
    }
  }

  void selectMeal(BuildContext context) {
    Navigator.of(context)
        .pushNamed(
      MealDetailScreen.routeName,
      arguments: mealInfo.id,
    )
        .then((result) {
      if (result != null) {
        // removeItem(result);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
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
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    mealInfo.imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    width: 300,
                    decoration: BoxDecoration(
                        color: Colors.black54,
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    padding: EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 20,
                    ),
                    child: Text(
                      mealInfo.title,
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.schedule),
                        SizedBox(width: 6),
                        Text(
                          '${mealInfo.duration} min',
                          style: Theme.of(context).textTheme.bodyText2.copyWith(
                                fontSize: 10,
                              ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.work),
                        SizedBox(width: 6),
                        Text(
                          complexityAsString,
                          style: Theme.of(context).textTheme.bodyText2.copyWith(
                                fontSize: 10,
                              ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.euro),
                        SizedBox(width: 6),
                        Text(
                          affordabilityAsString,
                          style: Theme.of(context).textTheme.bodyText2.copyWith(
                                fontSize: 10,
                              ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
