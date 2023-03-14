import 'package:flutter/material.dart';

class NutrientsWidget extends StatelessWidget {
  const NutrientsWidget({Key? key, required this.unit, this.nutrient})
      : super(key: key);
  final String? nutrient;
  final String? unit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(nutrient!,
                style: const TextStyle(
                    fontSize: 17, fontWeight: FontWeight.normal)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(unit!,
                style: const TextStyle(
                    fontSize: 17, fontWeight: FontWeight.normal)),
          )
        ],
      ),
    );
  }
}
