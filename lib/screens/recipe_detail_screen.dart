import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

import '../models/recipe.dart';
import '../providers/recipe_provider.dart';
import '../providers/shopping_list_provider.dart';
import 'add_edit_recipe_screen.dart'; // Make sure to import your edit screen

class RecipeDetailScreen extends StatelessWidget {
  final Recipe recipe;

  const RecipeDetailScreen({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    final outerContext = context; // Capture outer context here

    final provider = Provider.of<RecipeProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text(recipe.title),
        actions: [
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () {
              final text = '''
🍽️ *${recipe.title}*

📂 Category: ${recipe.category}
⏱️ Cooking Time: ${recipe.cookingTime} minutes

🥕 Ingredients:
${recipe.ingredients.map((e) => '• $e').join('\n')}

👩‍🍳 Steps:
${recipe.steps.asMap().entries.map((e) => '${e.key + 1}. ${e.value}').join('\n')}
''';

              Share.share(text);
            },
          ),
          IconButton(
            icon: Icon(
              recipe.isFavorite ? Icons.favorite : Icons.favorite_border,
              color: Colors.red,
            ),
            onPressed: () {
              provider.toggleFavorite(recipe.id);
              ScaffoldMessenger.of(outerContext).showSnackBar(
                SnackBar(
                  content: Text(
                    recipe.isFavorite
                        ? 'Removed from favorites.'
                        : 'Added to favorites!',
                  ),
                  duration: const Duration(seconds: 1),
                ),
              );
            },
          ),

          // Edit button
          IconButton(
            icon: const Icon(Icons.edit),
            tooltip: 'Edit Recipe',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => AddEditRecipeScreen(recipe: recipe),
                ),
              );
            },
          ),

          // Delete button
          IconButton(
            icon: const Icon(Icons.delete),
            tooltip: 'Delete Recipe',
            onPressed: () {
              showDialog(
                context: context,
                builder: (ctx) => AlertDialog(
                  title: const Text('Delete Recipe?'),
                  content: Text('Are you sure you want to delete "${recipe.title}"?'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.of(ctx).pop(),
                      child: const Text('Cancel'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Provider.of<RecipeProvider>(context, listen: false)
                            .deleteRecipe(recipe.id);
                        Navigator.of(ctx).pop(); // Close dialog
                        Navigator.of(context).pop(); // Go back from detail screen
                      },
                      child: const Text('Delete'),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isTablet = constraints.maxWidth > 600;

          Widget imageSection;
          if (recipe.imagePath.startsWith('assets/')) {
            imageSection = Image.asset(
              recipe.imagePath,
              height: isTablet ? 300 : 200,
              width: double.infinity,
              fit: BoxFit.cover,
            );
          } else if (recipe.imagePath.isNotEmpty &&
              File(recipe.imagePath).existsSync()) {
            imageSection = Image.file(
              File(recipe.imagePath),
              height: isTablet ? 300 : 200,
              width: double.infinity,
              fit: BoxFit.cover,
            );
          } else {
            imageSection = Image.asset(
              'assets/images/placeholder.jpg',
              height: isTablet ? 300 : 200,
              width: double.infinity,
              fit: BoxFit.cover,
            );
          }

          Widget detailSection = Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),

              // Category & Time
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Category: ${recipe.category}',
                      style: const TextStyle(fontSize: 16)),
                  Text('${recipe.cookingTime} min',
                      style: const TextStyle(fontSize: 16)),
                ],
              ),
              const Divider(height: 30),

              // Ingredients
              const Text('Ingredients',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              ...recipe.ingredients.map((ing) => Text('• $ing')),

              const SizedBox(height: 10),

              // Add to Shopping List Button
              ElevatedButton.icon(
                onPressed: () {
                  final shoppingProvider = Provider.of<ShoppingListProvider>(
                    outerContext,
                    listen: false,
                  );
                  shoppingProvider.addItems(recipe.ingredients);

                  ScaffoldMessenger.of(outerContext).showSnackBar(
                    const SnackBar(
                      content: Text('Ingredients added to shopping list!'),
                      duration: Duration(seconds: 2),
                    ),
                  );
                },
                icon: const Icon(Icons.add_shopping_cart),
                label: const Text('Add Ingredients to Shopping List'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green[700],
                  foregroundColor: Colors.white,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Steps
              const Text('Steps',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              ...recipe.steps.asMap().entries.map(
                    (entry) => ListTile(
                      leading: CircleAvatar(
                        radius: 14,
                        child: Text('${entry.key + 1}',
                            style: const TextStyle(fontSize: 12)),
                      ),
                      title: Text(entry.value),
                    ),
                  ),
            ],
          );

          return isTablet
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: imageSection,
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.all(16),
                        child: detailSection,
                      ),
                    ),
                  ],
                )
              : SingleChildScrollView(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      imageSection,
                      detailSection,
                    ],
                  ),
                );
        },
      ),
    );
  }
}
