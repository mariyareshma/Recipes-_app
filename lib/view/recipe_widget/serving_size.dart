import 'package:flutter/material.dart';

import '../../model/recipes.dart';

class ServingSizemWidget extends StatelessWidget {
  const ServingSizemWidget({Key? key, required this.servingSize})
      : super(key: key);
  final IngredientServingSize? servingSize;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        'Grams:${servingSize!.grams.toString()}',
        style: const TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.normal,
        ),
      ),
      Text(
        'Desc:${servingSize!.desc.toString()}',
        style: const TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.normal,
        ),
      ),
      Text(
        'Quantity:${servingSize!.qty.toString()}',
        style: const TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.normal,
        ),
      ),
      Text(
        'Scale:${servingSize!.scale.toString()}',
        style: const TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.normal,
        ),
      ),
    ]);
  }
}
