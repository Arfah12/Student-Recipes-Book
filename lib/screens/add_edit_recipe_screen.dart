import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

import '../models/recipe.dart';
import '../providers/recipe_provider.dart';

class AddEditRecipeScreen extends StatefulWidget {
  final Recipe? recipe;

  const AddEditRecipeScreen({Key? key, this.recipe}) : super(key: key);

  @override
  State<AddEditRecipeScreen> createState() => _AddEditRecipeScreenState();
}

class _AddEditRecipeScreenState extends State<AddEditRecipeScreen> {
  final _formKey = GlobalKey<FormState>();
  final _ingredientController = TextEditingController();
  final _stepController = TextEditingController();

  late String _title;
  late String _category;
  late int _cookingTime;
  late List<String> _ingredients;
  late List<String> _steps;
  File? _imageFile;
  String? _existingImagePath;

  final List<String> _validCategories = [
    'Breakfast',
    'Lunch',
    'Dinner',
    'Instant',
    'No-Cook'
  ];

  @override
  void initState() {
    super.initState();
    if (widget.recipe != null) {
      _title = widget.recipe!.title;
      _category = _validCategories.contains(widget.recipe!.category)
          ? widget.recipe!.category
          : 'Breakfast';
      _cookingTime = widget.recipe!.cookingTime;
      _ingredients = List.from(widget.recipe!.ingredients);
      _steps = List.from(widget.recipe!.steps);
      _existingImagePath = widget.recipe!.imagePath;
    } else {
      _title = '';
      _category = 'Breakfast'; // <-- fixed
      _cookingTime = 0;
      _ingredients = [];
      _steps = [];
      _existingImagePath = null;
    }
  }

  @override
  void dispose() {
    _ingredientController.dispose();
    _stepController.dispose();
    super.dispose();
  }

  void _pickImage() async {
    final picked = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (picked != null) {
      setState(() {
        _imageFile = File(picked.path);
        _existingImagePath = null;
      });
    }
  }

  void _addIngredient() {
    final text = _ingredientController.text.trim();
    if (text.isNotEmpty) {
      setState(() {
        _ingredients.add(text);
        _ingredientController.clear();
      });
    }
  }

  void _addStep() {
    final text = _stepController.text.trim();
    if (text.isNotEmpty) {
      setState(() {
        _steps.add(text);
        _stepController.clear();
      });
    }
  }

  void _submitForm() {
    if (_formKey.currentState!.validate() &&
        (_imageFile != null || _existingImagePath != null)) {
      _formKey.currentState!.save();
      final provider = Provider.of<RecipeProvider>(context, listen: false);

      if (widget.recipe == null) {
        final newRecipe = Recipe(
          id: const Uuid().v4(),
          title: _title,
          imagePath: _imageFile!.path,
          ingredients: _ingredients,
          steps: _steps,
          category: _category,
          cookingTime: _cookingTime,
        );
        provider.addRecipe(newRecipe);
      } else {
        final updated = Recipe(
          id: widget.recipe!.id,
          title: _title,
          imagePath: _imageFile?.path ?? _existingImagePath ?? '',
          ingredients: _ingredients,
          steps: _steps,
          category: _category,
          cookingTime: _cookingTime,
          isFavorite: widget.recipe!.isFavorite,
        );
        provider.updateRecipe(updated);
      }

      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please complete the form and pick an image ✨')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final pastel = Colors.orange.shade100;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.recipe == null ? '🍳 Add Recipe' : '✏️ Edit Recipe'),
        backgroundColor: Colors.orange.shade200,
        foregroundColor: Colors.brown,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: GestureDetector(
                  onTap: _pickImage,
                  child: _imageFile != null
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.file(
                            _imageFile!,
                            height: 100,
                            width: 100,
                            fit: BoxFit.cover,
                          ),
                        )
                      : (_existingImagePath != null && _existingImagePath!.isNotEmpty
                          ? ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: _existingImagePath!.startsWith('assets/')
                                  ? Image.asset(
                                      _existingImagePath!,
                                      height: 100,
                                      width: 100,
                                      fit: BoxFit.cover,
                                    )
                                  : Image.file(
                                      File(_existingImagePath!),
                                      height: 100,
                                      width: 100,
                                      fit: BoxFit.cover,
                                    ),
                            )
                          : Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                color: pastel,
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: Colors.orange.shade200),
                              ),
                              child: const Icon(Icons.add_a_photo, size: 36, color: Colors.orange),
                            )),
                ),
              ),
              const SizedBox(height: 20),

              // Title
              const Text('📝 Title'),
              TextFormField(
                initialValue: _title,
                decoration: InputDecoration(
                  hintText: 'E.g. Cheesy Baked Pasta',
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
                validator: (val) => val!.isEmpty ? 'Enter title' : null,
                onSaved: (val) => _title = val!,
              ),
              const SizedBox(height: 16),

              // Category & Time
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('🍽️ Category'),
                        DropdownButtonFormField<String>(
                          value: _validCategories.contains(_category) ? _category : 'Breakfast',
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.grey.shade100,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none,
                            ),
                          ),
                          items: _validCategories
                              .map((cat) => DropdownMenuItem(value: cat, child: Text(cat)))
                              .toList(),
                          onChanged: (val) => setState(() => _category = val!),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('⏱️ Time (min)'),
                        TextFormField(
                          initialValue: _cookingTime == 0 ? '' : _cookingTime.toString(),
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintText: 'e.g. 20',
                            filled: true,
                            fillColor: Colors.grey.shade100,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none,
                            ),
                          ),
                          validator: (val) => val!.isEmpty ? 'Required' : null,
                          onSaved: (val) => _cookingTime = int.parse(val!),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // Ingredients
              const Text('🥕 Ingredients'),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _ingredientController,
                      decoration: InputDecoration(
                        hintText: 'Add ingredient',
                        filled: true,
                        fillColor: Colors.grey.shade100,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.add_circle, color: Colors.green),
                    onPressed: _addIngredient,
                  ),
                ],
              ),
              Wrap(
                spacing: 6,
                children: _ingredients
                    .map((ing) => Chip(
                          label: Text(ing),
                          backgroundColor: pastel,
                          deleteIcon: const Icon(Icons.close),
                          onDeleted: () => setState(() => _ingredients.remove(ing)),
                        ))
                    .toList(),
              ),
              const SizedBox(height: 24),

              // Steps
              const Text('🧑‍🍳 Steps'),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _stepController,
                      decoration: InputDecoration(
                        hintText: 'Add step',
                        filled: true,
                        fillColor: Colors.grey.shade100,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.add_circle_outline, color: Colors.blue),
                    onPressed: _addStep,
                  ),
                ],
              ),
              Column(
                children: _steps
                    .asMap()
                    .entries
                    .map((e) => ListTile(
                          leading: CircleAvatar(child: Text('${e.key + 1}')),
                          title: Text(e.value),
                          trailing: IconButton(
                            icon: const Icon(Icons.delete_outline, color: Colors.redAccent),
                            onPressed: () => setState(() => _steps.removeAt(e.key)),
                          ),
                        ))
                    .toList(),
              ),
              const SizedBox(height: 30),

              ElevatedButton.icon(
                onPressed: _submitForm,
                icon: const Icon(Icons.save),
                label: const Text('Save Recipe 🍲'),
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(48),
                  backgroundColor: Colors.orange.shade400,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
