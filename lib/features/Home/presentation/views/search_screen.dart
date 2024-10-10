import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:userapp/features/Home/data/repos/home_repo_implemetation.dart';
import 'package:userapp/features/Home/presentation/controller/search_cubit/search_states.dart';
import 'package:userapp/features/Home/presentation/controller/search_cubit/searh_cubit.dart';
import 'package:userapp/features/Home/presentation/views/widgets/home/list_view_for_news.dart';

import '../../../../core/utils/app_colors.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (context) =>SearchCubit(homeRepo: HomeRepoImplementationFromApi()),

      child: Scaffold(
        appBar: AppBar(),
        body: SearchBody()
      ),
    );
  }
}


class SearchBody extends StatelessWidget {
  const SearchBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchCubit,SearchStates>(

      listener: (context,state){

      },
      builder: (context, state){
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.blue)
                  )
                      ,focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.blue)

                )
                ),
                onChanged: (q){
                  BlocProvider.of<SearchCubit>(context).getsearch(q: q.trim());
                },
              ),
            ),
            Expanded(child: state is GetSearchLoadingStates ?
             Center(child: CircularProgressIndicator(),):

              ListViewForNewsWidget(newsw: BlocProvider.of<SearchCubit>(context).searchNewslist))
          ],
        );
      }
    );
  }
}
