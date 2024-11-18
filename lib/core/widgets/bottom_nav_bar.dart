import 'package:bookia_app/core/constants/assets_icons.dart';
import 'package:bookia_app/core/utils/colors.dart';
import 'package:bookia_app/features/cart/presentation/views/cart_view.dart';
import 'package:bookia_app/features/home/presentation/view/home_view.dart';
import 'package:bookia_app/features/profile/presentation/profile_views.dart';
import 'package:bookia_app/features/wishlist/presentation/wishlist_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int index = 0;
  List<Widget> pages = [HomeView(), WishlistView(), CartView(), ProfileViews()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: pages[index],
        bottomNavigationBar: BottomNavigationBar(
            showUnselectedLabels: false,
            showSelectedLabels: false,
            // selectedItemColor: AppColors.primary,
            // unselectedItemColor: AppColors.grey,
            // backgroundColor: AppColors.background,
            currentIndex: index,
            onTap: (value) => setState(() => index = value),
            items: [
              BottomNavigationBarItem(
                icon: SvgPicture.asset(AssetsIcons.homeSvg),
                activeIcon: SvgPicture.asset(
                  AssetsIcons.homeSvg,
                  colorFilter:
                      ColorFilter.mode(AppColors.primaryColor, BlendMode.srcIn),
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(AssetsIcons.wishlistSvg),
                  activeIcon: SvgPicture.asset(
                    AssetsIcons.wishlistSvg,
                    colorFilter: ColorFilter.mode(
                        AppColors.primaryColor, BlendMode.srcIn),
                  ),
                  label: 'Wishlist'),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(AssetsIcons.cartSvg),
                  activeIcon: SvgPicture.asset(
                    AssetsIcons.cartSvg,
                    colorFilter: ColorFilter.mode(
                        AppColors.primaryColor, BlendMode.srcIn),
                  ),
                  label: 'Cart'),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(AssetsIcons.profileSvg),
                  activeIcon: SvgPicture.asset(
                    AssetsIcons.profileSvg,
                    colorFilter: ColorFilter.mode(
                        AppColors.primaryColor, BlendMode.srcIn),
                  ),
                  label: 'Profile'),
            ]));
  }
}
