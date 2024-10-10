import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:userapp/features/Home/data/repos/home_repo.dart';
import 'package:userapp/features/Home/presentation/controller/search_cubit/search_states.dart';
import '../../../data/models/new_model.dart';


class SearchCubit extends Cubit<SearchStates>{
  SearchCubit({required this.homeRepo}):super (GetSearchLoadingStates());

List<NewModel> searchNewslist=[];
  final HomeRepo homeRepo;
  Future<void> getsearch({required String q})async{

    emit(GetSearchLoadingStates());

    var result= await homeRepo.searchForNews(q: q) ;
    result.fold((left) {
      emit(GetSearchFailureStates(errorMessage: left.message));
    },
            (right) {
      searchNewslist = right;
      emit(GetSearchSuccessStates());
            });
  }

}