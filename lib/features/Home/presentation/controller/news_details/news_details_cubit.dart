import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:userapp/features/Home/data/models/new_model.dart';
import 'package:userapp/features/Home/data/repos/home_repo.dart';


import 'news_details_states.dart';

class NewsDetailCubit extends Cubit<NewsDetailStates> {
  final HomeRepo homeRepo;

  NewsDetailCubit({required this.homeRepo}) : super(NewsDetailInitialState());

  Future<void> fetchNewsDetail(String newsId) async {
    emit(NewsDetailLoadingState());

    try {
      var result = await homeRepo.getNewsDetail(newsId);

      result.fold(
            (left) {
          emit(NewsDetailFailureState(left.message));
        },
            (right) {

          emit(NewsDetailSuccessState(right as NewModel));
        },
      );
    } catch (e) {
      emit(NewsDetailFailureState(e.toString()));
    }
  }
}
