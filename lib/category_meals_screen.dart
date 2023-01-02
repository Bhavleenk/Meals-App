import 'package:flutter/material.dart';

import './dummy_data.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = '/categories-meals';
  // final String categoryId;
  // final String CategoryTitle;
  // CategoryMealsScreen(this.categoryId, this.CategoryTitle);
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final CategoryTitle = routeArgs['title'];
    final CategoryId = routeArgs['id'];
    final CategoryMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(CategoryId);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(CategoryTitle!),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return Text(CategoryMeals[index].title);
        },
        itemCount: CategoryMeals.length,
      ),
    );
  }
}
