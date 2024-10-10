import 'package:flutter/material.dart';
import 'package:userapp/core/utils/app_colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.text, this.onpressend});
final String text;
final void Function()? onpressend;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 389,
      height: 50,
      child: MaterialButton(
          onPressed: onpressend,
        child: Text(text,style: TextStyle(color: AppColors.white),),
        color: AppColors.blue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
        ),

      ),
    );
  }
}
