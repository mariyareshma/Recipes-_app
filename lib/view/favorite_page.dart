import 'package:flutter/material.dart';
import 'package:food_app/model/recipes.dart';
import 'package:food_app/services/book_mark_service.dart';

import 'package:food_app/view/recipe_widget.dart';

class FavoritePage extends StatefulWidget {
  FavoritePage({Key? key, this.recipe}) : super(key: key);
  RandomRecipe? recipe;

  @override
  FavoritePageState createState() => FavoritePageState();
}

class FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: getFavoritePageMarked(),
    );
  }

  Widget getFavoritePageMarked() {
    return FutureBuilder(
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return getListView(snapshot.data);
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
      future: getFavorite(),
    );
  }

  Widget getListView(List<RandomRecipe>? recipe) {
    if (recipe == null || recipe.isEmpty) {
      return const Center(
        child: Text('There is no Favorite book marked recipes.'),
      );
    }

    var addRecipeWidget = <Widget>[];
    for (var recipes in recipe) {
      var recipeWidget = RecipeWidget(
        recipe: recipes,
      );
      addRecipeWidget.add(recipeWidget);
    }

    return ListView(children: addRecipeWidget);
  }
}
