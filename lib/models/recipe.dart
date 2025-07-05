class Recipe {
  final String id;
  final String title;
  final String imagePath;
  final List<String> ingredients;
  final List<String> steps;
  final String category;
  final int cookingTime;
  bool isFavorite;


  Recipe({
    required this.id,
    required this.title,
    required this.imagePath,
    required this.ingredients,
    required this.steps,
    required this.category,
    required this.cookingTime,
    this.isFavorite = false,
  });

  // Optional: For future use with JSON, Hive, or SQLite
  Map<String, dynamic> toMap() => {
  'id': id,
  'title': title,
  'imagePath': imagePath,
  'category': category,
  'cookingTime': cookingTime,
  'ingredients': ingredients.join('||'),
  'steps': steps.join('||'),
  'isFavorite': isFavorite ? 1 : 0,
};

factory Recipe.fromMap(Map<String, dynamic> map) => Recipe(
  id: map['id'],
  title: map['title'],
  imagePath: map['imagePath'],
  category: map['category'],
  cookingTime: map['cookingTime'],
  ingredients: (map['ingredients'] as String).split('||'),
  steps: (map['steps'] as String).split('||'),
  isFavorite: map['isFavorite'] == 1,
);

  }

