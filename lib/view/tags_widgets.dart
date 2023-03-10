import 'package:flutter/material.dart';

class TagsWidget extends StatelessWidget {
  const TagsWidget({Key? key, required this.tags}) : super(key: key);
  final List<String> tags;

  @override
  Widget build(BuildContext context) {
    if (tags.isEmpty) {
      return Container();
    }
    var result = 'Tags: ';

    for (var tag in tags) {
      result = '$result$tag, ';
    }
    if (tags.isNotEmpty) {
      result = result.substring(0, result.length - 2);
    }

    return Text(
      result,
      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
    );
  }
}
