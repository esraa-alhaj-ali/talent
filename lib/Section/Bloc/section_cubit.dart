
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:talent/Section/Bloc/section_state.dart';

import '../../Apis/Network.dart';
import '../../Apis/Urls.dart';
import '../models/section.dart';
import '../models/sections.dart';

class SectionCubit extends Cubit<SectionState>
{
  SectionCubit() : super(SectionInitial());
  static SectionCubit get(context) => BlocProvider.of(context);
  List<Section> sectionList = [];
  int page = 1;
  SectionResponse? section;
  RefreshController refreshController = RefreshController();
  Future<void> getSection() async {
    Response response;
    try{
        if (page == 1) {
          emit(SectionLoading());
        }
        response = await Network.getData(url: "${Urls.sections}?page=$page");
        section = SectionResponse.fromJson(response.data);
        if (page > 1) {
          sectionList.addAll(section!.data.data);
          if (section!.data.data.isEmpty) {
            refreshController.loadNoData();
          } else {
            refreshController.loadComplete();
          }
        } else {
          sectionList = section!.data.data;
        }
        page = section!.data.currentPage + 1;
        print(sectionList.length);
        emit(SectionSuccess());
    }on DioException catch (error) {
      print(error.response?.statusCode);
      if (error.type == DioExceptionType.badResponse) {
        emit(SectionError(message: error.response?.data['message']));
      } else {
        emit(SectionError(message: " خطأ في الشبكة"));
      }
    }

}
}