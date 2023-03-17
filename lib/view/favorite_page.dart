import 'package:flutter/material.dart';
import 'package:food_app/model/favorite_recipe.dart';
import 'package:food_app/model/recipes.dart';
import 'package:food_app/services/book_mark_service.dart';
import 'package:food_app/view/preview_widget.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({Key? key, this.recipe}) : super(key: key);
  final RandomRecipe? recipe;

  @override
  FavoritePageState createState() => FavoritePageState();
}

class FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    return getFavoritePageMarked();
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
      future: getFavorites(),
    );
  }

  Widget getListView(List<FavoriteRecipe>? favRecipes) {
    if (favRecipes == null || favRecipes.isEmpty) {
      return const Center(
        child: Text('There is no Favorite book marked recipes.'),
      );
    }

    var addRecipeWidget = <Widget>[];
    for (var recipe in favRecipes) {
      var recipeWidget = PreviewWidget(
        recipe: recipe,
      );
      addRecipeWidget.add(recipeWidget);
    }

    return ListView(children: addRecipeWidget);
  }
}
