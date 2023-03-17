import 'package:flutter/material.dart';
import 'package:food_app/model/recipes.dart';
import 'package:food_app/view/recipe_widget/nutrients.dart';
import 'package:food_app/view/recipe_widget/serving_size_widget.dart';
import 'package:food_app/view/recipe_widget/ingredients_widget.dart';
import 'package:food_app/view/recipe_widget/step.dart';
import 'package:food_app/view/recipe_widget/tags_widgets.dart';
import '../../services/book_mark_service.dart';

class RecipeWidget extends StatefulWidget {
  const RecipeWidget({
    Key? key,
    required this.recipe,
  }) : super(key: key);
  final RandomRecipe? recipe;

  @override
  State<RecipeWidget> createState() => _RecipeWidgetState();
}

class _RecipeWidgetState extends State<RecipeWidget> {
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
              widget.recipe!.name!,
              style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.green),
            ),
          ),
          Center(
            child: Image.network(
              widget.recipe!.image!.toString(),
              width: 300,
              height: 300,
            ),
          ),
          getFavoriteRecipe(),
          const Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(
              'Description :',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.recipe!.description!,
              style:
                  const TextStyle(fontSize: 17, fontWeight: FontWeight.normal),
            ),
          ),
          getRecipeFuction(
              'Cooking Time :', widget.recipe!.cookTime.toString()),
          getRecipeFuction(
              'Prepare Time :', widget.recipe!.prepareTime.toString()),
          getRecipeFuction(
              'Servings Time :', widget.recipe!.servings.toString()),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Ingredient :',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          getResult(),
        ])));
  }

  Widget getResult() {
    var widgetObj = <Widget>[];
    widgetObj.addAll(getIngridients());

    widgetObj.add(Padding(
        padding: const EdgeInsets.all(8.0),
        child: TagsWidget(tags: widget.recipe!.tags)));

    widgetObj.add(Padding(
        padding: const EdgeInsets.all(8.0),
        child: StepsWidget(steps: widget.recipe!.steps)));

    widgetObj.addAll(getServingSize());
    widgetObj.addAll(getNutrients());

    return Column(
        crossAxisAlignment: CrossAxisAlignment.start, children: widgetObj);
  }

  List<Widget> getServingSize() {
    return widget.recipe!.servingSizes
        .map((e) => ServingSizeWidget(servingSizeElement: e))
        .toList();
  }

  List<Widget> getIngridients() {
    return widget.recipe!.ingredients
        .map((e) => IngredientWidget(
              ingredient: e,
            ))
        .toList();
  }

  List<Widget> getNutrients() {
    var items = <Widget>[];
    var count = 0;
    for (var entry in widget.recipe!.nutrients.entries) {
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

  Widget getRecipeFuction(String name, String fuctions) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, top: 8.0, bottom: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text(
            fuctions.toString(),
            style: const TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }

  FutureBuilder<bool?> getFavoriteRecipe() {
    return FutureBuilder(
        future: isRecipeBookmarked(widget.recipe!),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var bookmark = snapshot.data ?? false;
            return IconButton(
                onPressed: (() async {
                  if (bookmark) {
                    await removeBookmark(widget.recipe!);
                  } else {
                    await addRecipeBookmark(widget.recipe!);
                  }
                  setState(() {});
                }),
                icon: Icon(
                  bookmark ? Icons.favorite : Icons.favorite_border_outlined,
                  color: bookmark ? Colors.red : Colors.green,
                  size: 25,
                ));
          }
          return const CircularProgressIndicator();
        });
  }
}
