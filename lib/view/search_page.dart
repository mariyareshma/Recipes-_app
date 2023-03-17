import 'package:flutter/material.dart';
import 'package:food_app/model/recipes.dart';
import 'package:food_app/model/search_recipes.dart';
import 'package:food_app/services/search_recipe.dart';
import 'package:food_app/view/preview_widget.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key, this.recipe}) : super(key: key);
  final RandomRecipe? recipe;

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
      return const Center(child: Text('Please search something else'));
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: getRecipeView(),
    );
  }

  List<Widget> getRecipeView() {
    return recipes!
        .map((e) => const Card(
              child: PreviewWidget(
                recipe: null,
              ),
            ))
        .toList();
  }
}
