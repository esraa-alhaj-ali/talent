import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:sizer/sizer.dart';
import 'package:talent/Section/Bloc/section_cubit.dart';
import 'package:talent/Section/Bloc/section_state.dart';
import 'package:talent/Section/models/sections.dart';
import 'package:talent/Section/widget/custom_section.dart';

import '../../Offers/widget/try_again.dart';
import '../../Widget/custom_clip_path.dart';
import '../../constant/app_colors.dart';
import '../../constant/app_images.dart';
import '../../constant/app_style.dart';
import '../models/section.dart';
class Sections extends StatelessWidget {
  SectionCubit sectionCubit = SectionCubit();
  late List<SectionResponse> allSection;
Section? section;
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: BlocProvider(
        create: (context) => sectionCubit..getSection(),
        child: BlocBuilder<SectionCubit,SectionState>(
          builder: (context,state) {
            if (state is SectionLoading) {
              return Center(child: CircularProgressIndicator());
            }
            return sectionCubit.state is! SectionError
                ? ConditionalBuilder(
              condition:
              sectionCubit.state is! SectionLoading,
              builder: (context) => SmartRefresher(
                controller: sectionCubit.refreshController,
                enablePullDown: true,
                enablePullUp: true,
                onRefresh: () {
                  sectionCubit.page = 1;
                  sectionCubit.getSection();
                  sectionCubit.refreshController = RefreshController();
                },
                footer: CustomFooter(builder: (context, mode) {
                  if (mode == LoadStatus.noMore) {
                    return Center(
                      child: Padding(
                        padding: EdgeInsets.only(top: 1.h),
                        child: Text(
                          'لا يوجد المزيد من الاقسام',
                        ),
                      ),
                    );
                  }
                  return Center(child: const CircularProgressIndicator());
                }),
                // header: const RefresherHeader(),
                child:Column(
                  children: [
                    Stack(
                      children: [
                        CustomClipPath(
                          height: 2.h,
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "الأقسام",
                            style: AppTextStyle.title,
                          ),
                          IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: Icon(
                                Icons.arrow_forward_ios_outlined,
                                size: 7.w,
                              ))
                        ],
                      ),
                    ),
                    Expanded(
                      child: GridView.builder(
                        padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
                        physics: ScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 2.w,
                          mainAxisSpacing: 2.h,
                          childAspectRatio: 1,
                        ),
                          itemCount:sectionCubit.sectionList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return CustomSection(section:sectionCubit.sectionList[index],
                            );
                          },
                      ),
                    )
                  ],
                ),
              ),
              fallback: (context) => const CircularProgressIndicator(),
            )
                : TryAgain(onTap: () {});
          }
        ),
      ),
    ));
  }
}
