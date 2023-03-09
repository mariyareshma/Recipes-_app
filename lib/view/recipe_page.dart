import 'package:flutter/material.dart';
import 'package:food_app/model/recipes.dart';
import 'package:food_app/services/service.dart';
import 'package:food_app/view/favorite_page.dart';
import 'package:food_app/view/search_page.dart';

class RecipePage extends StatefulWidget {
  const RecipePage({
    Key? key,
  }) : super(key: key);

  @override
  RecipePageState createState() => RecipePageState();
}

class RecipePageState extends State<RecipePage> {
  RandomRecipe? recipes;

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

  Widget getRandomFuture() {
    return FutureBuilder(
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return getListView();
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
      future: getRandomRecipe(),
    );
  }

  Widget getBody() {
    return getRandomFuture();
  }

  Widget getListView() {
    return Row(
      children: [
        IconButton(
            onPressed: () {
              // if(){

              // }
            },
            icon: const Icon(Icons.heart_broken)),
        Image.network(recipes!.image.toString()),
        Column(
          children: [Text(recipes!.name!), Text(recipes!.description!)],
        )
      ],
    );
  }
}
