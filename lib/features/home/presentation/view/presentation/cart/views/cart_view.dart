import 'package:bookia_app/core/constants/assets_icons.dart';
import 'package:bookia_app/core/functions/navigation.dart';
import 'package:bookia_app/core/utils/colors.dart';
import 'package:bookia_app/core/utils/text_style.dart';
import 'package:bookia_app/core/widgets/custom_button.dart';
import 'package:bookia_app/features/home/presentation/view/presentation/cart/views/widget/check_out.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('My Cart')),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.all(10),
                    //   margin: EdgeInsets.only(left: 10, right: 10),
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
                            errorBuilder:
                                (context, url, error) =>
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                              Row(
                                children: [
                                  FloatingActionButton.small(
                                    backgroundColor: AppColors.borderColor,
                                    elevation: 0,
                                    onPressed: () {},
                                    child: const Icon(
                                      Icons.remove,
                                      color: AppColors.textColor,
                                    ),
                                  ),
                                  const Gap(10),
                                  Text(' 01', style: getBodyTextStyle(context)),
                                  const Gap(10),
                                  FloatingActionButton.small(
                                    backgroundColor: AppColors.borderColor,
                                    elevation: 0,
                                    onPressed: () {},
                                    child: const Icon(
                                      Icons.add,
                                      color: AppColors.textColor,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder:
                    (context, index) =>
                        const Divider(endIndent: 20, indent: 20),
                itemCount: 2,
              ),
            ),
            Row(
              children: [
                Text('Total', style: getBodyTextStyle(context)),
                Spacer(),
                Text('price '),
              ],
            ),
            Gap(10),
            CustomButton(
              text: 'chcek Out',
              onPressed: () {
                push(context, CheckOutView());
              },
              color: AppColors.primaryColor,
              textColor: AppColors.whiteColor,
            ),
          ],
        ),
      ),
    );
  }
}
