import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talent/Apis/Urls.dart';
import 'package:talent/Change_Password/Bloc/Change_Password_State.dart';
import 'package:talent/Change_Password/screen/change_password.dart';

import '../../Apis/Network.dart';

class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  ChangePasswordCubit() : super(ChangePasswordInitial());


   TextEditingController oldPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController configPasswordController = TextEditingController();
  static ChangePasswordCubit get(context) => BlocProvider.of(context);
  void ChangePassword() async {
    emit(ChangePasswordLoadingState());
    try {
      await Network.postData(url: Urls.changePassword, data: {
        "_method":"PUT",
        "old_password": oldPasswordController.text,
        "password":newPasswordController.text,
        "password_confirmation":configPasswordController.text
      });
    } on DioException catch (error) {
      if (error.type == DioExceptionType.badResponse) {
        emit(ChangePasswordErrorState(message: error.response?.data['message']));
      } else {
        emit(ChangePasswordErrorState(message: " خطأ في الشبكة"));
      }
    }
  }
}
