import 'package:flutter/material.dart';
import 'package:food_app/model/recipes.dart';
import 'package:food_app/view/serving_size_element_widget.dart';
import 'package:food_app/view/ingredients_list.dart';
import 'package:food_app/view/tags_widgets.dart';

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
        Text(recipe!.cookTime.toString()),
        Text(recipe!.prepareTime.toString()),
        Text(recipe!.servings.toString()),
        getResult()
      ],
    );
  }

  Widget getResult() {
    var widget = <Widget>[];
    widget.add(IngredientsWidget(ingredients: recipe!.ingredients));
    widget.add(ServingSizeWidget(servingSize: recipe!.servingSizes));
    widget.add(TagsWidget(tags: recipe!.tags));
    widget.add(TagsWidget(tags: recipe!.steps));

    return Column(children: widget);
  }
}
