import 'package:flutter/material.dart';
import 'package:userapp/features/Home/data/models/new_model.dart';
import 'new_widget.dart';


class ListViewForNewsWidget extends StatelessWidget {
  const ListViewForNewsWidget({super.key, required this.newsw});

  final List<NewModel> newsw;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: newsw.length,
        itemBuilder: (context , int index){
          return NewsWidget(newModel: newsw[index]);
        }
    );
  }
}


