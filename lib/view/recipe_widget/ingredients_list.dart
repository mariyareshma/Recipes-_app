import 'package:flutter/material.dart';
import 'package:food_app/model/recipes.dart';
import 'package:food_app/view/recipe_widget/serving_size.dart';

class IngredientWidget extends StatelessWidget {
  const IngredientWidget({Key? key, this.ingredient}) : super(key: key);
  final Ingredient? ingredient;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                ingredient!.name!,
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            getResult()
          ]),
    );
  }

  Widget getResult() {
    var widgets = <Widget>[];

    widgets.add(ServingSizemWidget(
      servingSize: ingredient!.servingSize!,
    ));

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: widgets,
      ),
    );
  }
}
