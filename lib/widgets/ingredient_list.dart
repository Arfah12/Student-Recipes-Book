import 'package:flutter/material.dart';

class IngredientList extends StatelessWidget {
  final List<String> ingredients;

  const IngredientList({super.key, required this.ingredients});

  @override
  Widget build(BuildContext context) {
    if (ingredients.isEmpty) {
      return const Text('No ingredients listed.');
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: ingredients.map((ingredient) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 2.0),
          child: Row(
            children: [
              const Icon(Icons.check_circle_outline, size: 18, color: Colors.green),
              const SizedBox(width: 8),
              Expanded(child: Text(ingredient)),
            ],
          ),
        );
      }).toList(),
    );
  }
}
