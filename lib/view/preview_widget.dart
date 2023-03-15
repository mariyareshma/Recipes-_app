import 'package:flutter/material.dart';
import 'package:food_app/model/recipes.dart';
import 'package:food_app/services/book_mark_service.dart';

class PreviewWidget extends StatefulWidget {
  const PreviewWidget({Key? key, required this.recipe}) : super(key: key);
  final RandomRecipe? recipe;

  @override
  PreviewWidgetState createState() => PreviewWidgetState();
}

class PreviewWidgetState extends State<PreviewWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 5,
              child: Column(children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.network(
                        widget.recipe!.image!,
                        width: 100,
                      ),
                    ),
                    getFavoriteRecipe(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        widget.recipe!.name!,
                        style: const TextStyle(
                            fontSize: 15,
                            color: Colors.green,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            widget.recipe!.description!,
                            style: const TextStyle(
                                fontSize: 15, overflow: TextOverflow.ellipsis),
                          ),
                        ),
                        Text(
                          widget.recipe!.cookTime.toString(),
                          style: const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                      ],
                    )
                  ],
                ),
              ]),
            )));
  }

  FutureBuilder<bool?> getFavoriteRecipe() {
    return FutureBuilder(
        future: recipeBookmarked(widget.recipe!),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var bookmark = snapshot.data ?? false;
            return IconButton(
                onPressed: (() async {
                  if (bookmark) {
                    await addRecipeBookmark(widget.recipe!);
                  } else {
                    await removeBookmark(widget.recipe!);
                  }
                  setState(() {});
                }),
                icon: Icon(
                  Icons.favorite,
                  color: bookmark ? Colors.red : Colors.green,
                  size: 25,
                ));
          }
          return const CircularProgressIndicator();
        });
  }
}
