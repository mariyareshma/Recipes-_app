import 'package:flutter/material.dart';
import 'package:food_app/model/recipes.dart';

class PreviewWidget extends StatefulWidget {
  const PreviewWidget({Key? key, this.recipe}) : super(key: key);
  final RandomRecipe? recipe;

  @override
  PreviewWidgetState createState() => PreviewWidgetState();
}

class PreviewWidgetState extends State<PreviewWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Search Result')),
      body: Column(children: [
        Text(widget.recipe!.name!),
        Image.network(widget.recipe!.image!.toString()),
        Text(widget.recipe!.description!),
        Text(widget.recipe!.cookTime.toString())
      ]),
    );
  }
}
