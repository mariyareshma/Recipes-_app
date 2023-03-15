import 'package:flutter/material.dart';
import 'package:food_app/model/recipes.dart';

class ServingSizeWidget extends StatelessWidget {
  const ServingSizeWidget({Key? key, this.servingSizeElement})
      : super(key: key);
  final ServingSizeElement? servingSizeElement;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("ServingSize",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Grams:${servingSizeElement!.grams.toString()}',
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Quantity:${servingSizeElement!.qty.toString()}',
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.normal,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Scale:${servingSizeElement!.scale.toString()}',
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.normal,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                  'OriginalWeight:${servingSizeElement!.originalWeight.toString()}',
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.normal,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                  'OriginalWeightUnits:${servingSizeElement!.originalWeightUnits.toString()}',
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.normal,
                  )),
            ),
          ]),
    );
  }
}
