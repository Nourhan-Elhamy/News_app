import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:userapp/features/Home/presentation/controller/categories/categories_states.dart';

class CategoriesCubit extends Cubit<CategoriesStates>{
  CategoriesCubit():super(CategoriesInitialStates());


  int categoryIndex=0;
  changeIndex(int index){
    this.categoryIndex=index;
    emit(ChangeColorStates());
  }
}