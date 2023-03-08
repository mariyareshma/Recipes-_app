import 'package:flutter/material.dart';
import 'package:food_app/model/recipes.dart';
import 'package:food_app/services/service.dart';
import 'package:food_app/view/favorite_Page.dart';
import 'package:food_app/view/recipe_widget.dart';
import 'package:food_app/view/search_page.dart';

class RecipePage extends StatefulWidget {
  const RecipePage({
    Key? key,
  }) : super(key: key);

  @override
  RecipePageState createState() => RecipePageState();
}

class RecipePageState extends State<RecipePage> {
  RandomRecipe? recipe;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Recipe App')),
      persistentFooterButtons: [
        IconButton(onPressed: () {}, icon: const Icon(Icons.food_bank_sharp)),
        IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FavoritePage()),
              );
            },
            icon: const Icon(Icons.heart_broken)),
        IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SearchPage()),
              );
            },
            icon: const Icon(Icons.search))
      ],
      body: getBody(),
    );
  }

  Widget getBody() {
    return getRecipesFuture();
  }

  Widget getRecipesFuture() {
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

  Widget getListView(List<RandomRecipe>? data) {
    if (data == null || data.isEmpty) {
      return const Center(
        child: Text('Error in getting data'),
      );
    }

    var recipesWidgets = <Widget>[];
    for (var recipes in data) {
      var recipesWidget = Column(
        children: [
          Text(recipes.id.toString()),
          Text(recipes.name!),
          Text(recipes.description!),
          Image.network(
            recipes.image!,
            width: 200,
            height: 200,
          )
        ],
      );

      recipesWidgets.add(recipesWidget);
    }

    return ListView(children: recipesWidgets);
  }
}
