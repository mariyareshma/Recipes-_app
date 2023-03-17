import 'package:flutter/material.dart';
import 'package:food_app/model/favorite_recipe.dart';

class PreviewWidget extends StatefulWidget {
  const PreviewWidget({Key? key, required this.recipe}) : super(key: key);
  final FavoriteRecipe? recipe;

  @override
  PreviewWidgetState createState() => PreviewWidgetState();
}

class PreviewWidgetState extends State<PreviewWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
      leading: Image.network(widget.recipe!.image!),
      title: Text(widget.recipe!.title!),
      subtitle: Text(widget.recipe!.description!),
    ));
  }
}
