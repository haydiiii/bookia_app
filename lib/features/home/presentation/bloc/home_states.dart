class HomeStates {}
///////banner //////////////
class IntialHomeStates extends HomeStates {}

class LoadingBannerHomeStates extends HomeStates {}

class SuccessBannerHomeStates extends HomeStates {}

class ErrorBannerHomeStates extends HomeStates {
  final String error;
  ErrorBannerHomeStates(this.error);
}

////////////////bestSeller

class LoadingBestSellerHomeStates extends HomeStates {}

class SuccessBestSellerHomeStates extends HomeStates {}

class ErrorBestSellerHomeStates extends HomeStates {
  final String error;
  ErrorBestSellerHomeStates(this.error);
}
/////////////////wishlist///
class LoadingGetWishlistStates extends HomeStates {}

class SuccessGetWishlistStates extends HomeStates {}

class EmptyGetWishlistStates extends HomeStates {

}


class DeleteFromWishlistLoadingState extends HomeStates {}

class DeleteFromWishlistSuccessState extends HomeStates {}




class LoadingAddToWishlistStates extends HomeStates {}

class SuccessAddToWishlistStates extends HomeStates {}

class ErrorAddToWishlistStates extends HomeStates {
  final String error;
  ErrorAddToWishlistStates(this.error);
}
