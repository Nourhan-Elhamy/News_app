import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:userapp/core/utils/app_colors.dart';
import 'package:userapp/features/Home/data/models/category_model.dart';
import 'package:userapp/features/Home/presentation/views/widgets/home/home_screen.dart';

import '../../../data/models/new_model.dart';
import '../../controller/bookmark/bookmark_cubit.dart';
import '../../controller/categories/categories_cubit.dart';
import '../../controller/get_top_headline/get_top_headline_cubit.dart';
import '../../controller/get_top_headline/get_top_headline_states.dart';
import 'home/list_view_for_news.dart';



class CategoryNewsScreen extends StatefulWidget {


  const CategoryNewsScreen({super.key, required this.index, });
final int index;

  @override
  State<CategoryNewsScreen> createState() => _CategoryNewsScreenState();
}

class _CategoryNewsScreenState extends State<CategoryNewsScreen> {

  @override
  Widget build(BuildContext context) {

    return RefreshIndicator(
      onRefresh: ()async{
        BlocProvider.of<TopHeadlineCubit>(context).gettopHeadline(category: "sports", bookmarksList: BlocProvider.of<BookMarksCubit>(context).bookMarksModel);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(categories[widget.index].name),
          centerTitle: true,
        ),

        body: GestureDetector(

          child: BlocConsumer<TopHeadlineCubit,TopHeadlineStates>(
              listener: (context,state){
                if(state is GetTopHeadlineFailureStates){
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content:Text(state.errorMessage)));
                }
              },
              builder: (context, state) {

                int key = BlocProvider.of<CategoriesCubit>(context).categoryIndex;
                List<NewModel> ? news=BlocProvider.of<TopHeadlineCubit>(context).mapForNews[key];

                return Expanded(child: state is GetTopHeadlineLoadingStates && news==null
                    || state is GetTopHeadlineLoadingStates && news!.isEmpty
                    ?
                Center(
                    child: CircularProgressIndicator()
                )
                    :
                state is GetTopHeadlineFailureStates?
                Center(child: Column(

                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    Icon(Icons.error),

                    TextButton(onPressed: (){


                      BlocProvider.of<TopHeadlineCubit>(context).gettopHeadline(category: "sports",index: 0, bookmarksList: BlocProvider.of<BookMarksCubit>(context).bookMarksModel);


                    }, child: Text("Try Again"))
                  ],
                ),)
                    :
                ListViewForNewsWidget(newsw:news!));
              }
          ),
        )


      ),
    );
  }
}



