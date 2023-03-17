import 'package:flutter/material.dart';
import 'package:food_app/model/favorite_recipe.dart';
import 'package:food_app/model/recipes.dart';
import 'package:food_app/model/search_recipes.dart';
import 'package:food_app/services/search_recipe.dart';
import 'package:food_app/view/preview_widget.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  SearchPageState createState() => SearchPageState();
}

class SearchPageState extends State<SearchPage> {
  List<RandomRecipe>? recipes;
  var isLoading = false;

  TextEditingController recipeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          keyboardType: TextInputType.text,
          controller: recipeController,
          decoration: const InputDecoration(
              icon: Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.search, color: Colors.green),
              ),
              hintText: 'Search',
              fillColor: Colors.green),
          onSubmitted: searchRecipe,
        ),
        getBody()
      ],
    );
  }

  void searchRecipe(value) async {
    setState(() {
      isLoading = true;
    });
    try {
      //Api call
      var recipe = SearchQuery();
      recipe.name = value;

      recipes = await getRecipeSearchResult(recipe);
    } catch (err) {
      debugPrint(err.toString());
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  Widget getBody() {
    if (isLoading == true) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    if (recipes == null || recipes!.isEmpty) {
      return const Center(
          child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Text('Please search something else'),
      ));
    }
    return getSearchItem(recipes!);
  }

  Widget getSearchItem(List<RandomRecipe> recipes) {
    var widgets = <Widget>[];
    for (var recipe in recipes) {
      var favoritObj = FavoriteRecipe(
          id: recipe.id,
          title: recipe.name,
          image: recipe.image,
          description: recipe.description);
      var recipeWidget = PreviewWidget(recipe: favoritObj);
      {
        widgets.add(recipeWidget);
      }
    }
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: widgets,
        ),
      ),
    );
  }
}
