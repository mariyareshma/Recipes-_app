import 'package:flutter/material.dart';

class StepsWidget extends StatelessWidget {
  const StepsWidget({Key? key, required this.steps}) : super(key: key);
  final List<String> steps;

  @override
  Widget build(BuildContext context) {
    if (steps.isEmpty) {
      return Container();
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text('Steps :',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        ),
        for (var item in steps)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              '* $item',
              style:
                  const TextStyle(fontSize: 17, fontWeight: FontWeight.normal),
            ),
          )
      ],
    );
  }
}
