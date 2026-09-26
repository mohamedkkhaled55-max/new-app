import 'package:flutter/material.dart';
import 'package:news_app/view/widgets/image_news.dart';
import 'package:news_app/view/widgets/item_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("News"))),
      body: Column(children: [ItemCard()]),
    );
  }
}

