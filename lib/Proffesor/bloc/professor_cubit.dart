import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talent/Home/models/home.dart';
import 'package:talent/Proffesor/bloc/professor_state.dart';
import '../../Apis/Network.dart';
import '../../Apis/Urls.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../model/professor.dart';
import '../model/proffesors.dart';

class ProfessorCubit extends Cubit<ProfessorState> {
  ProfessorCubit() : super(ProfessorInitial());
  static ProfessorCubit get(context) => BlocProvider.of(context);
  List<Professor> professorList = [];
  int page = 1;
  ProfesorResponse? professor;
  RefreshController refreshController = RefreshController();
  Future<void> getProfessor() async {
    Response response;
    try{
      if (page == 1) {
        emit(ProfessorLoading());
      }
      response = await Network.getData(url: "${Urls.teachers}?page=$page");
      professor = ProfesorResponse.fromJson(response.data);
      if (page > 1) {
        professorList.addAll(professor!.data);
        if (professor!.data.isEmpty) {
          refreshController.loadNoData();
        } else {
          refreshController.loadComplete();
        }
      } else {
        professorList = professor!.data;
      }
      page = professor!.currentPage!+1;
      print(professorList.length);
      emit(ProfessorSuccess());
    }on DioException catch (error) {
      print(error.response?.statusCode);
      if (error.type == DioExceptionType.badResponse) {
        emit(ProfessorError(message: error.response?.data['message']));
      } else {
        emit(ProfessorError(message: " خطأ في الشبكة"));
      }
    }

  }
}
