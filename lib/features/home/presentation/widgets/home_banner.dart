import 'package:bookia_app/core/utils/colors.dart';
import 'package:bookia_app/core/utils/text_style.dart';
import 'package:bookia_app/features/home/presentation/bloc/home_bloc.dart';
import 'package:bookia_app/features/home/presentation/bloc/home_events.dart';
import 'package:bookia_app/features/home/presentation/bloc/home_states.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeBanner extends StatefulWidget {
  const HomeBanner({super.key});

  @override
  State<HomeBanner> createState() => _HomeBannerState();
}

class _HomeBannerState extends State<HomeBanner> {
  int currentindex = 0;

  @override
  void initState() {
    super.initState();
    context.read<HomeBloc>().add(GetBannerHomeEvents());
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<HomeBloc, HomeStates>(
          buildWhen:
              (previous, current) =>
                  current is SuccessBannerHomeStates ||
                  current is LoadingBannerHomeStates,
          builder: (context, state) {
            if (state is SuccessBannerHomeStates) {
              var bannerView = context.read<HomeBloc>().bannerResponseModel;
              return Column(
                children: [
                  CarouselSlider.builder(
                    itemCount: bannerView.data!.sliders?.length,
                    itemBuilder: (
                      BuildContext context,
                      int itemIndex,
                      int pageViewIndex,
                    ) {
                      // Check the image URL
                      return Stack(
                        children: [
                          Image.network(
                            bannerView.data!.sliders![itemIndex].image ?? '',
                            errorBuilder:
                                (context, url, error) =>
                                    Center(child: const Icon(Icons.error)),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  textAlign: TextAlign.start,
                                  'Find your best books to read\nwhen you don\'t even know\nwhat to read !!!!!!',
                                  style: getBodyTextStyle(
                                    context,
                                    color: AppColors.whiteColor,
                                  ),
                                ),
                                Gap(5),
                                // CustomButton(
                                //   width: 100,
                                //   height: 35,
                                //   color: AppColors.whiteColor,
                                //   textColor: AppColors.primaryColor,
                                //   text: 'Explore',
                                //   onPressed: () {},
                                // ),
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                    options: CarouselOptions(
                      height: 150,
                      viewportFraction: 0.9,
                      initialPage: 0,
                      enableInfiniteScroll: true,
                      reverse: false,
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 3),
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeCenterPage: true,
                      onPageChanged: (index, reason) {
                        setState(() {
                          currentindex = index;
                        });
                      },
                      scrollDirection: Axis.horizontal,
                    ),
                  ),
                  Gap(5),
                  // SmoothPageIndicator
                  Center(
                    child: SmoothPageIndicator(
                      controller: PageController(initialPage: currentindex),
                      count: bannerView.data!.sliders?.length ?? 0,
                      effect: ExpandingDotsEffect(
                        dotColor: AppColors.greyColor,
                        activeDotColor: AppColors.primaryColor,
                        dotHeight: 10,
                        dotWidth: 12,
                      ),
                    ),
                  ),
                ],
              );
            } else if (state is ErrorBannerHomeStates) {
              return SizedBox(
                height: 150,
                width: double.infinity,
                child: Center(
                  child: Text(
                    'failed to load',
                    style: getHeadlineTextStyle(context),
                  ),
                ),
              );
            } else {
              return SizedBox(
                height: 150,
                width: double.infinity,
                child: Center(
                  child: CircularProgressIndicator(
                    color: AppColors.primaryColor,
                  ),
                ),
              );
            }
          },
        ),
      ],
    );
  }
}
