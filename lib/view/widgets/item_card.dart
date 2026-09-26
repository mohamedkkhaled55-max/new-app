import 'package:flutter/material.dart';
import 'package:news_app/view/widgets/image_news.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: .start,
        spacing: 10,
        children: [
          ImageNews(image: "https://imgs.search.brave.com/g8GSnndQM9jl68WpGxuKfFH1BemuR9-DC55QEP9acwk/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9tYXJr/ZXRwbGFjZS5jYW52/YS5jb20vTUFEUTRs/S3c4T00vMS90aHVt/Ym5haWxfbGFyZ2Ut/MS9jYW52YS1jbG9z/ZS11cC1vZi1zdXJw/cmlzZWQtY2F0LU1B/RFE0bEt3OE9NLmpw/Zw"),
          Text("Europe", style: Theme.of(context).textTheme.titleSmall),
          Text(
            "Russian warship: Moskva sinks in Black Sea",
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ],
      ),
    );
  }
}
