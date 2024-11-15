import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talent/Contact_Us/Bloc/contact_us_state.dart';
import 'package:talent/Contact_Us/presentation/contact_us.dart';
import 'package:talent/Contact_Us/models/contact_us.dart';

import '../../Apis/Network.dart';
import '../../Apis/Urls.dart';

class ContactUsCubit extends Cubit<ContactUsState>
{
  ContactUsCubit() : super(ContactUsInitial());
  ContactUsResponse? contactUs;
  static ContactUsCubit get(context) => BlocProvider.of(context);
  void ContactUs({required String username, required String email,required String message}) async {
    emit(ContactUsLoading());
    try {
      Response response = await Network.postData(url: Urls.contactMessages, data: {
        "name": username,
        "email": email,
        "message":message,
      });
      contactUs = ContactUsResponse.fromJson(response.data);
      emit(ContactUsSuccess(message: "تم ارسال رسالتك بنجاح"));
    }
    on DioException catch (error) {
      if (error.type == DioExceptionType.badResponse) {
        emit(ContactUsError(message: error.response?.data['message']));
      } else {
        emit(ContactUsError(message: " خطأ في الشبكة"));
      }
    }
  }
}