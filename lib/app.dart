import 'package:flutter/material.dart'; 
import 'package:provider/provider.dart';

import 'screens/home_screen.dart';
import 'providers/recipe_provider.dart';
import 'providers/category_provider.dart';
import 'providers/shopping_list_provider.dart'; // <--- Add this import
import 'constants/app_colors.dart';

class RecipeBookApp extends StatelessWidget {
  const RecipeBookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => RecipeProvider()),
        ChangeNotifierProvider(create: (_) => CategoryProvider()),
        ChangeNotifierProvider(create: (_) => ShoppingListProvider()), // <--- Add here
      ],
      child: Builder(
        builder: (context) {
          // Load recipes from DB when app starts
          Provider.of<RecipeProvider>(context, listen: false).loadRecipes();

          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Recipe Book',
            theme: ThemeData(
              useMaterial3: true,
              colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
              scaffoldBackgroundColor: AppColors.background,
              appBarTheme: const AppBarTheme(
                elevation: 0,
                backgroundColor: Colors.transparent,
                foregroundColor: AppColors.textPrimary,
                centerTitle: true,
              ),
              inputDecorationTheme: InputDecorationTheme(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            home: const HomeScreen(),
          );
        },
      ),
    );
  }
}
