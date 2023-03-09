import 'package:flutter/material.dart';
import 'package:food_app/model/recipes.dart';
import 'package:food_app/services/service.dart';
import 'package:food_app/view/favorite_page.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Recipe App')),
        persistentFooterButtons: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.food_bank_sharp,
                  size: 40,
                  color: Colors.green,
                )),
            IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FavoritePage()),
                  );
                },
                icon: const Icon(
                  Icons.heart_broken,
                  size: 40,
                  color: Colors.green,
                )),
            IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SearchPage()),
                  );
                },
                icon: const Icon(
                  Icons.search,
                  size: 40,
                  color: Colors.green,
                ))
          ])
        ],
        body: getRecipeFuture());
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
