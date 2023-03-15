import 'package:flutter/material.dart';

class TagsWidget extends StatelessWidget {
  const TagsWidget({Key? key, required this.tags}) : super(key: key);
  final List<String> tags;

  @override
  Widget build(BuildContext context) {
    if (tags.isEmpty) {
      return Container();
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text('Tags :',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        ),
        for (var tag in tags)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              '*  $tag',
              style:
                  const TextStyle(fontSize: 17, fontWeight: FontWeight.normal),
            ),
          )
      ],
    );
  }
}
