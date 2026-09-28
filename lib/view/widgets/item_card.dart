import 'package:flutter/material.dart';
import 'package:news_app/data/news_model.dart';
import 'package:news_app/view/widgets/image_news.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({super.key, required this.article});
  final Article article;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: .start,
        spacing: 10,
        children: [
          ImageNews(image: article.urlToImage ?? image),
          Text(
            article.author ?? "",
            style: Theme.of(context).textTheme.titleSmall,
          ),
          Text(
            article.title ?? "",
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ],
      ),
    );
  }
}

String image =
    "https://imgs.search.brave.com/6HTmkrs86xIbHszERypQBVSqhAIY9u7Z4AQSoL1C1I0/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9tZWRp/YS5pc3RvY2twaG90/by5jb20vaWQvMTg3/MTMyOTczNS9waG90/by9jYXRzLW5vc2Uu/anBnP3M9NjEyeDYx/MiZ3PTAmaz0yMCZj/PVVHWGgtS21yTm9Z/Tl9va05zM2tlWmFm/M1VHMUZ1akRmMVFN/djlvNDRmbTQ9";
