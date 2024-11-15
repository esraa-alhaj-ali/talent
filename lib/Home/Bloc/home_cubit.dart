import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:talent/Home/Bloc/home_state.dart';
import 'package:talent/Home/models/home.dart';
import '../../Apis/Network.dart';
import '../../Apis/Urls.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  List HomeListOffers = [];
  List HomeListSection = [];
  List HomeListProfessor=[];
  int page = 1;
  HomeResponse? home;
  RefreshController refreshController = RefreshController();
  Future<void> getHome() async {
    Response response;
    try {
      if (page == 1) {
        emit(HomeLoading());
      }
      response = await Network.getData(url: "${Urls.Home}?page=$page");
      home = HomeResponse.fromJson(response.data);
      // response.data['data'].forEach((offerJson){
      //    offer = Offer.fromJson(offerJson);
      // });
      if (page > 1) {
        HomeListOffers.addAll(home!.data.offers.data);
        if (home!.data.offers.data.isEmpty) {
          refreshController.loadNoData();
        } else {
          refreshController.loadComplete();
        }
        HomeListSection.addAll(home!.data.sections.data);
        if (home!.data.sections.data.isEmpty) {
          refreshController.loadNoData();
        } else {
          refreshController.loadComplete();
        }
        HomeListProfessor.addAll(home!.data.instructors.data);
        if (home!.data.instructors.data.isEmpty) {
          refreshController.loadNoData();
        } else {
          refreshController.loadComplete();
        }
      } else {
        HomeListOffers = home!.data.offers.data;
        HomeListSection = home!.data.sections.data;
        HomeListProfessor=home!.data.instructors.data;
      }
      print(HomeListOffers.length);
      print(HomeListSection.length);
      print(HomeListProfessor.length);
      emit(HomeSuccess());
    } on DioException catch (error) {
      print(error.response?.statusCode);
      if (error.type == DioExceptionType.badResponse) {
        emit(HomeError(message: error.response?.data['message']));
      } else {
        emit(HomeError(message: " خطأ في الشبكة"));
      }
    }
  }
}
