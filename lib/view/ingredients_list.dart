import 'package:flutter/material.dart';
import 'package:food_app/model/recipes.dart';

class IngredientsWidget extends StatelessWidget {
  const IngredientsWidget({Key? key, required this.ingredients})
      : super(key: key);
  final List<Ingredient> ingredients;

  @override
  Widget build(BuildContext context) {
    if (ingredients.isEmpty) {
      return Container();
    }
    var result = 'Ingredients: ';

    for (var ingredient in ingredients) {
      result = '$result$ingredient, ';
    }
    if (ingredients.isNotEmpty) {
      result = result.substring(0, result.length - 2);
    }

    return Text(
      result,
      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
    );
  }
}
