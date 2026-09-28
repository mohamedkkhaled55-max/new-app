import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/api/result_api.dart';
import 'package:news_app/data/api_manager.dart';
import 'package:news_app/data/news_model.dart';
import 'package:news_app/view_model/news_state.dart';
class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  void fetchNews() async {
    emit(HomeLoading());

    var result = await ApiManager.getNews();

    switch (result) {
      case Success<NewsModel>():
        var articles = result.data.articles ?? [];
        emit(HomeSuccess(articles));

      case Error<NewsModel>():
      
        var error = result.error;
        emit(HomeError(error));
  
    }
  }
}