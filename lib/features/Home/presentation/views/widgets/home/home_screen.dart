import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:userapp/features/Home/data/models/category_model.dart';
import 'package:userapp/features/Home/data/models/new_model.dart';
import 'package:userapp/features/Home/presentation/controller/bookmark/bookmark_cubit.dart';
import 'package:userapp/features/Home/presentation/controller/categories/categories_cubit.dart';
import 'package:userapp/features/Home/presentation/controller/get_top_headline/get_top_headline_cubit.dart';
import 'package:userapp/features/Home/presentation/controller/get_top_headline/get_top_headline_states.dart';
import 'package:userapp/features/Home/presentation/views/widgets/home/search_widget.dart';

import 'categories_widget.dart';
import 'list_view_for_news.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {

  void initState(){
    super.initState();
    BlocProvider.of<TopHeadlineCubit>(context).gettopHeadline(category: "sports",index: 0,
        bookmarksList: BlocProvider.of<BookMarksCubit>(context).bookMarksModel);
  }
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (c)=>CategoriesCubit(),
      child: RefreshIndicator(
        onRefresh: ()async{
          BlocProvider.of<TopHeadlineCubit>(context).gettopHeadline(
              category: "sports",
              index: 0,
              bookmarksList: BlocProvider.of<BookMarksCubit>(context).bookMarksModel);
        },
        child: Column(
          children: [
            SearchWidget(),
           //CategoryScreen(),
            BlocConsumer<TopHeadlineCubit,TopHeadlineStates>(
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
            )
          ],
        ),
      ),
    );
  }
}


