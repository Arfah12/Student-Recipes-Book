import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/recipe_provider.dart';
import '../widgets/recipe_card.dart';
import '../models/recipe.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final recipeProvider = Provider.of<RecipeProvider>(context);
    final List<Recipe> favoriteRecipes = recipeProvider.recipes
        .where((recipe) => recipe.isFavorite)
        .toList();

    final width = MediaQuery.of(context).size.width;
    int crossAxisCount = width ~/ 220;
    if (crossAxisCount < 2) crossAxisCount = 2;

    final aspectRatio = width < 600 ? 3 / 4 : 4 / 5;

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 2,
        iconTheme: const IconThemeData(color: Colors.black87),
        title: const Text(
          '❤️ Favorite Recipes',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
      ),
      body: favoriteRecipes.isEmpty
          ? const Center(
              child: Text(
                'You haven\'t added any favorites yet.',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            )
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: GridView.builder(
                itemCount: favoriteRecipes.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: aspectRatio,
                ),
                itemBuilder: (context, index) =>
                    RecipeCard(recipe: favoriteRecipes[index], isGrid: true),
              ),
            ),
    );
  }
}
