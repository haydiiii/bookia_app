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
class DeleteFromWishlistFieldState extends HomeStates {
   final String error;
  DeleteFromWishlistFieldState(this.error);
}




class LoadingAddToWishlistStates extends HomeStates {}

class SuccessAddToWishlistStates extends HomeStates {}

class ErrorAddToWishlistStates extends HomeStates {
  final String error;
  ErrorAddToWishlistStates(this.error);
}
// Show Cart State
class ShowCartListState extends HomeStates {
 
}

// Add to Cart States
class AddToCartLoadingState extends HomeStates {}

class AddToCartSuccessState extends HomeStates {

}

class AddToCartErrorState extends HomeStates {
  final String error;

  AddToCartErrorState(this.error);
}
// Remove from Cart States
class RemoveFromCartLoadingState extends HomeStates {}

class RemoveFromCartSuccessState extends HomeStates {

}

class RemoveFromCartErrorState extends HomeStates {
  final String error;

  RemoveFromCartErrorState(this.error);
}
