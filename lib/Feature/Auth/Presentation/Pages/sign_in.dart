import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:talent/Feature/Auth/Bloc/auth_cubit.dart';
import 'package:talent/Feature/Auth/Bloc/auth_state.dart';
import 'package:talent/Feature/Auth/Presentation/Pages/sign_up.dart';
import 'package:talent/Home/presentation/home.dart';

import 'package:talent/constant/app_colors.dart';
import 'package:talent/constant/app_router.dart';
import 'package:talent/constant/app_style.dart';
import 'package:talent/main_page.dart';
import '../../../../Widget/custom_clip_path.dart';
import '../../../../Widget/custom_elevated_button.dart';
import '../../Models/auth_model.dart';
import '../Widget/custom_text_field.dart';
import '../Widget/loading_dialog.dart';
import '../Widget/show_toast.dart';
import 'forget_password.dart';

class SignIn extends StatefulWidget {
  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey();
AuthCubit authCubit =AuthCubit();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: BlocProvider(
                create: (context) => authCubit,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      CustomClipPath(),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 3.w, vertical: 3.h),
                        child: Form(
                          key: formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "أهلا بك في تطبيق مواهب",
                                style: AppTextStyle.text,
                              ),
                              Text("تسجيل دخول", style: AppTextStyle.title),
                              SizedBox(
                                height: 2.h,
                              ),
                              CustomTextField(
                                label:
                                    "البريد الالكتروني/اسم المستخدم/رقم الموبايل",
                                hintText: 'ادخل البريد الالكتروني',
                                controller: emailController,
                                prefixIcon: Icons.message,
                                isValidator: true,
                                validatorMessage:
                                    "الرجاء ادخال البريد الالكتروني",
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              CustomTextField(
                                label: "كلمة المرور",
                                hintText: 'ادخل كلمة المرور',
                                controller: passwordController,
                                prefixIcon: Icons.lock,
                                isValidator: true,
                                validatorMessage: "الرجاء ادخال كلمة المرور",
                                isPassword: true,
                              ),
                              InkWell(
                                  onTap: () {
                                    pushTo(
                                        context: context,
                                        toPage: ForgetPassword());
                                  },
                                  child: Text(
                                    "هل نسيت كلمة المرور؟",
                                    style: AppTextStyle.hintTextStyle.copyWith(
                                        decoration: TextDecoration.underline),
                                  )),
                              SizedBox(
                                height: 15.h,
                              ),
                              BlocConsumer<AuthCubit, AuthState>(
                                listener: (context, state) {
                                  if (state is LogInSuccessState) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        ShowToast(
                                            text: "تم تسجيل الدخول بنجاح",
                                            state: ToastStates.Succes));
                                    pushTo(context: context, toPage: MainPage());
                                  } else if (state is ErrorState) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        ShowToast(
                                            text: state.message,
                                            state: ToastStates.Error));
                                  }
                                },
                                  builder: (context, state) {
                                    return ConditionalBuilder(
                                      condition: state is! LoadingState,
                                      builder: (context) => Center(
                                        child: CustomElevatedButton(
                                          titlebutton: 'تسجيل الدخول',
                                          onPressed: () {
                                            if (formKey.currentState!
                                                .validate()) {
                                              authCubit.logIn(
                                                  username: emailController.text,
                                                  password:
                                                      passwordController.text);
                                            }
                                          },
                                        ),
                                      ),
                                      fallback: (context) => Center(
                                        child: CircularProgressIndicator(),
                                      ),
                                    );
                                  },
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("ليس لديك حساب؟ ",
                                      style: AppTextStyle.text),
                                  InkWell(
                                      onTap: () {
                                        pushTo(
                                            context: context, toPage: SignUp());
                                      },
                                      child: Text(
                                        "انشاء حساب",
                                        style: AppTextStyle.text.copyWith(
                                            color: AppColors.blue,
                                            decoration:
                                                TextDecoration.underline,
                                            decorationColor: AppColors.blue),
                                      ))
                                ],
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ))));
  }
}
