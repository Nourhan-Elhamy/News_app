

import 'dart:io';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:userapp/core/utils/app_colors.dart';
import 'package:userapp/core/utils/app_images.dart';
import 'package:userapp/features/Home/data/models/category_model.dart';
import 'package:userapp/features/Home/presentation/views/bookmarks_screen.dart';
import 'package:userapp/features/Home/presentation/views/profile_screen.dart';
import 'package:userapp/features/Home/presentation/views/topics_screen.dart';

import 'package:userapp/features/Home/presentation/views/widgets/home/home_screen.dart';
import 'package:userapp/features/auth/profile/presentation/views/profile_screen.dart';

import 'widgets/home/categories_widget.dart';

class HomeBottom extends StatefulWidget {
   HomeBottom({super.key, required this.photo, required this.name, required this.phone, required this.email});
   final File photo;
   final String name;
   final String phone;
   final String email;
  @override
  State<HomeBottom> createState() => _HomeBottomState();
}

class _HomeBottomState extends State<HomeBottom> {
   int currentIndex=0;


final List<Widget>lst= [
  HomeScreen(),
  TopicsScreen(),
  BookMarksScreen(),

];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: CircleAvatar(
          backgroundImage: FileImage(widget.photo),
        ),
        title: Image.asset(AppImages.splash,color: AppColors.blue,
        width: 144,
        height: 63,),
        toolbarHeight: 120,
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (c){
                return ProfileDetailsScreen(photo: widget.photo, name: widget.name, phone: widget.phone, email: widget.email,);
              }));
            },
            icon: Icon(Icons.person,color: AppColors.blue,size: 40,),)
        ],
      ),
      body: lst[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: ( index){
          currentIndex=index;
          setState(() {

          });
        },
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,

        selectedItemColor: AppColors.blue,
        unselectedItemColor: AppColors.grey,
        items: [
        BottomNavigationBarItem(icon:Image.asset( currentIndex==0?AppImages.homeActiveicon:AppImages.homeunactiveIcon,width: 19,), label: "Home" ),
        BottomNavigationBarItem(icon:Image.asset( currentIndex==1?AppImages.topicactiveicon:AppImages.topicsunactiveicon,width: 19) ,label: "Topics" ),
        BottomNavigationBarItem(icon: Image.asset(currentIndex==2?AppImages.bookmarkactiveicon:AppImages.bookMarksunactiveIcon,width: 19),label: "Bookmark")
      ],),
    );
  }
}
