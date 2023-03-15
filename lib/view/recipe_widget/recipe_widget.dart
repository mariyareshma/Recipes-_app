import 'package:flutter/material.dart';
import 'package:food_app/model/recipes.dart';
import 'package:food_app/view/recipe_widget/nutrients.dart';
import 'package:food_app/view/recipe_widget/serving_size_widget.dart';
import 'package:food_app/view/recipe_widget/ingredients_list.dart';
import 'package:food_app/view/recipe_widget/step.dart';
import 'package:food_app/view/recipe_widget/tags_widgets.dart';

class RecipeWidget extends StatelessWidget {
  const RecipeWidget({Key? key, this.recipe}) : super(key: key);
  final RandomRecipe? recipe;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  recipe!.name!,
                  style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.green),
                ),
              ),
              Center(
                child: Image.network(
                  recipe!.image!.toString(),
                  width: 300,
                  height: 300,
                ),
              ),
              // ignore: prefer_const_constructors
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: const Text(
                  'Description :',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  recipe!.description!,
                  style: const TextStyle(
                      fontSize: 17, fontWeight: FontWeight.normal),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('Cooking Time: ',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                    ),
                    Text(recipe!.cookTime.toString()),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('Prepare Time: ',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                    ),
                    Text(recipe!.cookTime.toString())
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('Servings Time: ',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                    ),
                    Text(recipe!.cookTime.toString())
                  ],
                ),
              ),

              getResult(),
            ]),
      ),
    );
  }

  Widget getResult() {
    var widget = <Widget>[];

    widget.add(Padding(
        padding: const EdgeInsets.all(8.0),
        child: TagsWidget(tags: recipe!.tags)));

    widget.add(Padding(
        padding: const EdgeInsets.all(8.0),
        child: StepsWidget(steps: recipe!.steps)));
    widget.addAll(getIngridients());
    widget.addAll(getServingSize());
    widget.addAll(getNutrients());

    return Column(
        crossAxisAlignment: CrossAxisAlignment.start, children: widget);
  }

  List<Widget> getServingSize() {
    return recipe!.servingSizes
        .map((e) => ServingSizeWidget(servingSizeElement: e))
        .toList();
  }

  List<Widget> getIngridients() {
    return recipe!.ingredients
        .map((e) => IngredientWidget(
              ingredient: e,
            ))
        .toList();
  }

  List<Widget> getNutrients() {
    var items = <Widget>[];
    var count = 0;
    for (var entry in recipe!.nutrients.entries) {
      var widget = NutrientsWidget(
        nutrient: entry.key,
        unit: entry.value.toString(),
      );
      items.add(widget);
      count++;
      if (count > 10) {
        break;
      }
    }
    return items;
  }
}
