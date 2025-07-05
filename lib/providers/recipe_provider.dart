import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import '../models/recipe.dart';
import '../db/db_helper.dart';

class RecipeProvider with ChangeNotifier {
  List<Recipe> _userRecipes = [];

  // Dummy recipes (not stored in DB)
  final List<Recipe> _dummyRecipes = [
  // --- Breakfast ---
  Recipe(
    id: 'b1',
    title: 'Nasi Lemak',
    imagePath: 'assets/images/nasi_lemak.jpg',
    category: 'Breakfast',
    cookingTime: 40,
    ingredients: [
      '2 cups jasmine rice',
      '1 cup coconut milk',
      '2 pandan leaves',
      '100g dried anchovies',
      '50g roasted peanuts',
      '2 boiled eggs',
      'Sambal (chili paste)',
      'Salt to taste'
    ],
    steps: [
      'Wash rice and cook with coconut milk, pandan leaves, and salt.',
      'Fry anchovies until crispy.',
      'Roast peanuts until golden brown.',
      'Boil eggs, peel and halve them.',
      'Prepare sambal by frying chili paste with onions and shrimp paste.',
      'Serve rice with anchovies, peanuts, eggs, and sambal.'
    ],
  ),
  Recipe(
    id: 'b2',
    title: 'Nasi Goreng',
    imagePath: 'assets/images/nasi_goreng.jpg',
    category: 'Breakfast',
    cookingTime: 20,
    ingredients: [
      '2 cups cooked rice (day-old)',
      '2 cloves garlic, minced',
      '1 onion, chopped',
      '2 red chilies, sliced',
      '1 egg',
      '100g chicken or shrimp',
      '2 tbsp soy sauce',
      '1 tbsp oyster sauce',
      '1 tsp kecap manis',
      'Salt & pepper',
      'Vegetable oil',
      'Cucumber & fried shallots'
    ],
    steps: [
      'Heat oil, sauté garlic, onion, and chilies.',
      'Add meat and cook thoroughly.',
      'Scramble the egg, add rice and sauces.',
      'Stir-fry everything until hot.',
      'Garnish with cucumber and fried shallots.'
    ],
  ),
  Recipe(
    id: 'b3',
    title: 'Teh Tarik',
    imagePath: 'assets/images/teh_tarik.jpg',
    category: 'Breakfast',
    cookingTime: 10,
    ingredients: [
      '2 tbsp black tea leaves',
      '1 cup boiling water',
      '3 tbsp condensed milk',
      'Sugar to taste'
    ],
    steps: [
      'Brew tea leaves for 5 mins.',
      'Strain tea, add condensed milk and sugar.',
      'Pull the tea to make foam and serve.'
    ],
  ),
  Recipe(
    id: 'b4',
    title: 'Nasi Goreng Kampung',
    imagePath: 'assets/images/nasi_goreng_kampung.jpg',
    category: 'Breakfast',
    cookingTime: 20,
    ingredients: [
      '2 cups cooked rice',
      '3 tbsp sambal belacan',
      '100g dried anchovies',
      '2 garlic cloves',
      '1 onion',
      '2 fried eggs',
      'Vegetables',
      'Salt and pepper'
    ],
    steps: [
      'Fry garlic and onion.',
      'Add anchovies and sambal.',
      'Stir-fry rice with all ingredients.',
      'Serve with egg and vegetables.'
    ],
  ),

  // --- Lunch ---
  Recipe(
    id: 'l1',
    title: 'Chicken Rice',
    imagePath: 'assets/images/chicken_rice.jpg',
    category: 'Lunch',
    cookingTime: 60,
    ingredients: [
      '1 whole chicken',
      '2 cups jasmine rice',
      '3 garlic cloves',
      '2 ginger slices',
      'Spring onions',
      'Chicken broth',
      'Soy & chili sauce'
    ],
    steps: [
      'Boil chicken with garlic and ginger.',
      'Cook rice using chicken broth.',
      'Slice chicken, serve with sauce and rice.'
    ],
  ),
  Recipe(
    id: 'l2',
    title: 'Laksa',
    imagePath: 'assets/images/laksa.jpg',
    category: 'Lunch',
    cookingTime: 45,
    ingredients: [
      '200g rice noodles',
      '500ml fish broth',
      '100g shrimp',
      'Tofu puffs',
      'Boiled eggs',
      'Laksa paste',
      'Bean sprouts & herbs'
    ],
    steps: [
      'Cook laksa paste in broth.',
      'Cook noodles separately.',
      'Assemble shrimp, tofu, noodles in broth.',
      'Top with egg, sprouts, herbs.'
    ],
  ),
  Recipe(
    id: 'l3',
    title: 'Mee Goreng Mamak',
    imagePath: 'assets/images/mee_goreng_mamak.jpg',
    category: 'Lunch',
    cookingTime: 30,
    ingredients: [
      '200g yellow noodles',
      '2 eggs',
      '100g tofu',
      'Bean sprouts',
      '3 garlic cloves',
      'Chili sauce',
      'Soy sauce',
      'Vegetables'
    ],
    steps: [
      'Soften noodles.',
      'Fry garlic, tofu, veggies.',
      'Add noodles and sauces.',
      'Scramble eggs and mix.'
    ],
  ),
  Recipe(
    id: 'l4',
    title: 'Ikan Bakar',
    imagePath: 'assets/images/ikan_bakar.jpg',
    category: 'Lunch',
    cookingTime: 35,
    ingredients: [
      '1 whole fish',
      'Turmeric, chili powder, salt',
      'Banana leaves',
      'Lime wedges'
    ],
    steps: [
      'Marinate fish and wrap in leaves.',
      'Grill until fully cooked.',
      'Serve with lime.'
    ],
  ),

  // --- Dinner ---
  Recipe(
    id: 'd1',
    title: 'Beef Rendang',
    imagePath: 'assets/images/beef_rendang.jpg',
    category: 'Dinner',
    cookingTime: 120,
    ingredients: [
      '500g beef',
      '400ml coconut milk',
      '10 dried chilies',
      '5 shallots',
      '3 garlic cloves',
      'Ginger',
      'Lemongrass',
      'Spices: turmeric, coriander, cumin, cinnamon',
      'Salt and sugar'
    ],
    steps: [
      'Blend spice paste.',
      'Sauté with lemongrass.',
      'Add beef and coconut milk.',
      'Simmer till thick and tender.'
    ],
  ),
  Recipe(
    id: 'd2',
    title: 'Char Kuey Teow',
    imagePath: 'assets/images/char_kuey_teow.jpg',
    category: 'Dinner',
    cookingTime: 25,
    ingredients: [
      '200g flat rice noodles',
      '100g prawns',
      '2 eggs',
      'Bean sprouts',
      'Chives',
      'Soy sauce',
      'Chili paste',
      'Garlic'
    ],
    steps: [
      'Fry garlic and prawns.',
      'Add noodles, eggs, sauce.',
      'Toss everything and serve.'
    ],
  ),
  Recipe(
    id: 'd3',
    title: 'Ayam Masak Merah',
    imagePath: 'assets/images/ayam_masak_merah.jpg',
    category: 'Dinner',
    cookingTime: 40,
    ingredients: [
      '500g chicken',
      '2 tbsp ketchup',
      '5 dried chilies',
      '3 garlic cloves',
      '1 onion',
      'Sugar and salt',
      'Oil'
    ],
    steps: [
      'Blend chili paste.',
      'Fry onion and chili paste.',
      'Add chicken and ketchup.',
      'Cook until done.'
    ],
  ),
  Recipe(
    id: 'd4',
    title: 'Ikan Asam Pedas',
    imagePath: 'assets/images/ikan_asam_pedas.jpg',
    category: 'Dinner',
    cookingTime: 45,
    ingredients: [
      '1 whole fish',
      'Tamarind paste',
      'Chili paste',
      'Shallots',
      'Tomatoes',
      'Okra',
      'Turmeric',
      'Salt & sugar'
    ],
    steps: [
      'Marinate fish.',
      'Cook broth with paste.',
      'Add veggies & fish.',
      'Simmer and serve.'
    ],
  ),

  // --- Instant ---
  Recipe(
    id: 'i1',
    title: 'Maggi Goreng',
    imagePath: 'assets/images/maggi_goreng.jpg',
    category: 'Instant',
    cookingTime: 10,
    ingredients: [
      '1 packet Maggi',
      '1 egg',
      'Vegetables',
      'Soy sauce',
      'Chili sauce',
      'Oil'
    ],
    steps: [
      'Boil noodles.',
      'Fry egg and vegetables.',
      'Mix with noodles and sauces.'
    ],
  ),
  Recipe(
    id: 'i2',
    title: 'Instant Oatmeal',
    imagePath: 'assets/images/instant_oatmeal.jpg',
    category: 'Instant',
    cookingTime: 5,
    ingredients: [
      '1/2 cup oats',
      '1 cup milk or water',
      'Honey',
      'Fruits'
    ],
    steps: [
      'Heat milk/water.',
      'Add oats and cook briefly.',
      'Sweeten and top with fruits.'
    ],
  ),
  Recipe(
    id: 'i3',
    title: 'Microwave Egg Mug',
    imagePath: 'assets/images/microwave_egg_mug.jpg',
    category: 'Instant',
    cookingTime: 5,
    ingredients: [
      '2 eggs',
      '2 tbsp milk',
      'Veggies',
      'Cheese',
      'Salt and pepper'
    ],
    steps: [
      'Mix all in mug.',
      'Microwave 1–2 minutes.',
      'Serve hot.'
    ],
  ),
  Recipe(
    id: 'i4',
    title: 'Buldak Ramen Cheese',
    imagePath: 'assets/images/buldak_ramen_cheese.jpg',
    category: 'Instant',
    cookingTime: 5,
    ingredients: [
      '1 Buldak ramen pack',
      '2 cups water',
      'Cheddar/mozzarella cheese',
      'Optional: egg, seaweed, onions'
    ],
    steps: [
      'Cook ramen.',
      'Drain most water, add sauce.',
      'Top with cheese & melt.',
      'Serve with toppings.'
    ],
  ),

  // --- No-Cook ---
  Recipe(
    id: 'n1',
    title: 'Fruit Salad',
    imagePath: 'assets/images/fruit_salad.jpg',
    category: 'No-Cook',
    cookingTime: 10,
    ingredients: [
      'Mixed fruits',
      'Honey',
      'Lime juice',
      'Mint'
    ],
    steps: [
      'Chop fruits.',
      'Mix with honey and lime.',
      'Top with mint.'
    ],
  ),
  Recipe(
    id: 'n2',
    title: 'Sandwich',
    imagePath: 'assets/images/sandwich.jpg',
    category: 'No-Cook',
    cookingTime: 5,
    ingredients: [
      'Bread',
      'Cheese',
      'Lettuce',
      'Tomato',
      'Mayonnaise'
    ],
    steps: [
      'Spread mayo.',
      'Add layers.',
      'Slice and serve.'
    ],
  ),
  Recipe(
    id: 'n3',
    title: 'Yogurt Parfait',
    imagePath: 'assets/images/yogurt_parfait.jpg',
    category: 'No-Cook',
    cookingTime: 5,
    ingredients: [
      'Greek yogurt',
      'Granola',
      'Berries',
      'Honey'
    ],
    steps: [
      'Layer yogurt, granola, berries.',
      'Top with honey.',
      'Serve chilled.'
    ],
  ),
  Recipe(
    id: 'n4',
    title: 'Roti Gardenia with Kaya & Butter',
    imagePath: 'assets/images/kaya_butter_toast.jpg',
    category: 'No-Cook',
    cookingTime: 5,
    ingredients: [
      '2 slices bread',
      'Kaya (coconut jam)',
      'Butter'
    ],
    steps: [
      'Spread kaya and butter on bread.',
      'Press together and serve.',
      'Optional: chill before serving.'
    ],
  ),
];


