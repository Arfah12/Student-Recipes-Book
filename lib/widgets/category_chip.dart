import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/category_provider.dart';

class CategoryChip extends StatelessWidget {
  final String category;

  const CategoryChip({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    final selected = context.watch<CategoryProvider>().selectedCategory;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: ChoiceChip(
        label: Text(category),
        selected: selected == category,
        onSelected: (_) {
          context.read<CategoryProvider>().setCategory(category);
        },
        selectedColor: Colors.orangeAccent,
        backgroundColor: Colors.grey.shade200,
        labelStyle: TextStyle(
          color: selected == category ? Colors.white : Colors.black,
        ),
      ),
    );
  }
}
