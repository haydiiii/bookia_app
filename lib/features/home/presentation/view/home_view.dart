import 'package:bookia_app/core/constants/assets_icons.dart';
import 'package:bookia_app/core/utils/text_style.dart';
import 'package:bookia_app/features/home/presentation/widgets/home_banner.dart';
import 'package:bookia_app/features/home/presentation/widgets/best_seller_products.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: SvgPicture.asset(AssetsIcons.logoSvg, width: 30, height: 30),
        actions: [
          GestureDetector(
            onTap: () {},
            child: SvgPicture.asset(AssetsIcons.notificationSvg),
          ),
          Gap(10),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {},
              child: SvgPicture.asset(AssetsIcons.searchSvg),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HomeBanner(),
              Gap(20),
              Text('BestSeller Books', style: getHeadlineTextStyle(context)),
              BestSellerProducts(),
            ],
          ),
        ),
      ),
    );
  }
}
