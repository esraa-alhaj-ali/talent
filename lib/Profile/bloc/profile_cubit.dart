import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talent/Profile/bloc/profile_state.dart';

import '../../Apis/Network.dart';
import '../../Apis/Urls.dart';
import '../models/profile.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());
  static ProfileCubit get(context) => BlocProvider.of(context);
  ProfieResponse? profileModel;
  bool enabled = false;

  TextEditingController nameController = TextEditingController();
  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobilePhoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  getProfile() async {
    emit(GetProfileLoadingState());
    try {
      await Network.getData(
        url: Urls.profileInfo,
      ).then((value) {
        profileModel = ProfieResponse.fromJson(value.data);
        nameController.text=profileModel!.data.username;
    firstnameController.text=profileModel!.data.firstName;
    lastnameController.text=profileModel!.data.lastName;
    emailController.text=profileModel!.data.email;
    mobilePhoneController.text=profileModel!.data.phoneNumber;
      });
      emit(GetProfileSuccessfulState());
    } on DioException catch (e) {
      final responseBody = e.response?.data as Map<String, dynamic>;
      emit(GetProfileErrorState(responseBody['message']));
    }
  }

  editProfile(
      {
        required String username,
      required String firstname,
      required String lastname,
      required String email,
      required String phone}) async {
    emit(EditProfileLoadingState());
    try {
      await Network.postData(url: Urls.updateProfile, data: {
        "_method":"PUT",
        "username": username,
        "first_name": firstname,
        "last_name": firstname,
        "email": email,
        "phone_number": phone,
      });
      emit(EditProfileSuccessfulState());
      getProfile();
    } on DioException catch (e) {
      final responseBody = e.response?.data as Map<String, dynamic>;
      emit(GetProfileErrorState(responseBody['message']));
    }
  }

  enableEdit() {
    enabled = !enabled;
    emit(EnableEditState());
  }
}
