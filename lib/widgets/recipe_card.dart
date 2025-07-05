import 'dart:io';
import 'package:flutter/material.dart';
import '../models/recipe.dart';
import '../screens/recipe_detail_screen.dart';

class RecipeCard extends StatelessWidget {
  final Recipe recipe;
  final bool isGrid;

  const RecipeCard({
    super.key,
    required this.recipe,
    this.isGrid = false,
  });

  Color _getTimeColor(int time) {
    if (time <= 15) return Colors.green;
    if (time <= 30) return Colors.orange;
    return Colors.red;
  }

  @override
  Widget build(BuildContext context) {
    Widget imageWidget;

    if (recipe.imagePath.startsWith('assets/')) {
      imageWidget = Image.asset(
        recipe.imagePath,
        fit: BoxFit.cover,
        width: double.infinity,
        height: 130,
      );
    } else if (recipe.imagePath.isNotEmpty && File(recipe.imagePath).existsSync()) {
      imageWidget = Image.file(
        File(recipe.imagePath),
        fit: BoxFit.cover,
        width: double.infinity,
        height: 130,
      );
    } else {
      imageWidget = Image.asset(
        'assets/images/placeholder.jpg',
        fit: BoxFit.cover,
        width: double.infinity,
        height: 130,
      );
    }

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => RecipeDetailScreen(recipe: recipe)),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image + Icon
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
                  child: imageWidget,
                ),
                
              ],
            ),

            // Info
            Padding(
              padding: const EdgeInsets.all(14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    recipe.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    recipe.category,
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey.shade600,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.timer, size: 14, color: _getTimeColor(recipe.cookingTime)),
                      const SizedBox(width: 4),
                      Text(
                        '${recipe.cookingTime} min',
                        style: TextStyle(
                          fontSize: 13,
                          color: _getTimeColor(recipe.cookingTime),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
