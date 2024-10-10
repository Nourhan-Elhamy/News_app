import 'package:flutter/material.dart';
import 'package:userapp/core/utils/app_colors.dart';

class CustomTextfield extends StatelessWidget {
  const CustomTextfield({super.key, required this.name,  required this.controller, this.obscuretext=false,});
  final String name;

 final bool? obscuretext;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return Column(
     crossAxisAlignment: CrossAxisAlignment.start,
      children: [
       RichText(
           text: TextSpan(
             text: name,
             style: TextStyle(
               color: AppColors.black
             ),
             children: [
               TextSpan(
                 text: "*",
                 style: TextStyle(
                   color: Colors.red
                 )
               )
             ]
           ),

       ),
        TextFormField(
          obscureText: obscuretext!,
          controller: controller,
          onTapOutside: (e){
            FocusManager.instance.primaryFocus?.unfocus();
          },
          decoration: InputDecoration(

            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: BorderSide(color: AppColors.grey)
            ),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: BorderSide(color: AppColors.grey)
            )
          ),
        ),
      ],
    );
  }
}
