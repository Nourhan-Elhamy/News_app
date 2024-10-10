import 'package:flutter/material.dart';
import 'package:userapp/core/utils/app_colors.dart';
import 'package:userapp/features/auth/login/presentation/views/widgets/login_body.dart';


class LogInScreen extends StatelessWidget {
  const LogInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blue,
      body: LoginBody(),
    );
  }
}