import 'package:bookia_app/core/functions/dialogs.dart';
import 'package:bookia_app/core/utils/colors.dart';
import 'package:bookia_app/core/utils/text_style.dart';
import 'package:bookia_app/core/widgets/custom_button.dart';
import 'package:bookia_app/features/home/presentation/bloc/home_bloc.dart';
import 'package:bookia_app/features/home/presentation/bloc/home_events.dart';
import 'package:bookia_app/features/home/presentation/bloc/home_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class WishlistView extends StatefulWidget {
  const WishlistView({super.key});

  @override
  State<WishlistView> createState() => _WishlistViewState();
}

class _WishlistViewState extends State<WishlistView> {
  @override
  void initState() {
    super.initState();
    context.read<HomeBloc>().add(GetWishListEvents());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wishlist', style: getTitleTextStyle(context)),
      ),
      body: BlocConsumer<HomeBloc, HomeStates>(
        listener: (context, state) {
          if (state is LoadingGetWishlistStates ||
              state is DeleteFromWishlistLoadingState) {
            showLoadingDialog(context);
          } else if (state is DeleteFromWishlistSuccessState) {
            Navigator.pop(context);
            context.read<HomeBloc>().add(GetWishListEvents());
          } else if (state is SuccessGetWishlistStates ||
              state is EmptyGetWishlistStates) {
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          if (state is EmptyGetWishlistStates) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.not_interested_rounded,
                    size: 100,
                    color: AppColors.primaryColor,
                  ),
                  const Gap(20),
                  Text('Wishlist is empty', style: getBodyTextStyle(context)),
                ],
              ),
            );
          } else if (state is SuccessGetWishlistStates) {
            var wishList = context.read<HomeBloc>().getWishListModel.data?.data;

            return Padding(
              padding: const EdgeInsets.all(22),
              child: ListView.separated(
                shrinkWrap: true,
                itemCount:
                    wishList!
                        .length, // Set itemCount to 0 for empty state or update with data
                separatorBuilder: (BuildContext context, int index) {
                  return const Divider();
                },
                itemBuilder: (BuildContext context, int index) {
                  return Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          wishList[index].image ?? '',
                          width: 100,
                          fit: BoxFit.cover,
                          errorBuilder:
                              (context, url, error) =>
                                  Center(child: const Icon(Icons.error)),
                        ),
                      ),
                      const Gap(20),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    wishList[index].name ?? '',
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: getBodyTextStyle(context),
                                  ),
                                ),
                                IconButton.outlined(
                                  constraints: const BoxConstraints(
                                    maxWidth: 24,
                                    maxHeight: 24,
                                  ),
                                  onPressed: () {
                                    context.read<HomeBloc>().add(
                                      RemoveFromWishlistEvent(
                                        productId: wishList[index].id,
                                      ),
                                    );
                                  },
                                  iconSize: 16,
                                  padding: const EdgeInsets.all(2),
                                  icon: const Icon(Icons.close),
                                ),
                              ],
                            ),
                            const Gap(5),
                            Text(
                              '\$${wishList[index].price}',
                              style: getBodyTextStyle(context),
                            ),
                            const Gap(20),
                            CustomButton(text: 'Add to cart', onPressed: () {}),
                            const Gap(10),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
