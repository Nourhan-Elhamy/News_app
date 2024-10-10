import 'package:flutter/cupertino.dart';
import 'package:userapp/core/utils/app_images.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(
          AppImages.splash,
          height: 80,
          width: 186,
        )
      ],
    );
  }
}
