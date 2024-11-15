import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:talent/Feature/Auth/Bloc/auth_cubit.dart';
import 'package:talent/Feature/Auth/Bloc/auth_state.dart';
import 'package:talent/Feature/Auth/Presentation/Pages/sign_in.dart';
import 'package:talent/Feature/Auth/Presentation/Pages/verify_code.dart';
import 'package:talent/Home/presentation/home.dart';
import 'package:talent/Feature/Auth/Presentation/Widget/custom_text_field.dart';
import 'package:talent/constant/app_router.dart';

import '../../../../Widget/custom_clip_path.dart';
import '../../../../Widget/custom_elevated_button.dart';
import '../../../../constant/app_style.dart';
import '../Widget/show_toast.dart';

class ResetPassword extends StatelessWidget {
  AuthCubit authCubit = AuthCubit();
  final GlobalKey<FormState> formKeyResetPassword = GlobalKey();
  final String? email;
  final String? verificationCode;
  ResetPassword({this.email, this.verificationCode});
  @override
  Widget build(BuildContext context) {
    final TextEditingController newPasswordController = TextEditingController();
    final TextEditingController PasswordConfigController =
        TextEditingController();
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: formKeyResetPassword,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomClipPath(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 3.h),
                child: BlocProvider(
                  create: (context) => authCubit,
                  child: BlocConsumer<AuthCubit, AuthState>(
                    listener: (context, state) {
                      if (state is  RestPasswordSuccessfulState) {
                        ScaffoldMessenger.of(context).showSnackBar(ShowToast(
                            text: "تم تغيير كلمة المرور بنجاح",
                            state: ToastStates.Succes));
                        pushTo(context: context, toPage: SignIn());
                      } else if (state is ErrorState) {
                        ScaffoldMessenger.of(context).showSnackBar(ShowToast(
                            text: state.message, state: ToastStates.Error));
                      }
                    },
                    builder: (context, state) => ConditionalBuilder(
                      condition: state is! LoadingState,
                      builder: (context) => Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("اعادة تعيين كلمة المرور",
                              style: AppTextStyle.title),
                          Text("قم بادخال كلمة مرور جديدة",
                              style:
                                  AppTextStyle.text.copyWith(fontSize: 10.spa)),
                          SizedBox(
                            height: 3.h,
                          ),
                          CustomTextField(
                            label: "كلمة المرور",
                            hintText: "ادخل كلمة مرور الجديد",
                            controller: newPasswordController,
                            prefixIcon: Icons.lock,
                            isValidator: true,
                            validatorMessage:
                                "الرجاء ادخال كلمة المرور الجديدة",
                          ),
                          SizedBox(
                            height: 3.h,
                          ),
                          CustomTextField(
                            label: "تأكيد كلمة المرور",
                            hintText: "تأكيد كلمة المرور",
                            controller: PasswordConfigController,
                            prefixIcon: Icons.lock,
                            isValidator: true,
                            validatorMessage: "الرجاء تأكيد كلمة المرور",
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          CustomElevatedButton(
                              titlebutton: "حفظ",
                              onPressed: () {
                                if (formKeyResetPassword.currentState!
                                    .validate()) {
                                  authCubit.ResetPassword(
                                      newPasswordController.text,
                                      PasswordConfigController.text,
                                      email!,
                                      verificationCode!);
                                }
                              })
                        ],
                      ),
                      fallback: (context) => Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
