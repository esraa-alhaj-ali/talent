import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:talent/Courses_Add/Bloc/Course_state.dart';
import 'package:talent/Courses_Add/Course_Models/course.dart';
import 'package:talent/Home/models/home.dart';

import '../../Apis/Network.dart';
import '../../Apis/Urls.dart';

class CourseCubit extends Cubit<CourseState>
{
  CourseCubit() : super(InitialCourseState());
  static CourseCubit get(context) => BlocProvider.of(context);
  List CourseList = [];
  int page = 1;
  HomeResponse? course;
  RefreshController refreshController = RefreshController();
  Future<void> getCourses() async {
    Response response;
    try {
      if (page == 1) {
        emit(LoadingCourseState());
      }
      response = await Network.getData(url: "${Urls.Home}?page=$page");
      course = HomeResponse.fromJson(response.data);
      // response.data['data'].forEach((offerJson){
      //    offer = Offer.fromJson(offerJson);
      // });
      if (page > 1) {
        CourseList.add(course!.data);
        if (course!.data.courses.data.isEmpty) {
          refreshController.loadNoData();
        } else {
          refreshController.loadComplete();
        }
      } else {
       CourseList = course!.data.courses.data;
      }
      // page = course!.data.courses.data.
      print(CourseList.length);
      emit(SuccessCourseState());
    } on DioException catch (error) {
      print(error.response?.statusCode);
      if (error.type == DioExceptionType.badResponse) {
        emit(ErrorCourseState(message: error.response?.data['message']));
      } else {
        emit(ErrorCourseState(message: " خطأ في الشبكة"));
      }
    }
  }
}