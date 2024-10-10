import 'package:flutter/cupertino.dart';
import 'package:userapp/features/auth/register/presentation/views/widgets/register_form.dart';

import '../../../../../../core/shared widjets/logo.dart';
import '../../../../../../core/utils/app_colors.dart';

class SignupBody extends StatelessWidget {
  const SignupBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: MediaQuery.sizeOf(context).height*0.12,),
        LogoWidget(),
        SizedBox(height: 20,),
        Expanded(
            child: Container(
              decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(80)
                  )
              ),
              child: SignupForm(),
            )
        )
      ],
    );
  }
}
