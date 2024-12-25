import 'package:bookia_app/features/home/data/model/response/banner_response/banner_response_model/banner_response_model.dart';
import 'package:bookia_app/features/home/data/model/response/best_seller_resonse/best_seller_response_model/best_seller_response_model.dart';
import 'package:bookia_app/features/home/data/model/response/get_cart_response_model/get_cart_model/get_cart_model.dart';
import 'package:bookia_app/features/home/data/model/response/get_wishlist_response/get_wishlist/get_wishlist.dart';
import 'package:bookia_app/features/home/data/repo/home_repo.dart';
import 'package:bookia_app/features/home/presentation/bloc/home_events.dart';
import 'package:bookia_app/features/home/presentation/bloc/home_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBloc extends Bloc<HomeEvents, HomeStates> {
  HomeBloc() : super(IntialHomeStates()) {
    // Registering the event handler properly
    on<GetBannerHomeEvents>(getBannerHome);
    on<GetBestSellerHomeEvents>(getBestSellerHome);
    on<AddToWishListEvents>(addToWishList);
    on<RemoveFromWishlistEvent>(removeWishList);
    on<AddToCartEvents>(addToCart);
    on<GetCartEvents>(getCart);

    // on<RemoveFromWishlistEvent>(removeWishList);
    on<GetWishListEvents>(getWishList);
    add(GetBannerHomeEvents());
    add(GetBestSellerHomeEvents());
    //add(GetWishListEvents());
  }
  late BannerResponseModel bannerResponseModel;
  late BestSellerResponseModel bestSellerResponseModel;
  late GetCartModel getCartModel;
  late GetWishlist getWishListModel;

  // Defining the method to handle the event
  Future<void> getBannerHome(
    GetBannerHomeEvents event,
    Emitter<HomeStates> emit,
  ) async {
    emit(LoadingBannerHomeStates());
    try {
      // Call to HomeRepo's bannerHome method
      final value = await HomeRepo.bannerHome();

      if (value != null) {
        bannerResponseModel = value;
        emit(SuccessBannerHomeStates());
      } else {
        emit(ErrorBannerHomeStates('Banner is Failed'));
      }
    } on Exception catch (e) {
      // Catching the exception and emitting the error state
      emit(ErrorBannerHomeStates(e.toString()));
    }
  }

  Future<void> getBestSellerHome(
    GetBestSellerHomeEvents event,
    Emitter<HomeStates> emit,
  ) async {
    emit(LoadingBestSellerHomeStates());
    try {
      // Call to HomeRepo's bannerHome method
      final value = await HomeRepo.bestSeller();

      if (value != null) {
        bestSellerResponseModel = value;
        emit(SuccessBestSellerHomeStates());
      } else {
        emit(ErrorBestSellerHomeStates('Products  is Failed'));
      }
    } on Exception catch (e) {
      // Catching the exception and emitting the error state
      emit(ErrorBestSellerHomeStates(e.toString()));
    }
  }

  Future<void> getWishList(
    GetWishListEvents event,
    Emitter<HomeStates> emit,
  ) async {
    emit(LoadingGetWishlistStates());

    try {
      final value = await HomeRepo.getWishList();
      if (value != null) {
        getWishListModel = value;
        emit(SuccessGetWishlistStates());
      } else {
        emit(EmptyGetWishlistStates());
      }
    } catch (e) {
      emit(EmptyGetWishlistStates());
    }
  }
  Future<void> getCart(
    GetCartEvents event,
    Emitter<HomeStates> emit,
  ) async {
    emit(LoadingGetCartStates());

    try {
      final value = await HomeRepo.getCart();
      if (value != null) {
        getCartModel = value;

        emit(SuccessGetCartStates());
      } else {
        emit(EmptyGetCartStates());
      }
    } catch (e) {
      emit(EmptyGetCartStates());
    }
  }

  Future<void> addToWishList(
    AddToWishListEvents event,
    Emitter<HomeStates> emit,
  ) async {
    emit(LoadingAddToWishlistStates());

    try {
      bool? isSuccess = await HomeRepo.addToWishList(
        productId: event.productId ?? 0,
      );

      if (isSuccess == true) {
        emit(SuccessAddToWishlistStates());
      } else {
        emit(ErrorAddToWishlistStates("Add to wishlist failed"));
      }
    } catch (e) {
      emit(ErrorAddToWishlistStates("An error occurred: ${e.toString()}"));
    }
  }

  Future<void> removeWishList(
    RemoveFromWishlistEvent event,
    Emitter<HomeStates> emit,
  ) async {
    emit(DeleteFromWishlistLoadingState());

    try {
      bool? isSuccess = await HomeRepo.removefromWishList(
        productId: event.productId ?? 0,
      );

      if (isSuccess == true) {
        emit(DeleteFromWishlistSuccessState());
      } else {
        emit(DeleteFromWishlistFieldState("Add to wishlist failed"));
      }
    } catch (e) {
      emit(DeleteFromWishlistFieldState("An error occurred: ${e.toString()}"));
    }
  }

  Future<void> addToCart(
    AddToCartEvents event,
    Emitter<HomeStates> emit,
  ) async {
    emit(AddToCartLoadingState());

    try {
      if (event.productId == null || event.productId == 0) {
        emit(AddToCartErrorState("Invalid product ID"));
        return;
      }

      bool? isSuccess = await HomeRepo.addToCart(productId: event.productId!);

      if (isSuccess == true) {
        emit(AddToCartSuccessState());
      } else {
        emit(AddToCartErrorState("Add to cart failed"));
      }
    } catch (e) {
      emit(AddToCartErrorState("An error occurred: ${e.toString()}"));
    }
  }
}
