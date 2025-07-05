import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/recipe_provider.dart';
import '../widgets/recipe_card.dart';
import '../models/recipe.dart';

class CategoryScreen extends StatelessWidget {
  final String categoryName;

  const CategoryScreen({super.key, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    final recipeProvider = Provider.of<RecipeProvider>(context);
    final List<Recipe> categoryRecipes = recipeProvider.recipes
        .where((recipe) => recipe.category == categoryName)
        .toList();

    final width = MediaQuery.of(context).size.width;
    int crossAxisCount = width ~/ 220;
    if (crossAxisCount < 2) crossAxisCount = 2;
    final aspectRatio = width < 600 ? 3 / 4 : 4 / 5;

    return Scaffold(
      appBar: AppBar(
        title: Text('$categoryName Recipes'),
        backgroundColor: Colors.orange.shade200,
        foregroundColor: Colors.brown,
        elevation: 2,
      ),
      body: categoryRecipes.isEmpty
          ? Center(
              child: Text(
                'No recipes found in "$categoryName".',
                style: const TextStyle(fontSize: 18, color: Colors.grey),
              ),
            )
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: GridView.builder(
                itemCount: categoryRecipes.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: aspectRatio,
                ),
                itemBuilder: (context, index) {
                  return RecipeCard(
                    recipe: categoryRecipes[index],
                    isGrid: true,
                  );
                },
              ),
            ),
    );
  }
}
