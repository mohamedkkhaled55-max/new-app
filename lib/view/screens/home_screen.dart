import 'package:flutter/material.dart';
import 'package:news_app/api/result_api.dart';
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
  String? error;
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    getArticles();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("News"))),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemBuilder: (context, index) =>
                  ItemCard(article: articles[index]),
              itemCount: articles.length,
            ),
    );
  }

  void getArticles() async {
    var result = await ApiManager.getNews();

    switch (result) {
      case Success<NewsModel>():
        articles = result.data.articles ?? [];

      case Error<NewsModel>():
        error = result.error;
    }
    isLoading = false;
    setState(() {});
  }
}
