import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:sizer/sizer.dart';

import 'package:talent/Proffesor/bloc/professor_cubit.dart';
import 'package:talent/Proffesor/bloc/professor_state.dart';
import 'package:talent/constant/app_router.dart';
import '../../Offers/widget/try_again.dart';
import '../../Widget/custom_clip_path.dart';
import '../../Widget/custom_professor.dart';
import '../../constant/app_style.dart';

class ProfessorScreen extends StatelessWidget {
  ProfessorCubit professorCubit=ProfessorCubit();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
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
                  "الدكاتر",
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
            child:BlocProvider(
              create: (context) => professorCubit..getProfessor(),
              child: BlocBuilder<ProfessorCubit, ProfessorState>(
                  builder: (context, state) {
                    //   if (state is ProfessorLoading) {
                    //   return Center(child: CircularProgressIndicator());
                    // }
                    return professorCubit.state is! ProfessorError
                        ? ConditionalBuilder(
                      condition: professorCubit.state is! ProfessorLoading,
                      builder: (context) => SmartRefresher(
                          controller: professorCubit.refreshController,
                          enablePullDown: true,
                          enablePullUp: true,
                          onRefresh: () {
                            professorCubit.page = 1;
                            professorCubit.getProfessor();
                            professorCubit.refreshController =
                                RefreshController();
                          },
                          footer: CustomFooter(
                            builder: (context, mode) {
                              if (mode == LoadStatus.noMore) {
                                return Center(
                                  child: Padding(
                                    padding: EdgeInsets.only(top: 1.h),
                                    child: Text(
                                      'لا يوجد المزيد من الدكاترة',
                                    ),
                                  ),
                                );
                              }
                              return Center(
                                  child: const CircularProgressIndicator());
                            },
                          ),
                        child: ListView.separated(
                          separatorBuilder: (context, index) => SizedBox(
                            height: 1.h,
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
                          physics: ScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: professorCubit.professorList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return CustomProfessor(instructor:professorCubit.professorList[index],);
                          },
                        ),
                      ),

                      fallback: (BuildContext context) {
                        return Center(child: CircularProgressIndicator());
                      },
                    )
                        : TryAgain(onTap: () {});
                  }),
          ),
          ),
        ],
      ),
    ));
  }
}
