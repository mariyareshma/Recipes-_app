import 'package:flutter/material.dart';

class TagsWidget extends StatelessWidget {
  const TagsWidget({Key? key, required this.tags}) : super(key: key);
  final List<String> tags;

  @override
  Widget build(BuildContext context) {
    if (tags.isEmpty) {
      return Container();
    }
    var result = ' ';

    for (var tag in tags) {
      result = '$result$tag, ';
    }
    if (tags.isNotEmpty) {
      result = result.substring(0, result.length - 2);
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Tag :',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Text(
            result,
            style: const TextStyle(fontSize: 17, fontWeight: FontWeight.normal),
          ),
        ],
      ),
    );
  }
}
