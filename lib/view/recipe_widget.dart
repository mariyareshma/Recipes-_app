import 'package:flutter/material.dart';
import 'package:food_app/model/recipes.dart';

class RecipeWidget extends StatelessWidget {
  RecipeWidget({Key? key, this.recipe}) : super(key: key);
  RandomRecipe? recipe;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.network(recipe!.image.toString()),
        Text(recipe!.name!),
        Text(recipe!.id.toString()),
        Text(recipe!.description!),
      ],
    );
  }
}
