import 'package:flutter/material.dart';
import 'package:userapp/core/utils/app_colors.dart';
import 'package:userapp/core/utils/app_images.dart';
import 'package:animate_do/animate_do.dart';
import 'package:userapp/features/Home/presentation/views/home_bottom.dart';
import '../../auth/login/presentation/views/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {
  void initState(){
    super.initState();
    Future.delayed(Duration(
      seconds: 2),
        (){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (c){
        return LogInScreen();
      }));
        }
    );
  }
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blue,
      body: BounceInDown(
        child: Center(
            child: Image.asset(AppImages.splash,width: 186,height: 127,)),
      ),
    );
  }
}
