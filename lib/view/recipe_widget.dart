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
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.network(
                      recipe!.image!.toString(),
                      width: 250,
                      height: 250,
                    ),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.heart_broken,
                        size: 40,
                        color: Colors.green,
                      )),
                ]),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
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
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Description:${recipe!.description!}',
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.normal),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: Text('Cooking Time:${recipe!.cookTime.toString()}',
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.normal)),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: Text(
                    'PrePare Time:${recipe!.prepareTime.toString()}',
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.normal),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: Text('Servings Size:${recipe!.servings.toString()}',
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.normal)),
                ),
                getResult(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget getResult() {
    var widget = <Widget>[];
    widget.add(Padding(
      padding: const EdgeInsets.all(8.0),
      child: IngredientsWidget(ingredients: recipe!.ingredients),
    ));
    widget.add(Padding(
      padding: const EdgeInsets.all(8.0),
      child: ServingSizeWidget(servingSize: recipe!.servingSizes),
    ));
    widget.add(Padding(
      padding: const EdgeInsets.all(8.0),
      child: TagsWidget(tags: recipe!.tags),
    ));
    widget.add(Padding(
      padding: const EdgeInsets.all(8.0),
      child: TagsWidget(tags: recipe!.steps),
    ));

    return Column(children: widget);
  }

//   List<Widget> getIngredients() {
//     return recipe!.ingredients
//         .map((e) => IngredientsWidget(ingredients: e))
//         .toList();
//   }

//   List<Widget> getServingSize() {
//     return recipe!.servingSizes
//         .map((e) => ServingSizeWidget(servingSize: e))
//         .toList();
//   }
//   String getNeturtion(){
//     return recipe!.nutrients.map((key, value) => NutrientsWidget(nutrients: key)).toString();
//   }
// }
}
