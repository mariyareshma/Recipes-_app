import 'package:flutter/material.dart';
import 'package:food_app/view/recipe_page.dart';

class FoodApp extends StatelessWidget {
  const FoodApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Recipes App',
        theme: ThemeData(primarySwatch: Colors.green),
        home: const RecipePage());
  }
}
