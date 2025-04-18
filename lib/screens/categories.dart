import 'package:flutter/material.dart';
import 'package:meals_app/data/categories_data.dart';
import 'package:meals_app/data/meals_data.dart';
import 'package:meals_app/models/category.dart';
import 'package:meals_app/screens/meals.dart';
import 'package:meals_app/widgets/categories/category_grid_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  void selectCategory(BuildContext context, Category category) {
    final filteredMeals =
        dummyMeals
            .where((meal) => meal.categories.contains(category.id))
            .toList();
    Navigator.of(context).push(
      MaterialPageRoute(
        builder:
            (ctx) => MealsScreen(meals: filteredMeals, title: category.title),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Categories')),
      body: GridView(
        padding: const EdgeInsets.all(24),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: [
          for (final category in availableCategories)
            CategoryGridItem(
              category: category,
              onSelectCategory: () => {selectCategory(context, category)},
            ),
        ],
      ),
    );
  }
}
