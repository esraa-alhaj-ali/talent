import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:talent/Change_Password/Bloc/Change_Password_Cubit.dart';
import 'package:talent/Change_Password/Bloc/Change_Password_State.dart';
import 'package:talent/Feature/Auth/Presentation/Pages/sign_in.dart';
import 'package:talent/Feature/Auth/Presentation/Widget/custom_elevated_button.dart';
import 'package:talent/Feature/Auth/Presentation/Widget/custom_text_field.dart';

import '../../Feature/Auth/Presentation/Widget/show_toast.dart';
import '../../Home/presentation/home.dart';
import '../../Widget/custom_clip_path.dart';
import '../../constant/app_router.dart';
import '../../constant/app_style.dart';

class ChangePassword extends StatelessWidget {
  ChangePasswordCubit changePasswordCubit = ChangePasswordCubit();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: SingleChildScrollView(
      child: Column(children: [
        Stack(
          children: [
            CustomClipPath(
              height: 2.h,
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
          child: BlocProvider(
            create: (context) => changePasswordCubit,
            child: Builder(builder: (context) {
              final _changePasswordCubit = ChangePasswordCubit.get(context);

              return Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "تغيير كلمة المرور",
                        style: AppTextStyle.title,
                      ),
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(Icons.arrow_forward))
                    ],
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  CustomTextField(
                    label: "كلمة المرور القديمة",
                    hintText: "ادخل كلمة المرور القديمة",
                    controller: _changePasswordCubit.oldPasswordController,
                    prefixIcon: Icons.lock,
                    isValidator: true,
                    isPassword: true,
                    isVisible: false,
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  CustomTextField(
                      label: "كلمة المرور الجديدة",
                      hintText: "ادخل كلمة المرور الجديدة",
                      controller: _changePasswordCubit.newPasswordController,
                      prefixIcon: Icons.lock,
                      isPassword: true,
                      isValidator: true),
                  SizedBox(
                    height: 2.h,
                  ),
                  CustomTextField(
                      label: "تأكيد كلمة المرور",
                      hintText: "ادخل كلمة المرور الجديدة",
                      controller: _changePasswordCubit.configPasswordController,
                      prefixIcon: Icons.lock,
                      isPassword: true,
                      isValidator: true),
                  SizedBox(
                    height: 36.h,
                  ),
                  BlocConsumer<ChangePasswordCubit, ChangePasswordState>(
                      listener: (context, state) {
                    if (state is ChangePasswordSuccessState) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        ShowToast(
                            text: "تم تغيير كلمة المرور بنجاح",
                            state: ToastStates.Succes),
                      );
                      pushTo(context: context, toPage: SignIn());
                    } else if (state is ChangePasswordErrorState) {
                      ScaffoldMessenger.of(context).showSnackBar(ShowToast(
                          text: state.message, state: ToastStates.Error));
                    }
                  }, builder: (context, state) {
                    return ConditionalBuilder(
                      condition: state is! ChangePasswordLoadingState,
                      builder: (context) => Center(
                        child: CustomElevatedButton(
                            titlebutton: 'حفظ',
                            onPressed: () {
                              _changePasswordCubit.ChangePassword();
                            }),
                      ),
                      fallback: (context) => Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  })
                ],
              );
            }),
          ),
        )
      ]),
    )));
  }
}
