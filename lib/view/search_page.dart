import 'package:flutter/material.dart';
import 'package:food_app/model/recipes.dart';
import 'package:food_app/view/recipe_widget.dart';

import '../services/search_recipe.dart';

class SearchPage extends StatefulWidget {
  SearchPage({
    Key? key,
  }) : super(key: key);

  @override
  SearchPageState createState() => SearchPageState();
}

class SearchPageState extends State<SearchPage> {
  late List<RandomRecipe?> recipes;
  var isLoading = false;

  TextEditingController recipeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () async {
                  setState(() {
                    isLoading = true;
                  });

                  try {
                    var finalResult =
                        await getRecipeSearchResult(recipeController.text);
                    setState(() {
                      recipes = finalResult;
                    });
                  } catch (err) {
                    debugPrint(err.toString());
                  } finally {
                    setState(() {
                      isLoading = false;
                    });
                  }
                },
                icon: const Icon(Icons.arrow_right_alt))
          ],
          title: TextField(
            keyboardType: TextInputType.text,
            controller: recipeController,
            decoration: const InputDecoration(
                icon: Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                hintText: 'Search'),
          )),
      body: getBody(),
    );
  }

  Widget getBody() {
    if (isLoading == true) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    if (recipes == null) {
      return Container();
    }
    return getListView(recipes);
  }

  Widget getListView(List<RandomRecipe?> data) {
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
