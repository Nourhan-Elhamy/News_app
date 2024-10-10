
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:userapp/features/Home/presentation/views/home_bottom.dart';
import 'package:userapp/features/auth/profile/presentation/views/profile_screen.dart';
import 'package:userapp/features/auth/register/presentation/controller/register_cubit.dart';
import 'package:userapp/features/auth/register/presentation/controller/register_state.dart';

import '../../../../../../core/shared widjets/custom_button.dart';
import '../../../../../../core/shared widjets/custom_textfield.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/app_images.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(25),
      children: [
        Image.asset(AppImages.signup, width: 72, height: 24),
        SizedBox(height: 23),
        CustomTextfield(name: "Email", controller: emailController),
        SizedBox(height: 16),
        CustomTextfield(name: "Password", obscuretext: true,controller: passwordController),
        SizedBox(height: 33),
        BlocConsumer<RegisterCubit, RegisterState>(
          listener: (context, state) {
            if (state is RegisterFailureState) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(state.errorMessage),
              ));
            } else if (state is RegisterSuccessState) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => ProfileScreen()),
              );
            }
          },
          builder: (context, state) {
            return state is RegisterLoadingState
                ? Center(child: CircularProgressIndicator())
                : CustomButton(
              text: "Signup",
              onpressend: () {
                BlocProvider.of<RegisterCubit>(context).signUpWithFirebase(
                  email: emailController.text.trim(),
                  pas: passwordController.text.trim(),
                  context: context,
                );
              },
            );
          },
        ),
        SizedBox(height: 20),
        Text("or continue with", textAlign: TextAlign.center),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {

              },
              child: Container(
                width: 160,
                height: 48,
                decoration: BoxDecoration(
                  color: AppColors.grey.withOpacity(0.1),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(AppImages.facebook),
                    SizedBox(width: 8),
                    Text(
                      "Facebook",
                      style: TextStyle(color: AppColors.grey),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(width: 31),
            GestureDetector(
              onTap: () {
                BlocProvider.of<RegisterCubit>(context).signUpWithGoogle();
              },
              child: Container(
                width: 160,
                height: 48,
                decoration: BoxDecoration(
                  color: AppColors.grey.withOpacity(0.1),
                ),
                child: Row(


                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(AppImages.google),
                    SizedBox(width: 8),
                    Text(
                      "Google",
                      style: TextStyle(color: AppColors.grey),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 31),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("don’t have an account?"),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Text(
                " Sign In",
                style: TextStyle(color: AppColors.blue),
              ),
            ),
          ],
        ),
      ],
    );
  }
}