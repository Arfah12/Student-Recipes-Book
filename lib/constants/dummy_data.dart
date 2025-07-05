import '../models/recipe.dart';

final List<Recipe> dummyRecipes = [
 
  // Breakfast
  Recipe(
    id: 'b1',
    title: 'Nasi Lemak',
    imagePath: 'assets/images/nasi_lemak.jpg',
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
    category: 'Breakfast',
    cookingTime: 40,
  ),
  Recipe(
  id: 'b2',
  title: 'Nasi Goreng',
  imagePath: 'assets/images/nasi_goreng.jpg',
  ingredients: [
    '2 cups cooked rice (preferably day-old)',
    '2 cloves garlic, minced',
    '1 small onion, chopped',
    '2 red chilies, sliced',
    '1 egg',
    '100g chicken or shrimp (optional)',
    '2 tbsp soy sauce',
    '1 tbsp oyster sauce',
    '1 tsp kecap manis (sweet soy sauce)',
    'Salt and pepper to taste',
    '2 tbsp vegetable oil',
    'Cucumber slices and fried shallots for garnish'
  ],
  steps: [
    'Heat oil in a wok or frying pan over medium heat.',
    'Sauté garlic, onion, and red chilies until fragrant.',
    'Add chicken or shrimp if using, cook until done.',
    'Push ingredients to the side and scramble the egg in the pan.',
    'Add cooked rice and stir well to combine all ingredients.',
    'Add soy sauce, oyster sauce, kecap manis, salt, and pepper.',
    'Stir-fry everything for 3-5 minutes until heated through.',
    'Serve hot garnished with cucumber slices and fried shallots.'
  ],
  category: 'Breakfast',
  cookingTime: 20,
),

  Recipe(
    id: 'b3',
    title: 'Teh Tarik',
    imagePath: 'assets/images/teh_tarik.jpg',
    ingredients: [
      '2 tbsp black tea leaves',
      '1 cup boiling water',
      '3 tbsp condensed milk',
      'Sugar to taste'
    ],
    steps: [
      'Brew tea leaves in boiling water for 5 minutes.',
      'Strain tea into a container.',
      'Add condensed milk and sugar.',
      'Pour tea back and forth between two containers to create froth.',
      'Serve hot.'
    ],
    category: 'Breakfast',
    cookingTime: 10,
  ),
  Recipe(
    id: 'b4',
    title: 'Nasi Goreng Kampung',
    imagePath: 'assets/images/nasi_goreng_kampung.jpg',
    ingredients: [
      '2 cups cooked rice',
      '3 tbsp sambal belacan',
      '100g dried anchovies',
      '2 cloves garlic, minced',
      '1 small onion, sliced',
      '2 eggs, fried',
      'Vegetables (cucumber slices, long beans)',
      'Salt and pepper to taste'
    ],
    steps: [
      'Heat oil in a pan, sauté garlic and onion until fragrant.',
      'Add dried anchovies and fry until crispy.',
      'Add sambal belacan and cook for 2 minutes.',
      'Add cooked rice and stir-fry until well mixed.',
      'Season with salt and pepper.',
      'Serve with fried egg and fresh vegetables.'
    ],
    category: 'Breakfast',
    cookingTime: 20,
  ),

  // Lunch
  Recipe(
    id: 'l1',
    title: 'Chicken Rice',
    imagePath: 'assets/images/chicken_rice.jpg',
    ingredients: [
      '1 whole chicken',
      '2 cups jasmine rice',
      '3 cloves garlic',
      '2 slices ginger',
      'Spring onions',
      'Chicken broth',
      'Soy sauce and chili sauce for dipping'
    ],
    steps: [
      'Boil chicken with garlic, ginger, and salt until cooked.',
      'Remove chicken and set aside; reserve broth.',
      'Cook rice using chicken broth instead of water.',
      'Slice chicken and garnish with spring onions.',
      'Serve with soy sauce and chili sauce.'
    ],
    category: 'Lunch',
    cookingTime: 60,
  ),
  Recipe(
    id: 'l2',
    title: 'Laksa',
    imagePath: 'assets/images/laksa.jpg',
    ingredients: [
      '200g rice noodles',
      '500ml fish broth',
      '100g cooked shrimp',
      'Tofu puffs, sliced',
      'Boiled eggs, halved',
      'Laksa paste',
      'Bean sprouts and fresh herbs'
    ],
    steps: [
      'Prepare laksa paste and fry until fragrant.',
      'Add fish broth and bring to boil.',
      'Cook rice noodles separately and drain.',
      'Add cooked shrimp, tofu puffs, and noodles to broth.',
      'Serve topped with boiled eggs, bean sprouts, and herbs.'
    ],
    category: 'Lunch',
    cookingTime: 45,
  ),
  Recipe(
    id: 'l3',
    title: 'Mee Goreng Mamak',
    imagePath: 'assets/images/mee_goreng_mamak.jpg',
    ingredients: [
      '200g yellow noodles',
      '2 eggs',
      '100g tofu, cubed',
      'Bean sprouts',
      '3 cloves garlic',
      'Chili sauce',
      'Soy sauce',
      'Vegetables'
    ],
    steps: [
      'Soften noodles in hot water and drain.',
      'Heat oil and fry garlic until fragrant.',
      'Add tofu and vegetables, stir fry.',
      'Add noodles, chili sauce, and soy sauce.',
      'Push noodles aside and scramble eggs.',
      'Mix everything and serve hot.'
    ],
    category: 'Lunch',
    cookingTime: 30,
  ),
  Recipe(
    id: 'l4',
    title: 'Ikan Bakar',
    imagePath: 'assets/images/ikan_bakar.jpg',
    ingredients: [
      '1 whole fish (snapper or mackerel)',
      'Spices: turmeric, chili powder, salt',
      'Banana leaves for wrapping',
      'Lime wedges for serving'
    ],
    steps: [
      'Clean and marinate fish with spices for 30 minutes.',
      'Wrap fish in banana leaves.',
      'Grill over charcoal or grill pan until cooked through.',
      'Serve with lime wedges.'
    ],
    category: 'Lunch',
    cookingTime: 35,
  ),

  // Dinner
  Recipe(
    id: 'd1',
    title: 'Beef Rendang',
    imagePath: 'assets/images/beef_rendang.jpg',
    ingredients: [
      '500g beef chunks',
      '400ml coconut milk',
      '10 dried chilies, soaked',
      '5 shallots',
      '3 cloves garlic',
      '1 piece ginger',
      '2 stalks lemongrass',
      'Spices: turmeric, coriander, cumin, cinnamon',
      'Salt and sugar to taste'
    ],
    steps: [
      'Blend chilies, shallots, garlic, and ginger into paste.',
      'Sauté paste with spices and lemongrass until fragrant.',
      'Add beef and brown all sides.',
      'Pour in coconut milk and simmer until meat is tender and sauce thickens.',
      'Season with salt and sugar, serve hot.'
    ],
    category: 'Dinner',
    cookingTime: 120,
  ),
  Recipe(
    id: 'd2',
    title: 'Char Kuey Teow',
    imagePath: 'assets/images/char_kuey_teow.jpg',
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
      'Heat wok with oil, fry garlic until fragrant.',
      'Add prawns and cook until pink.',
      'Add noodles and fry eggs alongside.',
      'Add bean sprouts, chives, soy sauce, and chili paste.',
      'Stir fry quickly and serve hot.'
    ],
    category: 'Dinner',
    cookingTime: 25,
  ),
  Recipe(
    id: 'd3',
    title: 'Ayam Masak Merah',
    imagePath: 'assets/images/ayam_masak_merah.jpg',
    ingredients: [
      '500g chicken pieces',
      '2 tbsp tomato ketchup',
      '5 dried chilies, soaked',
      '3 cloves garlic',
      '1 onion, sliced',
      'Sugar and salt to taste',
      'Cooking oil'
    ],
    steps: [
      'Blend dried chilies, garlic into paste.',
      'Fry onion until golden, add chili paste and cook until oil separates.',
      'Add chicken and brown.',
      'Add ketchup and sugar, cook until chicken is cooked through.',
      'Serve with rice.'
    ],
    category: 'Dinner',
    cookingTime: 40,
  ),
  Recipe(
    id: 'd4',
    title: 'Ikan Asam Pedas',
    imagePath: 'assets/images/ikan_asam_pedas.jpg',
    ingredients: [
      '1 whole fish',
      'Tamarind paste',
      'Chili paste',
      'Shallots',
      'Tomatoes',
      'Okra',
      'Turmeric',
      'Salt and sugar to taste'
    ],
    steps: [
      'Marinate fish with turmeric and salt.',
      'Prepare sour and spicy broth using tamarind and chili paste.',
      'Add shallots, tomatoes, and okra.',
      'Simmer fish in broth until cooked.',
      'Adjust seasoning and serve hot.'
    ],
    category: 'Dinner',
    cookingTime: 45,
  ),

  // Instant
  Recipe(
    id: 'i1',
    title: 'Maggi Goreng',
    imagePath: 'assets/images/maggi_goreng.jpg',
    ingredients: [
      '1 packet Maggi noodles',
      '1 egg',
      'Chopped vegetables (carrot, cabbage)',
      'Soy sauce',
      'Chili sauce',
      'Oil for frying'
    ],
    steps: [
      'Boil noodles and drain.',
      'Heat oil, fry egg and scramble.',
      'Add vegetables and stir-fry briefly.',
      'Add noodles, soy sauce, and chili sauce.',
      'Mix well and serve.'
    ],
    category: 'Instant',
    cookingTime: 10,
  ),
  Recipe(
    id: 'i2',
    title: 'Instant Oatmeal',
    imagePath: 'assets/images/instant_oatmeal.jpg',
    ingredients: [
      '1/2 cup instant oats',
      '1 cup milk or water',
      'Honey or brown sugar',
      'Fresh fruits (banana, berries)'
    ],
    steps: [
      'Heat milk or water in a pot.',
      'Add oats and cook for 1-2 minutes.',
      'Sweeten with honey or sugar.',
      'Top with fresh fruits and serve.'
    ],
    category: 'Instant',
    cookingTime: 5,
  ),
  Recipe(
    id: 'i3',
    title: 'Microwave Egg Mug',
    imagePath: 'assets/images/microwave_egg_mug.jpg',
    ingredients: [
      '2 eggs',
      '2 tbsp milk',
      'Chopped vegetables',
      'Grated cheese',
      'Salt and pepper'
    ],
    steps: [
      'Beat eggs and milk in a microwave-safe mug.',
      'Add vegetables, cheese, salt, and pepper.',
      'Microwave for 1-2 minutes until cooked.',
      'Serve hot.'
    ],
    category: 'Instant',
    cookingTime: 5,
  ),
  Recipe(
  id: 'i4',
  title: 'Buldak Ramen Cheese',
  imagePath: 'assets/images/buldak_ramen_cheese.jpg',
  ingredients: [
    '1 pack Buldak Hot Chicken Ramen (Samyang)',
    '2 cups water',
    '1 slice cheddar cheese or 1 tbsp shredded mozzarella',
    'Optional: 1 boiled egg, spring onion, or seaweed for topping'
  ],
  steps: [
    'Boil 2 cups of water in a pot.',
    'Add Buldak ramen noodles and cook for 4–5 minutes.',
    'Drain most of the water, leaving about 2–3 tablespoons.',
    'Add the liquid spicy sauce and stir well on low heat.',
    'Top with cheese and let it melt for a creamy texture.',
    'Serve hot, optionally topped with a boiled egg or seaweed.'
  ],
  category: 'Instant',
  cookingTime: 5,
),


  // No-Cook
  Recipe(
    id: 'n1',
    title: 'Fruit Salad',
    imagePath: 'assets/images/fruit_salad.jpg',
    ingredients: [
      'Mixed fruits (apple, grapes, pineapple, watermelon)',
      '2 tbsp honey',
      '1 tbsp lime juice',
      'Mint leaves for garnish'
    ],
    steps: [
      'Chop all fruits into bite-sized pieces.',
      'Mix honey and lime juice in a bowl.',
      'Toss fruits with honey-lime dressing.',
      'Garnish with mint leaves and serve chilled.'
    ],
    category: 'No-Cook',
    cookingTime: 10,
  ),
  Recipe(
    id: 'n2',
    title: 'Sandwich',
    imagePath: 'assets/images/sandwich.jpg',
    ingredients: [
      '2 slices bread',
      '2 slices cheese',
      'Lettuce leaves',
      'Tomato slices',
      'Mayonnaise or mustard'
    ],
    steps: [
      'Spread mayonnaise on bread slices.',
      'Layer cheese, lettuce, and tomato between bread.',
      'Cut sandwich into halves and serve.'
    ],
    category: 'No-Cook',
    cookingTime: 5,
  ),
  Recipe(
    id: 'n3',
    title: 'Greek Yogurt Parfait',
    imagePath: 'assets/images/yogurt_parfait.jpg',
    ingredients: [
      '1 cup Greek yogurt',
      '1/2 cup granola',
      '1/2 cup mixed berries',
      '1 tbsp honey'
    ],
    steps: [
      'Layer Greek yogurt, granola, and berries in a glass.',
      'Drizzle honey on top.',
      'Repeat layers and serve immediately.'
    ],
    category: 'No-Cook',
    cookingTime: 5,
  ),
  Recipe(
  id: 'n4',
  title: 'Roti Gardenia with Kaya & Butter',
  imagePath: 'assets/images/kaya_butter_toast.jpg',
  ingredients: [
    '2 slices Gardenia white bread (or any sandwich bread)',
    '1 tbsp kaya (coconut jam)',
    '1 tbsp butter (room temperature)'
  ],
  steps: [
    'Take two slices of bread and place them on a plate.',
    'Spread kaya evenly on one side of a slice.',
    'Spread butter on the other slice.',
    'Combine the slices, press lightly, and serve immediately.',
    'Optional: Chill the sandwich slightly for a cold, creamy bite!'
  ],
  category: 'No-Cook',
  cookingTime: 5,
),

];
