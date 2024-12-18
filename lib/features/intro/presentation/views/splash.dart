import 'package:bookia_app/core/constants/assets_icons.dart';
import 'package:bookia_app/core/functions/navigation.dart';
import 'package:bookia_app/core/services/local_storage.dart';
import 'package:bookia_app/core/utils/text_style.dart';
import 'package:bookia_app/core/widgets/bottom_nav_bar.dart';
import 'package:bookia_app/features/intro/presentation/views/welcome.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      String token =
          AppLocalStorage.getCachData(key: AppLocalStorage.token) ?? '';
      if (token.isEmpty) {
        pushReplacement(context, WelcomeView());
      } else {
        pushReplacement(context, BottomNavBar());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(AssetsIcons.logoSvg),
            Text('Order Your Book Now!', style: getTitleTextStyle(context)),
          ],
        ),
      ),
    );
  }
}
