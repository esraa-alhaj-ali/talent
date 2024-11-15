import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:talent/Library/Bloc/Library_state.dart';
import 'package:talent/Library/models/librarys.dart';

import '../../Apis/Network.dart';
import '../../Apis/Urls.dart';

class LibraryCubit extends Cubit<LibraryState> {
  LibraryCubit() : super(LibraryInitialState());
  static LibraryCubit get(context) => BlocProvider.of(context);
  List LibraryList = [];
  int page = 1;
  LibraryResponse? library;
  RefreshController refreshController = RefreshController();
  Future<void> getLibrary() async {
    Response response;
    try {
      if (page == 1) {
        emit(LibraryLoadingState());
      }
      response =
          await Network.getData(url: "${Urls.librarySections}");
      library = LibraryResponse.fromJson(response.data);
      // response.data['data'].forEach((offerJson){
      //    offer = Offer.fromJson(offerJson);
      // });
      if (page > 1) {
        LibraryList.addAll(library!.data.data);
        if (library!.data.data.isEmpty) {
          refreshController.loadNoData();
        } else {
          refreshController.loadComplete();
        }
      } else {
        LibraryList = library!.data.data;
      }
      page = library!.data.currentPage + 1;
      print(LibraryList.length);
      emit(LibrarySuccessState());
    } on DioException catch (error) {
      print(error.response?.statusCode);
      if (error.type == DioExceptionType.badResponse) {
        emit(LibraryError(message: error.response?.data['message']));
      } else {
        emit(LibraryError(message: " خطأ في الشبكة"));
      }
    }
  }
}
