
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:userapp/core/utils/app_colors.dart';
import 'package:userapp/features/Home/data/models/category_model.dart';
import 'package:userapp/features/Home/presentation/controller/categories/categories_cubit.dart';
import 'package:userapp/features/Home/presentation/controller/categories/categories_states.dart';
import 'package:userapp/features/Home/presentation/controller/get_top_headline/get_top_headline_cubit.dart';
import 'package:userapp/features/Home/presentation/views/widgets/News_display%20screen.dart';
import '../../../controller/bookmark/bookmark_cubit.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({super.key, required this.categoryModel, required this.index});
  final CategoryModel categoryModel;
  final int index;
  @override
  Widget build(BuildContext context) {

    return BlocBuilder<CategoriesCubit,CategoriesStates>(

      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            BlocProvider.of<CategoriesCubit>(context).changeIndex(index);
            BlocProvider.of<TopHeadlineCubit>(context).gettopHeadline(category: categoryModel.name,index: index, bookmarksList: BlocProvider.of<BookMarksCubit>(context).bookMarksModel);
            Navigator.push(context, MaterialPageRoute(builder: (c){
              return CategoryNewsScreen(index: index,);
            }));
          },
          child: Container(
            margin: EdgeInsets.all(20),

            decoration: BoxDecoration(
              //color:
              //BlocProvider.of<CategoriesCubit>(context).categoryIndex==index?
              //AppColors.blue:AppColors.white

                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                  topLeft: Radius.circular(5),
                  topRight: Radius.circular(5),

                ),
                border: Border.all(color: AppColors.blue)
            ),
              child: Column(
                children: [
                  Image.asset(categories[index].photo,),

                  Text(
                    categoryModel.name,
                    style: TextStyle(color:
                    AppColors.black),
                  ),
                ],
              ),
          ),
        );
      }
    );
  }
}


