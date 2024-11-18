import 'package:bookia_app/core/constants/assets_icons.dart';
import 'package:bookia_app/core/utils/colors.dart';
import 'package:bookia_app/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class WishlistView extends StatefulWidget {
  const WishlistView({super.key});

  @override
  State<WishlistView> createState() => _WishlistViewState();
}

class _WishlistViewState extends State<WishlistView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite Books'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.only(left: 10, right: 10),
                  decoration: BoxDecoration(
                    color: AppColors.accentColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          AssetsIcons.watch,
                          fit: BoxFit.cover,
                          width: 100,
                          height: 110,
                          errorBuilder: (context, url, error) =>
                              Center(child: const Icon(Icons.error)),
                        ),
                      ),
                      Gap(15),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('The Republic'),
                                    Text('Price'),
                                  ],
                                ),
                                Spacer(),
                                IconButton(
                                  onPressed: () {},
                                  icon: Builder(
                                    builder: (context) {
                                      return CircleAvatar(
                                        backgroundColor: AppColors.textColor,
                                        radius: 10,
                                        child: CircleAvatar(
                                          backgroundColor:
                                              AppColors.accentColor,
                                          radius: 8,
                                          child: Icon(
                                            Icons.close,
                                            size: 12,
                                            color: AppColors.textColor,
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                            Gap(15),
                            CustomButton(
                              textColor: AppColors.whiteColor,
                              text: 'Add to Cart',
                              onPressed: () {},
                              color: AppColors.primaryColor,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) => const Divider(
                endIndent: 20,
                indent: 20,
              ),
              itemCount: 2,
            ),
          ),
        ],
      ),
    );
  }
}
