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
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ),
              servingSizeElement!.grams != null
                  ? Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        servingSizeElement!.grams.toString(),
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.normal),
                      ),
                    )
                  : Container(),
              servingSizeElement!.originalWeight != null
                  ? Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        servingSizeElement!.originalWeight.toString(),
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.normal),
                      ),
                    )
                  : Container(),
              servingSizeElement!.originalWeightUnits != null
                  ? Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(servingSizeElement!.originalWeightUnits ?? '',
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.normal)),
                    )
                  : Container(),
              servingSizeElement!.qty != null
                  ? Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(servingSizeElement!.qty.toString(),
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.normal)),
                    )
                  : Container(),
              servingSizeElement!.units != null
                  ? Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(servingSizeElement!.units ?? '',
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.normal)),
                    )
                  : Container(),
            ]));
  }
}
