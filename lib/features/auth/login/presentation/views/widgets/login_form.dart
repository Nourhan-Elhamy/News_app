import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:userapp/core/shared%20widjets/custom_button.dart';
import 'package:userapp/core/shared%20widjets/custom_textfield.dart';
import 'package:userapp/core/utils/app_colors.dart';
import 'package:userapp/core/utils/app_images.dart';
import 'package:userapp/features/auth/register/presentation/views/register_screen.dart';

class LoginForm extends StatefulWidget {
   LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  @override
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(25),
      children: [
        Image.asset(AppImages.login,width: 72,height: 24,),
        SizedBox(height: 47,),
        CustomTextfield(name: "Email",controller: emailController,),
        SizedBox(height: 29,),
        CustomTextfield(name: "Password",obscuretext: true,controller: passwordController,),
        SizedBox(height: 9,),
        Text("Forgot the password?",textAlign: TextAlign.right,style: TextStyle(color: AppColors.blue),),
        SizedBox(height: 33,),
       CustomButton(text: "Login",
         onpressend: (){

         }
         ,),
        SizedBox(height: 20,),

        Text("or continue with",textAlign: TextAlign.center),
        SizedBox(height: 20,),
        Row(

          children: [
          Container(
            width: 160,
            height: 48,
            decoration: BoxDecoration(
              color: AppColors.grey.withOpacity(0.1),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Image.asset(AppImages.facebook),
              Text("Facebook",style: TextStyle(color: AppColors.grey),)
            ],),
          ),
            SizedBox(width: 31,),
            Container(
              width: 160,
              height: 48,
              decoration: BoxDecoration(
                color: AppColors.grey.withOpacity(0.1),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(AppImages.google),
                  Text("Google",style: TextStyle(color: AppColors.grey),)
                ],),
            )
        ],),
        SizedBox(height: 31,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Text("don’t have an account ?",),
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (c){
                  return SignupScreen();
                }));
              },
                child: Text(" Sign Up",style: TextStyle(color: AppColors.blue),)),

        ],)
      ],
    );
  }
}
