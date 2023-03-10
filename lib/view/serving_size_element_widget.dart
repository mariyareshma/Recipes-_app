import 'package:flutter/material.dart';
import 'package:food_app/model/recipes.dart';

class ServingSizeWidget extends StatelessWidget {
  const ServingSizeWidget({Key? key, required this.servingSize})
      : super(key: key);
  final List<ServingSizeElement> servingSize;

  @override
  Widget build(BuildContext context) {
    if (servingSize.isEmpty) {
      return Container();
    }
    var result = 'ServingSizeElement: ';

    for (var serving in servingSize) {
      result = '$result$serving, ';
    }
    if (servingSize.isNotEmpty) {
      result = result.substring(0, result.length - 2);
    }

    return Text(
      result,
      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
    );
  }
}
