import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:userapp/features/auth/register/data/repos/register_repo.dart';
import 'package:userapp/features/auth/register/presentation/controller/register_cubit.dart';
import 'package:userapp/features/auth/register/presentation/views/widgets/register_body.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../data/repos/regester_repo_implemetation.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(
          registerRepo: RegisterFirebaseImplementation(),
      ),
      child: Scaffold(
        backgroundColor: AppColors.blue,
        body: SignupBody(),
      ),
    );
  }
}