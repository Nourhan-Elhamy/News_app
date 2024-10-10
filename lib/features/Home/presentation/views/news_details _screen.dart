import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:userapp/features/Home/data/repos/home_repo_implemetation.dart';
import 'package:userapp/features/Home/presentation/controller/news_details/news_details_cubit.dart';

import '../../data/models/category_model.dart';

class DetailsNewsScreen extends StatelessWidget {
  const DetailsNewsScreen({super.key, });


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=> NewsDetailCubit(homeRepo: HomeRepoImplementationFromApi()),
      child: Scaffold(
      body: Column(
        children: [

        ],
      ),
      ),
    );
  }
}
