import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/recipe_provider.dart';
import '../screens/add_edit_recipe_screen.dart';
import '../screens/category_screen.dart';
import '../screens/favorites_screen.dart';
import '../widgets/recipe_card.dart';
import 'shopping_list_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final recipeProvider = Provider.of<RecipeProvider>(context);
    final recipes = recipeProvider.recipes;

    final width = MediaQuery.of(context).size.width;
    int crossAxisCount = width ~/ 220;
    if (crossAxisCount < 2) crossAxisCount = 2;

    final aspectRatio = width < 600 ? 3 / 4 : 4 / 5;

   return Scaffold(
  backgroundColor: Colors.grey[100],
  appBar: AppBar(
    backgroundColor: Colors.white,
    elevation: 2,
    shadowColor: Colors.grey.withOpacity(0.3),
    
    title: Row(
      children: [
        Image.asset(
          'assets/images/logo.png', // ← your logo path
          height: 60,               // adjust size as needed
        ),
        const SizedBox(width: 1),
        const Text(
          'Student Recipes Book',
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
      ],
    ),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite, color: Colors.red),
            tooltip: 'Favorites',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const FavoritesScreen()),
              );
            },
          ),
           IconButton(
    icon: const Icon(Icons.shopping_cart, color: Colors.black87),
    tooltip: 'Shopping List',
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const ShoppingListScreen()),
      );
    },
  ),
          PopupMenuButton<String>(
            onSelected: (selectedCategory) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => CategoryScreen(categoryName: selectedCategory),
                ),
              );
            },
            icon: const Icon(Icons.filter_list, color: Colors.black87),
              itemBuilder: (context) => const [
    PopupMenuItem(value: 'Breakfast', child: Text('Breakfast 🍳')),
    PopupMenuItem(value: 'Lunch', child: Text('Lunch 🍛')),
    PopupMenuItem(value: 'Dinner', child: Text('Dinner 🍽️')),
    PopupMenuItem(value: 'Instant', child: Text('Instant 🍜')),
    PopupMenuItem(value: 'No-Cook', child: Text('No-Cook 🥗')),
  ],
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: recipes.isEmpty
          ? const Center(
              child: Text(
                'No recipes added yet.',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            )
          : AnimatedSwitcher(
              duration: const Duration(milliseconds: 400),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: GridView.builder(
                  key: ValueKey(recipes.length),
                  itemCount: recipes.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: crossAxisCount,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    childAspectRatio: aspectRatio,
                  ),
                  itemBuilder: (ctx, index) => RecipeCard(
                    recipe: recipes[index],
                    isGrid: true,
                  ),
                ),
              ),
            ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const AddEditRecipeScreen()),
          );
        },
        icon: const Icon(Icons.add),
        label: const Text('Add Recipe'),
        backgroundColor: Colors.orange,
      ),
    );
  }
}
