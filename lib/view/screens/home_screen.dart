import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/data/news_model.dart';
import 'package:news_app/view/widgets/item_card.dart';
import 'package:news_app/view_model/new_cubit.dart';
import 'package:news_app/view_model/news_state.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..fetchNews(),
      child: Scaffold(
        appBar: AppBar(title: Center(child: Text("News"))),
        body: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            if (state is HomeSuccess) {
              return _successView(state.articles);
            } else if (state is HomeError) {
              return Center(child: Text(state.messageError));
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
        // isLoading
        // ? Center(child: CircularProgressIndicator())
        // : ListView.builder(
        //     itemBuilder: (context, index) =>
        //         ItemCard(article: articles[index]),
        //     itemCount: articles.length,
        //   ),
      ),
    );
  }

  Widget _successView(List<Article> articles) {
    return ListView.builder(
      itemBuilder: (context, index) => ItemCard(article: articles[index]),
      itemCount: articles.length,
    );
  }
}
