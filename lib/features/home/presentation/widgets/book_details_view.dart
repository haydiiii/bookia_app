import 'package:bookia_app/core/constants/assets_icons.dart';
import 'package:bookia_app/core/functions/navigation.dart';
import 'package:bookia_app/core/utils/colors.dart';
import 'package:bookia_app/core/utils/text_style.dart';
import 'package:bookia_app/core/widgets/bottom_nav_bar.dart';
import 'package:bookia_app/core/widgets/custom_button.dart';
import 'package:bookia_app/features/home/data/model/response/best_seller_resonse/best_seller_response_model/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class BookDetails extends StatelessWidget {
  const BookDetails({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            pushReplacement(context, const BottomNavBar());
          },
          icon: Icon(Icons.arrow_back_ios, color: AppColors.textColor),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(AssetsIcons.wishlistSvg),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Hero(
                tag: product.id!,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(
                    product.image!,
                    height: 300,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder:
                        (context, url, error) =>
                            Center(child: const Icon(Icons.error, size: 80)),
                  ),
                ),
              ),
            ),
            Gap(20),
            Text(
              product.name!,
              style: getHeadlineTextStyle(
                context,
              ).copyWith(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            Gap(10),
            Align(
              alignment: Alignment.center,
              child: Text(
                "Category: ${product.category ?? 'Unknown'}",

                style: getSmallTextStyle(
                  context,
                ).copyWith(fontSize: 16, color: AppColors.greyColor),
              ),
            ),
            Gap(10),
            Expanded(
              child: SingleChildScrollView(
                child: Text(
                  product.description!,
                  style: getBodyTextStyle(
                    context,
                  ).copyWith(height: 1.6, fontSize: 16),
                  textAlign: TextAlign.justify,
                ),
              ),
            ),
            Gap(20),
            Row(
              children: [
                Text(
                  "Price: ${product.price!}",
                  style: getSmallTextStyle(context).copyWith(
                    fontSize: 20,
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Spacer(),
                CustomButton(
                  width: 160,
                  height: 50,
                  color: AppColors.primaryColor,
                  textColor: AppColors.whiteColor,
                  text: 'Add to Cart',
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