  // Combine dummy + user recipes
  List<Recipe> get recipes => [..._dummyRecipes, ..._userRecipes];

  Future<void> loadRecipes() async {
    _userRecipes = await DBHelper.fetchRecipes();
    notifyListeners();
  }

  void addRecipe(Recipe recipe) async {
    final newRecipe = Recipe(
      id: const Uuid().v4(),
      title: recipe.title,
      imagePath: recipe.imagePath,
      category: recipe.category,
      cookingTime: recipe.cookingTime,
      ingredients: recipe.ingredients,
      steps: recipe.steps,
    );

    _userRecipes.add(newRecipe);
    await DBHelper.insertRecipe(newRecipe);
    notifyListeners();
  }

  void updateRecipe(Recipe updated) async {
    final index = _userRecipes.indexWhere((r) => r.id == updated.id);
    if (index != -1) {
      _userRecipes[index] = updated;
      await DBHelper.updateRecipe(updated);
      notifyListeners();
    }
  }

  void deleteRecipe(String id) async {
    _userRecipes.removeWhere((r) => r.id == id);
    await DBHelper.deleteRecipe(id);
    notifyListeners();
  }

  void toggleFavorite(String id) async {
    final allRecipes = [..._dummyRecipes, ..._userRecipes];
    final recipe = allRecipes.firstWhere((r) => r.id == id);

    recipe.isFavorite = !recipe.isFavorite;

    if (!id.startsWith('d')) {
      await DBHelper.updateRecipe(recipe);
    }

    notifyListeners();
  }

  List<Recipe> getFavorites() {
    return recipes.where((r) => r.isFavorite).toList();
  }

  List<Recipe> getByCategory(String category) {
    return recipes.where((r) => r.category == category).toList();
  }
}
