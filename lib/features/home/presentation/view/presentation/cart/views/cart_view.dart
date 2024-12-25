import 'package:bookia_app/core/functions/dialogs.dart';
import 'package:bookia_app/core/functions/navigation.dart';
import 'package:bookia_app/core/utils/colors.dart';
import 'package:bookia_app/core/utils/text_style.dart';
import 'package:bookia_app/core/widgets/custom_button.dart';
import 'package:bookia_app/features/home/presentation/bloc/home_bloc.dart';
import 'package:bookia_app/features/home/presentation/bloc/home_events.dart';
import 'package:bookia_app/features/home/presentation/bloc/home_states.dart';
import 'package:bookia_app/features/home/presentation/view/presentation/cart/views/widget/check_out.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  @override
  void initState() {
    super.initState();
    context.read<HomeBloc>().add(GetCartEvents());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('My Cart', style: getTitleTextStyle(context))),
      body: BlocConsumer<HomeBloc, HomeStates>(
        listener: (context, state) {
          if (state is AddToCartLoadingState || state is RemoveFromCartLoadingState || state is LoadingGetCartStates) {
           showLoadingDialog(context);
          } else if (state is RemoveFromCartSuccessState || state is SuccessGetCartStates || state is EmptyGetCartStates) {
            pop(context);
          } else if (state is RemoveFromCartErrorState || state is AddToCartErrorState) {
            pop(context);
         //   showErrorDialog(context, state.error);
          }
        },
        builder: (context, state) {
          if (state is EmptyGetCartStates) {
            return _buildEmptyCartView(context);
          } else if (state is SuccessGetCartStates) {
            return _buildCartListView(context);
          } else {
            return const Center(child: SizedBox());
          }
        },
      ),
    );
  }

  Widget _buildEmptyCartView(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.shopping_cart_outlined,
            size: 100,
            color: AppColors.primaryColor,
          ),
          const Gap(20),
          Text('Cart is empty', style: getBodyTextStyle(context)),
        ],
      ),
    );
  }

  Widget _buildCartListView(BuildContext context) {
    var cartItems = context.read<HomeBloc>().getCartModel.data?.cartItems ?? [];

    if (cartItems.isEmpty) {
      return _buildEmptyCartView(context);
    }

    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          Expanded(
            child: ListView.separated(
              itemCount: cartItems.length,
              separatorBuilder: (_, __) => const Divider(),
              itemBuilder: (context, index) {
                final item = cartItems[index];
                return _buildCartItem(context, item);
              },
            ),
          ),
          _buildCheckoutSection(context, cartItems),
        ],
      ),
    );
  }

  Widget _buildCartItem(BuildContext context, dynamic item) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: CachedNetworkImage(
            imageUrl: item.itemProductImage ?? '',
            width: 100,
            fit: BoxFit.cover,
            errorWidget: (context, url, error) => const Icon(Icons.error),
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
                      item.itemProductName ?? '',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: getBodyTextStyle(context),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                    //  context.read<HomeBloc>().add(RemoveFromCartEvents(cartItemId: item.itemId));
                    },
                    icon: const Icon(Icons.close, size: 16),
                  ),
                ],
              ),
              const Gap(5),
              Text('\$${item.itemProductPriceAfterDiscount}', style: getBodyTextStyle(context)),
              const Gap(10),
              _buildQuantityControl(context, item),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildQuantityControl(BuildContext context, dynamic item) {
    return Row(
      children: [
        FloatingActionButton.small(
          heroTag: '${item.itemId}-remove',
          elevation: 0,
          backgroundColor: AppColors.accentColor,
          onPressed: () {
            if (item.itemQuantity > 1) {
            //  context.read<HomeBloc>().add(RemoveFromCartEvents(cartItemId: item.itemId));
            }
          },
          child: const Icon(Icons.remove),
        ),
        const Gap(10),
        Text('${item.itemQuantity}', style: getBodyTextStyle(context)),
        const Gap(10),
        FloatingActionButton.small(
          heroTag: '${item.itemId}-add',
          elevation: 0,
          backgroundColor: AppColors.accentColor,
          onPressed: () {
            if (item.itemProductStock > item.itemQuantity) {
              context.read<HomeBloc>().add(AddToCartEvents(productId: item.itemId));
            } else {
              showErrorDialog(context, 'Out of Stock');
            }
          },
          child: const Icon(Icons.add),
        ),
      ],
    );
  }

  Widget _buildCheckoutSection(BuildContext context, List<dynamic> cartItems) {
    final total = cartItems.fold<double>(
      0,
      (sum, item) => sum + item.itemProductPriceAfterDiscount,
    );
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Total', style: getBodyTextStyle(context)),
            Text('\$${total.toStringAsFixed(2)}', style: getBodyTextStyle(context)),
          ],
        ),
        const Gap(10),
        CustomButton(
          text: 'Check Out',
          onPressed: () => push(context, const CheckOutView()),
        ),
      ],
    );
  }
}
