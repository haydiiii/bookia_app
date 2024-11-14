import 'package:bookia_app/core/constants/assets_icons.dart';
import 'package:bookia_app/core/utils/colors.dart';
import 'package:bookia_app/core/utils/text_style.dart';
import 'package:bookia_app/core/widgets/custom_button.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int currentindex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: false,
          title: SvgPicture.asset(
            AssetsIcons.logoSvg,
            width: 30,
            height: 30,
          ),
          actions: [
            GestureDetector(
                onTap: () {},
                child: SvgPicture.asset(AssetsIcons.notificationSvg)),
            Gap(10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                  onTap: () {}, child: SvgPicture.asset(AssetsIcons.searchSvg)),
            ),
          ]),
      // body: Column(
      //   children: [
      //     CarouselSlider.builder(
      //       itemCount: 6,
      //       itemBuilder:
      //           (BuildContext context, int itemIndex, int pageViewIndex) {
      //         return Stack(children: [
      //           Image.asset(
      //             AssetsIcons.banner,
      //           ),
      //           Padding(
      //             padding: const EdgeInsets.all(8.0),
      //             child: Column(
      //               crossAxisAlignment: CrossAxisAlignment.start,
      //               children: [
      //                 Text(
      //                   textAlign: TextAlign.start,
      //                   'Find your best books to read\nwhen you don\'t even know\nwhat to read !!!!!!',
      //                   style: getBodyTextStyle(context,
      //                       color: AppColors.whiteColor),
      //                 ),
      //                 Gap(5),
      //                 CustomButton(
      //                   width: 100,
      //                   height: 35,
      //                   color: AppColors.whiteColor,
      //                   textColor: AppColors.primaryColor,
      //                   text: 'Explore',
      //                   onPressed: () {},
      //                 ),
      //               ],
      //             ),
      //           ),
      //         ]);
      //       },
      //       options: CarouselOptions(
      //         height: 150,
      //         viewportFraction: 0.9,
      //         initialPage: 0,
      //         enableInfiniteScroll: true,
      //         reverse: false,
      //         autoPlay: true,
      //         autoPlayInterval: Duration(seconds: 3),
      //         autoPlayAnimationDuration: Duration(milliseconds: 800),
      //         autoPlayCurve: Curves.fastOutSlowIn,
      //         enlargeCenterPage: true,
      //         onPageChanged: (index, reason) {
      //           setState(() {
      //             currentindex = index;
      //           });
      //         },
      //         scrollDirection: Axis.horizontal,
      //       ),
      //     ),
      //     Gap(5),
      //     SmoothPageIndicator(
      //       controller: PageController(initialPage: currentindex),
      //       count: 6,
      //       effect: ExpandingDotsEffect(
      //         dotColor: AppColors.greyColor,
      //         activeDotColor: AppColors.primaryColor,
      //         dotHeight: 10,
      //         dotWidth: 12,
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}
