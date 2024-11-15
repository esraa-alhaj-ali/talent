import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:sizer/sizer.dart';
import 'package:talent/Feature/Auth/Bloc/auth_state.dart';
import 'package:talent/Feature/Auth/Presentation/Pages/sign_in.dart';
import 'package:talent/Home/Bloc/home_cubit.dart';
import 'package:talent/Home/Bloc/home_state.dart';
import 'package:talent/Home/Widgte/custom_textButton.dart';
import 'package:talent/Courses_Add/presentation/add_courses.dart';
import 'package:talent/Contact_Us/presentation/contact_us.dart';
import 'package:talent/Models/screen/detail_courses.dart';
import 'package:talent/Offers/Presentation/offers.dart';
import 'package:talent/Proffesor/presentation/professor.dart';
import 'package:talent/Offers/widget/try_again.dart';
import 'package:talent/Profile/presentation/profile_screen.dart';
import 'package:talent/Section/Presentation/section.dart';
import 'package:talent/constant/app_colors.dart';
import 'package:talent/constant/app_images.dart';
import 'package:talent/constant/app_router.dart';
import 'package:talent/constant/app_style.dart';
import 'package:talent/main_page.dart';
import '../../Feature/Auth/Bloc/auth_cubit.dart';
import '../../Feature/Auth/Presentation/Widget/custom_elevated_button.dart';
import '../../Feature/Auth/Presentation/Widget/show_toast.dart';
import '../../Offers/Bloc/offers_cubit.dart';
import '../../Offers/models/offers.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../../Section/widget/custom_section.dart';
import '../../Widget/custom_container.dart';
import '../../Widget/custom_dots_indicator.dart';
import '../../Widget/custom_professor.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  HomeCubit homeCubit = HomeCubit();
  int currentIndex = 0;
   @override
  Widget build(BuildContext context) {
    return ListView(
       scrollDirection: Axis.vertical,
      children: [
         BlocProvider(
          create: (context) => homeCubit..getHome(),
          child: BlocBuilder<HomeCubit, HomeState>
            (builder: (context, state) {
            if (state is HomeLoading) {
              return Center(child: CircularProgressIndicator());
            }
            return homeCubit.state is! HomeError
                ? ConditionalBuilder(
                    condition: homeCubit.state is! HomeLoading,
                    builder: (context) => Column(
                      children: [
                        Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 1.h, horizontal: 3.w),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "العروض",
                                    style: AppTextStyle.title,
                                  ),
                                  CustomElevatedButton(
                                    titlebutton: 'عرض الكل',
                                    onPressed: () {
                                      pushTo(
                                          context: context,
                                          toPage: Offers());
                                    },
                                    width: 7.5.w,
                                    height: 0.5.h,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 3.h,
                            ),
                            CarouselSlider.builder(
                              options: CarouselOptions(
                                  onPageChanged: (index, reason) {
                                    setState(() {
                                      currentIndex = index;
                                    });
                                  },
                                  height: 17.5.h,
                                  enlargeCenterPage: true,
                                  // autoPlay: true,
                                  autoPlayCurve: Curves.fastOutSlowIn,
                                  viewportFraction: 0.6),
                              itemBuilder:
                                  (context, index, realIndex) {
                                return CustomContainer(
                                    offer: homeCubit
                                        .HomeListOffers[index]);
                              },
                              itemCount:homeCubit.HomeListOffers.length,
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: CustomDotsIndicator(
                                dotsCount: 5,
                                CurrentIndex: currentIndex,
                              ),
                            ),
                            SizedBox(
                              height: 3.h,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 1.h, horizontal: 3.w),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "الأقسام",
                                    style: AppTextStyle.title,
                                  ),
                                  CustomElevatedButton(
                                    titlebutton: 'عرض الكل',
                                    onPressed: () {
                                      pushTo(
                                          context: context,
                                          toPage: Sections());
                                    },
                                    width: 7.5.w,
                                    height: 0.5.h,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 3.h,
                            ),
                            CarouselSlider.builder(
                              options: CarouselOptions(
                                  onPageChanged: (index, reason) {
                                    setState(() {
                                      currentIndex = index;
                                    });
                                  },
                                  height: 18.h,
                                  enlargeCenterPage: true,
                                  // autoPlay: true,
                                  autoPlayCurve: Curves.fastOutSlowIn,
                                  viewportFraction: 0.5),
                              itemBuilder:
                                  (context, index, realIndex) {
                                return CustomSection(
                                    section: homeCubit
                                        .HomeListSection[index]);
                              },
                              itemCount:
                              homeCubit.HomeListSection.length,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 1.h, horizontal: 3.w),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment
                                        .spaceBetween,
                                    children: [
                                      Text(
                                        "مكتبتنا",
                                        style: AppTextStyle.title,
                                      ),
                                      CustomElevatedButton(
                                        titlebutton: 'عرض المكتبة',
                                        onPressed: () {},
                                        width: 7.5.w,
                                        height: 0.5.h,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 3.h,
                                  ),
                                  Image.asset(
                                    AppImages.imageLibrary,
                                    fit: BoxFit.cover,
                                  ),
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                  Text(
                                    "المكتبة هي تجميع لمصادر وخدمات المعلومات، منظمة للاستعمال ويتم رعايتها من قبل هيئة سياسية، مؤسسة أو أشخاص. بالمعنى التقليدي المكتبة هي، تعني مجموعة من الكتب.المكتبة هي تجميع لمصادر وخدمات المعلومات، منظمة للاستعمال ويتم رعايتها من قبل هيئة سياسية، مؤسسة أو أشخاص. بالمعنى التقليدي المكتبة هي، تعني مجموعة من الكتب.",
                                    style: AppTextStyle.text
                                        .copyWith(fontSize: 10.sp),
                                  ),
                                  SizedBox(
                                    height: 3.h,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment
                                        .spaceBetween,
                                    children: [
                                      Text(
                                        "الدكاترة",
                                        style: AppTextStyle.title,
                                      ),
                                      CustomElevatedButton(
                                        titlebutton: 'عرض الكل',
                                        onPressed: () {
                                          pushTo(
                                              context: context,
                                              toPage:
                                              ProfessorScreen());
                                        },
                                        width: 7.5.w,
                                        height: 0.5.h,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 3.h,
                                  ),
                                  CustomProfessor(
                                      instructor: homeCubit
                                          .HomeListProfessor[0]),
                                  SizedBox(
                                    height: 3.h,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment
                                        .spaceBetween,
                                    children: [
                                      Text(
                                        "الكورسات المضافة أخيرا",
                                        style: AppTextStyle.title,
                                      ),
                                      CustomElevatedButton(
                                        titlebutton: 'عرض الكل',
                                        onPressed: () {
                                          pushTo(
                                              context: context,
                                              toPage: CoursesAdd());
                                        },
                                        width: 7.5.w,
                                        height: 0.5.h,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 3.h,
                                  ),
                                  Container(
                                    width: double.infinity,
                                    height: 18.h,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                        BorderRadius.circular(
                                            7.w),
                                        border: Border.all(
                                            color: AppColors.blue,
                                            width: 2)),
                                    child: Row(
                                      children: [
                                        Container(
                                            width: 30.w,
                                            height: 18.h,
                                            child: Image.asset(
                                                AppImages.imageCourse,
                                                fit: BoxFit.cover)),
                                        Expanded(
                                          child: Padding(
                                            padding:
                                            EdgeInsets.symmetric(
                                                horizontal: 2.w,
                                                vertical: 1.h),
                                            child: Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment
                                                  .start,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                                  children: [
                                                    Text(
                                                      "اسم الكورس",
                                                      style:
                                                      AppTextStyle
                                                          .title,
                                                    ),
                                                    Text(
                                                      "اسم الدكتور",
                                                      style:
                                                      AppTextStyle
                                                          .text,
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                                  children: [
                                                    Text(
                                                      "12000 ل.س",
                                                      style:
                                                      AppTextStyle
                                                          .title,
                                                    ),
                                                    Text(
                                                      "12 ساعة",
                                                      style:
                                                      AppTextStyle
                                                          .text,
                                                    ),
                                                  ],
                                                ),
                                                Text(
                                                  "منهج علم الوراثة",
                                                  style: AppTextStyle
                                                      .text,
                                                ),
                                                CustomElevatedButton(
                                                  titlebutton: 'عرض',
                                                  onPressed: () {
                                                    pushTo(
                                                        context:
                                                        context,
                                                        toPage:
                                                        DetailCourses());
                                                  },
                                                  width: 10.w,
                                                  height: 0.5.h,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    fallback: (context) => const CircularProgressIndicator(),
                  )
                : TryAgain(onTap: () {});
          }),
        ),
      ],
    );
  }
}
