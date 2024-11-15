import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:talent/Feature/Auth/Presentation/Widget/custom_elevated_button.dart';
import 'package:talent/Change_Password/screen/change_password.dart';
import 'package:talent/Profile/bloc/profile_cubit.dart';
import 'package:talent/Profile/bloc/profile_state.dart';
import 'package:talent/Profile/widget/profile_text_field.dart';
import 'package:talent/constant/app_router.dart';
import 'package:talent/constant/app_style.dart';
import 'package:talent/main_page.dart';
import '../../Apis/Urls.dart';
import '../../Feature/Auth/Presentation/Widget/show_toast.dart';
import '../../Widget/custom_row.dart';
import '../../constant/app_images.dart';

class ProfileScreen extends StatelessWidget {
  TextEditingController passwordController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  ProfileCubit profileCubit = ProfileCubit();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => profileCubit..getProfile(),
      child:
          BlocConsumer<ProfileCubit, ProfileState>(listener: (context, state) {
        if (state is EditProfileErrorState) {}
        if (state is EditProfileSuccessfulState) {}
      }, builder: (context, state) {
        if (state is GetProfileErrorState) {
          ScaffoldMessenger.of(context).showSnackBar(
              ShowToast(text: state.message, state: ToastStates.Error));
        }
        final _profileCubit = ProfileCubit.get(context);
        if (state is GetProfileLoadingState) {
          return Center(child: Center(child: CircularProgressIndicator()));
        } else {
          return SingleChildScrollView(
            child: Column(children: [
              CustomRow(text: "الملف الشخصي"),
              CircleAvatar(
                radius: 15.w,
                backgroundImage: CachedNetworkImageProvider(
                  "${Urls.storageBaseUrl}${profileCubit.profileModel?.data.image}",
                  // errorListener: () => Icon(Icons.error),
                ),
                child: CachedNetworkImage(
                  fit: BoxFit.cover,
                  width: 53.w,
                  height: 10.h,
                  imageUrl:
                  "${Urls.storageBaseUrl}${profileCubit.profileModel?.data.image}",
                  placeholder: (context, url) =>
                      CircularProgressIndicator(),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
              TextButton(
                onPressed: () {
                  profileCubit.enableEdit();
                },
                child: Row(
                  children: [
                    Container(
                      height: 2.h,
                      width: 4.w,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(AppImages.imageEdit))),
                    ),
                    SizedBox(
                      width: 2.w,
                    ),
                    Text(
                      "تعديل الصفحة الشخصية",
                      style: AppTextStyle.text
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              ProfileTextField(
                textEditingController: _profileCubit.nameController,
                enabled: _profileCubit.enabled,
                labelText: "اسم المستخدم",
                prefixIcon: Icons.person,
                isPassword: false,
              ),
              SizedBox(
                height: 2.h,
              ),
              ProfileTextField(
                textEditingController: _profileCubit.firstnameController,
                enabled: _profileCubit.enabled,
                labelText: "الاسم الاول",
                prefixIcon: Icons.person,
                isPassword: false,
              ),
              SizedBox(
                height: 2.h,
              ),
              ProfileTextField(
                textEditingController: _profileCubit.lastnameController,
                enabled: _profileCubit.enabled,
                labelText: "الاسم الاخير",
                prefixIcon: Icons.person,
                isPassword: false,
              ),
              SizedBox(
                height: 2.h,
              ),
              ProfileTextField(
                textEditingController: _profileCubit.emailController,
                enabled: _profileCubit.enabled,
                labelText: "البريد الالكتروني",
                prefixIcon: Icons.email,
                isPassword: false,
              ),
              SizedBox(
                height: 2.h,
              ),
              ProfileTextField(
                textEditingController: _profileCubit.mobilePhoneController,
                enabled: _profileCubit.enabled,
                labelText: "رقم الموبايل",
                prefixIcon: Icons.phone,
                isPassword: false,
              ),
              SizedBox(
                height: 2.h,
              ),
              Row(
                children: [
                  Expanded(
                    child: ProfileTextField(
                      textEditingController: passwordController,
                      enabled: false,
                      labelText: "*********",
                      prefixIcon: Icons.lock,
                      isPassword: true,
                    ),
                  ),
                  SizedBox(
                    width: 3.w,
                  ),
                  profileCubit.enabled
                      ? state is! EditProfileLoadingState
                          ? CustomElevatedButton(
                              titlebutton: "تغيير",
                              onPressed: () {
                                pushTo(
                                    context: context, toPage: ChangePassword());
                              },
                              width: 6.w,
                            )
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 5.h,
                                  width: 10.w,
                                  child: CircularProgressIndicator(),
                                )
                              ],
                            )
                      : const SizedBox()
                ],
              ),
              BlocConsumer<ProfileCubit, ProfileState>(
                  listener: (context, state) {
                if (state is EditProfileLoadingState) {
                  ScaffoldMessenger.of(context).showSnackBar(ShowToast(
                      text: "تم التعديل بنجاح", state: ToastStates.Succes));
                  pushTo(context: context, toPage: MainPage());
                } else if (state is EditProfileErrorState) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      ShowToast(text: state.message, state: ToastStates.Error));
                }
              }, builder: (context, state) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
                  child: CustomElevatedButton(
                      titlebutton: "حفظ",
                      onPressed: () {
                        _profileCubit.editProfile(
                            username: _profileCubit.nameController.text,
                            firstname: _profileCubit.firstnameController.text,
                            lastname: _profileCubit.lastnameController.text,
                            email: _profileCubit.emailController.text,
                            phone: _profileCubit.mobilePhoneController.text);
                      }),
                );
              }),
              SizedBox(
                height: 2.h,
              )
            ]),
          );
        }
      }),
    );
  }
}
