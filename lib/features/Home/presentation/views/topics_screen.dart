import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:userapp/features/Home/data/models/category_model.dart';


import 'widgets/home/categories_widget.dart'; // Import the new screen

class TopicsScreen extends StatefulWidget {
  const TopicsScreen({super.key});

  @override
  State<TopicsScreen> createState() => _TopicsScreenState();
}

class _TopicsScreenState extends State<TopicsScreen> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: GridView.builder(

          itemCount: categories.length,

          itemBuilder: (context,int index){

            return CategoryWidget(categoryModel: categories[index], index: index,);

          }, gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2
        
      ),
      ),
    );
  }}
