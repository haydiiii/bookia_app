class HomeEvents {}

class GetBannerHomeEvents extends HomeEvents {}

class GetBestSellerHomeEvents extends HomeEvents {}



class GetWishListEvents extends HomeEvents {}


class AddToWishListEvents extends HomeEvents {
  int? productId;

  AddToWishListEvents({ required this.productId});
}
class RemoveToWishListEvents extends HomeEvents {
  String? productId;

 RemoveToWishListEvents({ required this.productId});
}

