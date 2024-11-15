import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talent/Apis/Urls.dart';
import 'package:talent/Feature/Auth/Bloc/auth_state.dart';
import '../../../Apis/Network.dart';
import '../../../Helper/SharedPreferencesProvider.dart';
import '../Models/auth_model.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  static AuthCubit get(context) => BlocProvider.of(context);
  UserModel? userModel;
  void logIn({required String username, required String password}) async {
    emit(LoadingState());
    try {
      Response response = await Network.postData(url: Urls.login, data: {
        "username": username,
        "password": password,
      });
      userModel = UserModel.fromJson(response.data);
      print(userModel?.data?.user?.token);
      AppSharedPreferences.saveToken("${userModel?.data?.user?.token}");
      emit(LogInSuccessState(message: "تم تسجيل الدخول  بنجاح"));
    }
    on DioException catch (error) {
      if (error.type == DioExceptionType.badResponse) {
        emit(ErrorState(message: error.response?.data['message']));
      } else {
        emit(ErrorState(message: " خطأ في الشبكة"));
      }
    }
  }


  void signup(
      {required username,
      required firstname,
      required lastname,
      required email,
      required password,
      required phone,
      required configPassword}) async {
    emit(LoadingState());
    try {
      Response response = await Network.postData(url: Urls.signUp, data: {
        "username": username,
        "first_name": firstname,
        "last_name": firstname,
        "email": email,
        "password": password,
        "phone_number": phone,
      });

      userModel = UserModel.fromJson(response.data);
      print(userModel?.data?.user?.token);
      AppSharedPreferences.saveToken("${userModel?.data?.user?.token}");
      emit(SignUpSuccessState(message: "تم انشاء الحساب  بنجاح"));
    } on DioException catch (error) {
      if (error.type == DioExceptionType.badResponse) {
        emit(ErrorState(message: error.response?.data['message']));
      } else {
        emit(ErrorState(message: " خطأ في الشبكة"));
      }
    }
  }



  void SendVerificationCode({required email}) async {
    emit(SendCodeLoadingState());
    try {
      Response response = await Network.postData(url: Urls.sendVerificationCode, data: {
        "email": email,
      });
      final message = response.data['message'] ?? '//TODO';
      emit(SendCodeSuccessfulState(message: "تم ارسال الكود بنجاح"));
    }
    on DioException catch (error) {
      if (error.type == DioExceptionType.badResponse) {
        emit(ErrorState(message: error.response?.data['message']));
      } else {
        emit(ErrorState(message: " خطأ في الشبكة"));
      }
    }
  }
  void VerifyCode(String email,String code) async {
    emit(VerifyCodeLoadingState());
    try {
      final response = await Network.postData(
        url: Urls.checkVerificationCode,
        data: {
          'email': email,
          'verification_code': code,
        },
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        final responseBody = response.data as Map<String, dynamic>;
        if (responseBody['data']['is_valid']) {
          emit(VerifyCodeSuccessfulState());
        } else {
          emit(VerifyCodeErrorState('هذا الكود خاطئ'));
        }
      } else {
        final responseBody = jsonDecode(response.data) as Map<String, dynamic>;
        emit(VerifyCodeErrorState(responseBody['message']));
      }
    } on DioException catch (e) {
      final responseBody = e.response?.data as Map<String, dynamic>;
      emit(VerifyCodeErrorState(responseBody['message']));
    }
  }
  ResetPassword(
      String password,
      String passwordConfirmation,
      String email,
      String code,
      ) async {
    emit(LoadingState());
    try {
      final response = await Network.postData(
        url: Urls.restPassword,
        data: {
          'password': password,
          'password_confirmation': passwordConfirmation,
          'verification_code': code,
          'email': email,
        },
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        emit(RestPasswordSuccessfulState());
      } else {
        final responseBody = jsonDecode(response.data) as Map<String, dynamic>;
        emit(RestPasswordErrorState(responseBody['message']));
      }
    } on DioException catch (e) {
      final responseBody = e.response?.data as Map<String, dynamic>;
      emit(RestPasswordErrorState(responseBody['message']));
    }
  }

  void logOut() async {
    emit(LoadingState());
    try {
      await Network.postData(
        url: Urls.logout,
      );
      AppSharedPreferences.removeToken;
      emit(LogOutSuccessState(message: "تم تسجيل الخروج  بنجاح"));
    } on DioException catch (error) {
      if (error.type == DioExceptionType.badResponse) {
        emit(ErrorState(message: error.response?.data['message']));
      } else {
        emit(ErrorState(message: " خطأ في الشبكة"));
      }
    }
  }

}

