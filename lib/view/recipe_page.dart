import 'package:flutter/material.dart';
import 'package:food_app/model/recipes.dart';

class RecipePage extends StatefulWidget {
  const RecipePage({
    Key? key,
  }) : super(key: key);

  @override
  RecipePageState createState() => RecipePageState();
}

class RecipePageState extends State<RecipePage> {
  RandomRecipe? recipe;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Recipe App')),
      persistentFooterButtons: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.food_bank),
              label: const Text('Recipe')),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.bookmark),
              label: const Text('Favorite Page')),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.search),
              label: const Text('search')),
        ),
      ],
      body: Column(
        children: [Text(recipe!.description!)],
      ),
    );
  }
}
