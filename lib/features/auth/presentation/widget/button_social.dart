import 'package:bookia_app/core/constants/assets_icons.dart';
import 'package:bookia_app/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ButtonOfSocial extends StatelessWidget {
  final String imagePath;
  const ButtonOfSocial({
    super.key, required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.borderColor),
        color: AppColors.whiteColor,
      ),
      child: SvgPicture.asset(
       imagePath
      ),
    );
  }
}