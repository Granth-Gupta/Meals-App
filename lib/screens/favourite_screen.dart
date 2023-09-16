import 'package:flutter/material.dart';

import '/widgets/meals_item.dart';
import '/models/meals.dart';

class FavouriteScreen extends StatelessWidget {
  final List<Meal> favouriteMeal;

  FavouriteScreen(this.favouriteMeal);

  @override
  Widget build(BuildContext context) {
    if (favouriteMeal.isEmpty) {
      return Center(
        child: Text(
          'You have no favourites - start adding some!',
        ),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealsItem(
            id: favouriteMeal[index].id,
            affordability: favouriteMeal[index].affordability,
            complexity: favouriteMeal[index].complexity,
            duration: favouriteMeal[index].duration,
            imageUrl: favouriteMeal[index].imageUrl,
            title: favouriteMeal[index].title,
          );
        },
        itemCount: favouriteMeal.length,
      );
    }
  }
}
