import 'package:bookia_app/core/constants/assets_icons.dart';
import 'package:bookia_app/core/functions/navigation.dart';
import 'package:bookia_app/core/utils/colors.dart';
import 'package:bookia_app/core/utils/text_style.dart';
import 'package:bookia_app/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class AcceptView extends StatelessWidget {
  final String titleText;
  final String bodyText;
  final String buttonText;
  final Widget nextPage;
  const AcceptView({
    super.key,
    required this.titleText,
    required this.bodyText,
    required this.buttonText,
    required this.nextPage,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(AssetsIcons.doneSvg),
              Text(
                titleText,
                style: getHeadlineTextStyle(context),
              ),
              Gap(15),
              Text(
                bodyText,
                style: getSmallTextStyle(context, color: AppColors.greyColor),
              ),
              Gap(30),
              CustomButton(
                color: AppColors.primaryColor,
                textColor: AppColors.whiteColor,
                text: buttonText,
                onPressed: () {
                  pushReplacement(context, nextPage);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
