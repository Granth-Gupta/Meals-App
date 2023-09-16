import 'package:flutter/material.dart';

import '/models/meals.dart';
import '/widgets/meals_item.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/Category-meals';

  final List<Meal> availableMeals;

  CategoryMealsScreen(this.availableMeals);

  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String categoryTitle;
  List<Meal> displayMeals;
  bool isLoadedInitData = false;

  @override
  void initState() {
    // we have to use didChangeDependencies as in init
    // we can't provide context as it runs before build function
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // it runs around 2-3 times unlike init
    // so we have to provide if condition to run it once
    // otherwise item will not delete and loaded again

    if (!isLoadedInitData) {
      final routeArgs =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      final categoryId = routeArgs['id'];
      categoryTitle = routeArgs['title'];
      displayMeals = widget.availableMeals.where(
        (meal) {
          return meal.categories.contains(categoryId);
        },
      ).toList();
      isLoadedInitData = true;
    }

    super.didChangeDependencies();
  }

  void _removeMeal(String mealId) {
    setState(() {
      displayMeals.removeWhere(
        (meal) => meal.id == mealId,
      );
    });
  }

  // final String id;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealsItem(
            id: displayMeals[index].id,
            affordability: displayMeals[index].affordability,
            complexity: displayMeals[index].complexity,
            duration: displayMeals[index].duration,
            imageUrl: displayMeals[index].imageUrl,
            title: displayMeals[index].title,
            // removeItem: _removeMeal,
          );
        },
        itemCount: displayMeals.length,
      ),
    );
  }
}
