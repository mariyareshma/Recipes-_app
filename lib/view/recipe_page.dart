import 'package:flutter/material.dart';
import 'package:food_app/model/recipes.dart';
import 'package:food_app/services/service.dart';
import 'package:food_app/view/recipe_widget/recipe_widget.dart';

class RandomRecipePage extends StatefulWidget {
  const RandomRecipePage({
    Key? key,
  }) : super(key: key);

  @override
  RandomRecipePageState createState() => RandomRecipePageState();
}

class RandomRecipePageState extends State<RandomRecipePage> {
  @override
  Widget build(BuildContext context) {
    return getRecipeFuture();
  }

  Widget getRecipeFuture() {
    return FutureBuilder(
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return getListView(snapshot.data);
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
      future: getRandomRecipe(),
    );
  }

  Widget getListView(RandomRecipe? data) {
    if (data == null) {
      return const Center(
        child: Text('Error in getting data'),
      );
    }

    var recipeWidget = SingleChildScrollView(
      child: RecipeWidget(
        recipe: data,
      ),
    );

    return recipeWidget;
  }
}
