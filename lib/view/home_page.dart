import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Recipe App')),
      persistentFooterButtons: [
        TextButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.food_bank),
            label: const Text('Recipe')),
        TextButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.bookmark),
            label: const Text('Favorite Page')),
        TextButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.search),
            label: const Text('search')),
      ],
      body: Container(),
    );
  }
}
