import 'package:bookia_app/core/constants/assets_icons.dart';
import 'package:bookia_app/core/functions/navigation.dart';
import 'package:bookia_app/core/utils/colors.dart';
import 'package:bookia_app/core/utils/text_style.dart';
import 'package:bookia_app/core/widgets/custom_button.dart';
import 'package:bookia_app/features/auth/presentation/views/login/login_view.dart';
import 'package:bookia_app/features/auth/presentation/views/register/register_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(AssetsIcons.welcomeBg, fit: BoxFit.fill),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Spacer(flex: 1),
                SvgPicture.asset(AssetsIcons.logoSvg),
                Text('Order Your Book Now!', style: getTitleTextStyle(context)),
                Spacer(flex: 2),
                CustomButton(
                  textColor: AppColors.whiteColor,
                  color: AppColors.primaryColor,
                  text: 'Login',
                  onPressed: () {
                    push(context, LoginView());
                  },
                  width: double.infinity,
                ),
                Gap(15),
                CustomButton(
                  color: AppColors.whiteColor,
                  textColor: AppColors.textColor,
                  text: 'Register',
                  onPressed: () {
                    push(context, RegisterView());
                  },
                  width: double.infinity,
                ),
                Spacer(flex: 1),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
