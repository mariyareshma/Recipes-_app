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
  List<RandomRecipes>? recipes;
  var isLoading = false;

  TextEditingController recipeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextField(
            keyboardType: TextInputType.text,
            controller: recipeController,
            decoration: const InputDecoration(
                icon: Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                hintText: 'Search'),
            onSubmitted: (value) {
              setState(() {
                isLoading = true;
              });
              try {
                //Api call
                var recipe = SearchResult();
                recipe.name;

                var recipeResult = getRecipeSearchResult(recipe);
                recipe = recipeResult as SearchResult;
              } catch (err) {
                debugPrint(err.toString());
              } finally {
                setState(() {
                  isLoading = false;
                });
              }
            },
          ),
        ],
      ),
      body: getBody(),
    );
  }

  Widget getBody() {
    if (isLoading = true) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    if (recipes == null) {
      return const Text('Please search something else');
    }

    List<Widget> getRecipeView(List<RandomRecipe?> recipes) {
      return recipes
          .map((e) => GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => PreviewWidget(
                              recipe: e,
                            ))));
              },
              child: PreviewWidget(
                recipe: e,
              )))
          .toList();
    }

    return Card(
      child: Row(
        children: [
          Center(
            child: Text(widget.recipe!.name!),
          ),
          IconButton(onPressed: () {}, icon: const Icon(Icons.favorite)),
          Center(child: Image.network(widget.recipe!.image.toString())),
          Column(
            children: [
              Text(widget.recipe!.description!),
              Text(widget.recipe!.cookTime.toString())
            ],
          ),
        ],
      ),
    );
  }
}
