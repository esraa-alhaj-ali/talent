import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Apis/Network.dart';
import '../../Apis/Urls.dart';
import '../models/offers.dart';
import 'offers_state.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class OffersCubit extends Cubit<OffersState> {
  OffersCubit() : super(OffersInitial());
  static OffersCubit get(context) => BlocProvider.of(context);
  List offersList = [];
  int page = 1;
  OffersResponse? offer;
  RefreshController refreshController = RefreshController();
  Future<void> getOffers() async {
    Response response;
    try {
      if (page == 1) {
        emit(OffersLoading());
      }
      response = await Network.getData(url: "${Urls.offers}?page=$page");
      offer = OffersResponse.fromJson(response.data);
      // response.data['data'].forEach((offerJson){
      //    offer = Offer.fromJson(offerJson);
      // });
      if (page > 1) {
        offersList.addAll(offer!.data);
        if (offer!.data.isEmpty) {
          refreshController.loadNoData();
        } else {
          refreshController.loadComplete();
        }
      } else {
        offersList = offer!.data;
      }
      page = offer!.currentPage + 1;
      print(offersList.length);
      emit(OffersSuccess());
    } on DioException catch (error) {
      print(error.response?.statusCode);
      if (error.type == DioExceptionType.badResponse) {
        emit(OffersError(message: error.response?.data['message']));
      } else {
        emit(OffersError(message: " خطأ في الشبكة"));
      }
    }
  }
}
