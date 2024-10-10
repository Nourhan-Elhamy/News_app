import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:userapp/features/Home/data/models/new_model.dart';
import 'package:userapp/features/Home/presentation/controller/bookmark/bookmark_states.dart';

class BookMarksCubit extends Cubit<BookMarkStates>{
    BookMarksCubit():super (BookMarkInitialStates());



    changeBookMark( NewModel newModel){
      newModel.bookMark=!newModel.bookMark;

      if(newModel.bookMark==true){
        addToBookMark(newModel: newModel);
      }

      else{
        removeBookMarks(newModel: newModel);
      }
      emit(ChangeBookMarksColor());


    }


List<NewModel> bookMarksModel=[];


    addToBookMark({required NewModel newModel}){
      bookMarksModel.add(newModel);
    }


    removeBookMarks({required NewModel newModel}){
      bookMarksModel.remove(newModel);
}
}