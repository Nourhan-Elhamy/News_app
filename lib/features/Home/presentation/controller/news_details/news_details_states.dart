// news_detail_states.dart

import '../../../data/models/new_model.dart';

abstract class NewsDetailStates {}

class NewsDetailInitialState extends NewsDetailStates {}

class NewsDetailLoadingState extends NewsDetailStates {}

class NewsDetailSuccessState extends NewsDetailStates {
  final NewModel newsDetail;

  NewsDetailSuccessState(this.newsDetail);
}

class NewsDetailFailureState extends NewsDetailStates {
  final String errorMessage;

  NewsDetailFailureState(this.errorMessage);
}
