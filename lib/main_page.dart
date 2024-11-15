import 'package:cached_network_image/cached_network_image.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:talent/Discount_Code/presentation/discount_code.dart';
import 'package:talent/Feature/Auth/Bloc/auth_cubit.dart';
import 'package:talent/Home/presentation/home.dart';
import 'package:talent/Library/presentaion/library.dart';
import 'package:talent/Who_Us/presentation/who_us.dart';
import 'package:talent/Profile/bloc/profile_cubit.dart';
import 'package:talent/Profile/bloc/profile_state.dart';
import 'package:talent/Purchase_Orders/Presentation/purches_orders.dart';
import 'package:talent/Tests_Done/presentation/test_done.dart';

import 'Apis/Urls.dart';
import 'Feature/Auth/Bloc/auth_state.dart';
import 'Feature/Auth/Presentation/Pages/sign_in.dart';
import 'Feature/Auth/Presentation/Widget/custom_elevated_button.dart';
import 'Feature/Auth/Presentation/Widget/show_toast.dart';
import 'Home/Widgte/custom_textButton.dart';
import 'Contact_Us/presentation/contact_us.dart';

import 'Profile/presentation/profile_screen.dart';
import 'Widget/custom_clip_path.dart';
import 'constant/app_colors.dart';
import 'constant/app_images.dart';
import 'constant/app_router.dart';
import 'constant/app_style.dart';

class MainPage extends StatefulWidget {
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  AuthCubit authCubit = AuthCubit();
  ProfileCubit profileCubit = ProfileCubit();
  List screens = [Home(), Library(), ProfileScreen()];
  int _page = 0;

  final GlobalKey<ScaffoldState> key = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      key: key,
      bottomNavigationBar: CurvedNavigationBar(
        index: _page,
        color: AppColors.blue,
        backgroundColor: Colors.white,
        items: <Widget>[
          Icon(
            Icons.home,
            size: 40,
            color: Colors.white,
          ),
          Icon(
            Icons.book,
            size: 40,
            color: Colors.white,
          ),
          Icon(
            Icons.person,
            size: 40,
            color: Colors.white,
          ),
        ],
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
      ),
      drawer: Drawer(
        child: Column(
          children: [
            CustomClipPath(
              height: 2.h,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.close),
              ),
            ),
            BlocProvider(
              create: (context) => profileCubit..getProfile(),
              child: BlocBuilder<ProfileCubit, ProfileState>(
                  builder: (context, state) {
                if (state is GetProfileLoadingState) {
                  return Center(child: CircularProgressIndicator());
                }
                return Column(
                  children: [
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
                    Text(
                      "${profileCubit.profileModel?.data.username}",
                      style: AppTextStyle.text.copyWith(height: 0.3.h),
                    ),
                  ],
                );
              }),
            ),
            Divider(),
            CustomTextButton(
                text: "الملف الشخصي",
                onTap: () {
                  Navigator.pop(context);
                  setState(() {
                    _page = 2;
                  });
                }),
            CustomTextButton(text: "الكورسات المشترك بها", onTap: () {}),
            CustomTextButton(
                text: "الاختبارات التي تم القيام بها",
                onTap: () {
                  pushTo(context: context, toPage: TestDone());
                }),
            CustomTextButton(
                text: "اكواد الحسم",
                onTap: () {
                  pushTo(context: context, toPage: DiscountCode());
                }),
            CustomTextButton(text: "مكتبة الموقع", onTap: () {}),
            CustomTextButton(
                text: "طلبات الشراء",
                onTap: () {
                  pushTo(context: context, toPage: PurchaseOrders());
                }),
            CustomTextButton(
                text: "من نحن",
                onTap: () {
                  pushTo(context: context, toPage: WhoUs());
                }),
            CustomTextButton(
                text: "تواصل معنا",
                onTap: () {
                  pushTo(context: context, toPage: ContactUsScreen());
                }),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 3.h),
              child: BlocProvider(
                create: (context) => authCubit,
                child: BlocConsumer<AuthCubit, AuthState>(
                  listener: (BuildContext context, AuthState state) {
                    if (state is ErrorState) {
                      ScaffoldMessenger.of(context).showSnackBar(ShowToast(
                          text: state.message, state: ToastStates.Error));
                    }
                    if (state is LogOutSuccessState) {
                      ScaffoldMessenger.of(context).showSnackBar(ShowToast(
                          text: "تم تسجيل الخروج بنجاح",
                          state: ToastStates.Succes));
                      pushTo(context: context, toPage: SignIn());
                    }
                  },
                  builder: (context, state) {
                    return ConditionalBuilder(
                      condition: state is! LoadingState,
                      builder: (context) => CustomElevatedButton(
                          titlebutton: "تسجيل خروج",
                          onPressed: () {
                            authCubit.logOut();
                          },
                          width: 14.w,
                          height: 0.6.h),
                      fallback: (context) => Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
      body: Column(
        children: [
          Stack(
            children: [
              CustomClipPath(
                height: 2.h,
              ),
              Padding(
                  padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 3.w),
                  child: IconButton(
                      onPressed: () {
                        key.currentState?.openDrawer();
                      },
                      icon: Icon(
                        Icons.menu,
                        size: 30,
                        color: Colors.black,
                      ))),
            ],
          ),
          Expanded(child: screens[_page]),
        ],
      ),
    ));
  }
}
