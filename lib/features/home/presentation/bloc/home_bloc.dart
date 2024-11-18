import 'package:bookia_app/features/home/data/model/response/banner_response/banner_response_model/banner_response_model.dart';
import 'package:bookia_app/features/home/data/model/response/best_seller_resonse/best_seller_response_model/best_seller_response_model.dart';
import 'package:bookia_app/features/home/data/repo/home_repo.dart';
import 'package:bookia_app/features/home/presentation/bloc/home_events.dart';
import 'package:bookia_app/features/home/presentation/bloc/home_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBloc extends Bloc<HomeEvents, HomeStates> {
  HomeBloc() : super(IntialHomeStates()) {
    // Registering the event handler properly
    on<GetBannerHomeEvents>(getBannerHome);
    on<GetBestSellerHomeEvents>(getBestSellerHome);
  }
  late BannerResponseModel bannerResponseModel;
  late BestSellerResponseModel bestSellerResponseModel;

  // Defining the method to handle the event
  Future<void> getBannerHome(
      GetBannerHomeEvents event, Emitter<HomeStates> emit) async {
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
      GetBestSellerHomeEvents event, Emitter<HomeStates> emit) async {
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
}
