import 'package:bookia_app/core/functions/navigation.dart';
import 'package:bookia_app/core/utils/colors.dart';
import 'package:bookia_app/core/utils/text_style.dart';
import 'package:bookia_app/core/widgets/custom_button.dart';
import 'package:bookia_app/features/home/presentation/bloc/home_bloc.dart';
import 'package:bookia_app/features/home/presentation/bloc/home_events.dart';
import 'package:bookia_app/features/home/presentation/bloc/home_states.dart';
import 'package:bookia_app/features/home/presentation/widgets/book_details_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class BestSellerProducts extends StatefulWidget {
  const BestSellerProducts({super.key});

  @override
  State<BestSellerProducts> createState() => _BestSellerProductsState();
}

@override
class _BestSellerProductsState extends State<BestSellerProducts> {
  @override
  void initState() {
    super.initState();
    context.read<HomeBloc>().add(GetBestSellerHomeEvents());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeStates>(
      buildWhen:
          (previous, current) =>
              current is SuccessBestSellerHomeStates ||
              current is LoadingBestSellerHomeStates,
      builder: (context, state) {
        if (state is SuccessBestSellerHomeStates) {
          var bestSeller = context.read<HomeBloc>().bestSellerResponseModel;
          return GridView.builder(
            padding: const EdgeInsets.all(8.0),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 0.6,
            ),
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: bestSeller.data!.products!.length,
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                  color: AppColors.borderColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            pushReplacement(
                              context,
                              BookDetails(
                                product: bestSeller.data!.products![index],
                              ),
                            );
                          },
                          child: Hero(
                            tag: bestSeller.data!.products![index].id!,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                bestSeller.data!.products![index].image!,
                                width: double.infinity,
                                fit: BoxFit.cover,
                                errorBuilder:
                                    (context, url, error) =>
                                        Center(child: const Icon(Icons.error)),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Gap(10),
                      Text(
                        bestSeller.data!.products![index].name!,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: getBodyTextStyle(context),
                      ),
                      Row(
                        children: [
                          Text(
                            bestSeller.data!.products![index].price!,
                            style: getSmallTextStyle(context),
                          ),
                          Spacer(),
                          CustomButton(
                            width: 80,
                            height: 35,
                            color: Colors.black,
                            textColor: AppColors.whiteColor,
                            text: 'Buy',
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        } else if (state is ErrorBestSellerHomeStates) {
          return Center(
            child: Text(state.error, style: getHeadlineTextStyle(context)),
          );
        } else {
          return SizedBox(
            width: double.infinity,
            height: 200,
            child: Center(
              child: CircularProgressIndicator(color: AppColors.primaryColor),
            ),
          );
        }
      },
    );
  }
}
