
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:userapp/features/Home/data/models/new_model.dart';
import 'package:userapp/features/Home/data/repos/home_repo.dart';
import 'package:userapp/features/Home/presentation/controller/get_top_headline/get_top_headline_states.dart';

class TopHeadlineCubit extends Cubit<TopHeadlineStates>{

  TopHeadlineCubit({required this.homeRepo,}):super  (GetTopHeadlineInitialStates());

 List <NewModel> topHeadlineslist=[];

Map<int,List<NewModel>> mapForNews={};

  final HomeRepo homeRepo;

  Future<void> gettopHeadline({
    required String category,
    int index = 0,
    required List<NewModel> bookmarksList
  }) async {

    emit(GetTopHeadlineLoadingStates());

    var result = await homeRepo.TopHeadlineForNews(category: category);

    result.fold((left) {

      emit(GetTopHeadlineFailureStates(errorMessage: left.message));

    },
            (right) {
      topHeadlineslist=right;

      topHeadlineslist = topHeadlineslist.map((newsItem) {
        // first new   --> newsItem
        if (bookmarksList.any((bookmark) => bookmark == newsItem)) {
          newsItem.bookMark = true; // Assuming you have a `isBookmarked` field
        }
        return newsItem;
      }).toList();


      mapForNews.addAll({
        index:topHeadlineslist
      });

      emit(GetTopHeadlineSucessStates());
            });
  }
}