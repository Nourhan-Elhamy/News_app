import 'package:flutter/material.dart';
import 'package:userapp/core/utils/app_colors.dart';
import 'package:userapp/core/utils/app_images.dart';
import 'package:userapp/features/Home/presentation/views/search_screen.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (c){
          return SearchScreen();
        }));
      },
      child: Container(
        padding: EdgeInsets.all(5),
        alignment: Alignment.centerLeft,
        child: Row(
          children: [
            Image.asset(AppImages.searchicon),
            SizedBox(width: 5,),
            Text("Search",style: TextStyle(color: AppColors.blue,fontWeight: FontWeight.w500),)
          ],
        ),
        margin: EdgeInsets.all(10),
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          border: Border.all(color: AppColors.blue)
        ),
      ),
    );
  }
}
