class HomeStates {}

class IntialHomeStates extends HomeStates {}

class LoadingBannerHomeStates extends HomeStates {}

class SuccessBannerHomeStates extends HomeStates {}

class ErrorBannerHomeStates extends HomeStates {
  final String error;
  ErrorBannerHomeStates(this.error);
}

class LoadingBestSellerHomeStates extends HomeStates {}

class SuccessBestSellerHomeStates extends HomeStates {}

class ErrorBestSellerHomeStates extends HomeStates {
  final String error;
  ErrorBestSellerHomeStates(this.error);
}
