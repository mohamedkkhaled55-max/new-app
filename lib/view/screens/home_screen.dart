import 'package:flutter/material.dart';
import 'package:news_app/data/api_manager.dart';
import 'package:news_app/data/news_model.dart';
import 'package:news_app/view/widgets/image_news.dart';
import 'package:news_app/view/widgets/item_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Article> articles = [];

  @override
  void initState() {
    super.initState();
    getArticles();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("News"))),
      body: ListView.builder(
        itemBuilder: (context, index) => ItemCard(article: articles[index]),
        itemCount: articles.length,
      ),
    );
  }

 void  getArticles() async {
    var newModel= await ApiManager.getNews();
    articles = newModel.articles?? [];
    setState(() {});
  }
}
