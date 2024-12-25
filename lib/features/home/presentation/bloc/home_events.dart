class HomeEvents {}

class GetBannerHomeEvents extends HomeEvents {}

class GetBestSellerHomeEvents extends HomeEvents {}

class GetWishListEvents extends HomeEvents {}

class GetCartEvents extends HomeEvents {}
class AddToWishListEvents extends HomeEvents {
  int? productId;

  AddToWishListEvents({required this.productId});
}

class RemoveFromWishlistEvent extends HomeEvents {
  int? productId;

  RemoveFromWishlistEvent({required this.productId});
}

class ShowCartListEvents extends HomeEvents {}

class AddToCartEvents extends HomeEvents {
  int? productId;

  AddToCartEvents({required this.productId});
}

class RemoveFromCartEvents extends HomeEvents {
  int? cartItemId;
}
