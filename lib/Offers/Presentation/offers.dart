import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:sizer/sizer.dart';
import 'package:talent/Home/presentation/home.dart';
import 'package:talent/Offers/Bloc/offers_cubit.dart';
import 'package:talent/Offers/Bloc/offers_state.dart';
import 'package:talent/Offers/widget/try_again.dart';
import 'package:talent/constant/app_router.dart';
import '../../Widget/custom_clip_path.dart';
import '../../Widget/custom_container.dart';
import '../../constant/app_colors.dart';
import '../../constant/app_style.dart';

import 'package:shimmer/shimmer.dart';

import '../models/offers.dart';

class Offers extends StatefulWidget {
  const Offers({super.key});

  @override
  State<Offers> createState() => _OffersState();
}

class _OffersState extends State<Offers> {
  OffersCubit offersCubit = OffersCubit();
  late List<OffersResponse> allOffers;

  @override
  void initState() {
    // offersCubit.page = 1;
    // offersCubit.refreshController = RefreshController();
    // offersCubit.getOffers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: BlocProvider(
        create: (context) => offersCubit..getOffers(),
        child: BlocBuilder<OffersCubit, OffersState>
          (builder: (context, state) {
          if (state is OffersLoading) {
            return Center(child: CircularProgressIndicator());
          }
          return offersCubit.state is! OffersError
              ? ConditionalBuilder(
                  condition:
                      offersCubit.state is! OffersLoading,
                  builder: (context) => SmartRefresher(
                    controller: offersCubit.refreshController,
                    enablePullDown: true,
                    enablePullUp: true,
                    onRefresh: () {
                      offersCubit.page = 1;
                      offersCubit.getOffers();
                      offersCubit.refreshController = RefreshController();
                    },
                    footer: CustomFooter(builder: (context, mode) {
                      if (mode == LoadStatus.noMore) {
                        return Center(
                          child: Padding(
                            padding: EdgeInsets.only(top: 1.h),
                            child: Text(
                              'لا يوجد المزيد من العروض',
                            ),
                          ),
                        );
                      }
                      return Center(child: const CircularProgressIndicator());
                    }),
                    // header: const RefresherHeader(),
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            CustomClipPath(
                              height: 2.h,
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 3.w, vertical: 1.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "العروض",
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
                            padding: EdgeInsets.symmetric(
                                horizontal: 3.w, vertical: 1.h),
                            physics: ScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 2.w,
                              mainAxisSpacing: 2.h,
                              childAspectRatio: 1,
                            ),
                            itemCount:
                                context.watch<OffersCubit>().offersList.length,
                            itemBuilder: (BuildContext context, int index) {
                              return CustomContainer(
                                offer: offersCubit.offersList[index],
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
        }),
      ),
    ));
  }
}
