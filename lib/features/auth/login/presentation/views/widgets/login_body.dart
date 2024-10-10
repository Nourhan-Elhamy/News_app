import 'package:flutter/cupertino.dart';
import 'package:userapp/core/shared%20widjets/logo.dart';
import 'package:userapp/core/utils/app_colors.dart';
import 'package:userapp/features/auth/login/presentation/views/widgets/login_form.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: MediaQuery.sizeOf(context).height*0.12,),
        LogoWidget(),
        SizedBox(height: 43,),
        Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(80)
                )
              ),
              child: LoginForm(),
            )
        )
      ],
    );
  }
}
