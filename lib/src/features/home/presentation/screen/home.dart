import 'package:alnawadi/src/core/enums.dart';
import 'package:alnawadi/src/core/hepler.dart';
import 'package:alnawadi/src/features/activities/presentation/controller/activity_bloc.dart';
import 'package:alnawadi/src/features/cart/presentation/screen/cart_screens.dart';
import 'package:alnawadi/src/features/home/presentation/controller/home_bloc.dart';
import 'package:alnawadi/src/features/home/presentation/screen/home_shimmer_effect.dart';
import 'package:alnawadi/src/features/home/presentation/screen/widget/banner_widget.dart';
import 'package:alnawadi/src/features/home/presentation/screen/widget/clubs.dart';
import 'package:alnawadi/src/features/home/presentation/screen/widget/home_info.dart';
import 'package:alnawadi/src/features/home/presentation/screen/widget/home_search.dart';
import 'package:alnawadi/src/features/home/presentation/screen/widget/latest_activity.dart';
import 'package:alnawadi/src/features/home/presentation/screen/widget/latest_products.dart';
import 'package:alnawadi/src/features/products/presentation/controller/products_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ActivityBloc, ActivityState>(
      builder: (_, activityState) {
        return BlocBuilder<ProductBloc, ProductsState>(
          builder: (_, productState) {
            return BlocBuilder<HomeBloc, HomeState>(
              builder: (_, state) {
                if (state.bannersReqState == ReqState.loading ||
                    activityState.companyReqState ==
                        ReqState.loading ||
                    activityState.activitiesByCompanyReqState ==
                        ReqState.loading ||
                    productState.productCategoriesReqState ==
                        ReqState.loading ||
                    productState.productByCategoryReqState ==
                        ReqState.loading) {
                  return const SafeArea(
                    child: BuildShimmerHomeWidget(),
                  );
                }

                if (state.bannersReqState == ReqState.error ||
                    activityState.companyReqState ==
                        ReqState.error ||
                    activityState.activitiesByCompanyReqState ==
                        ReqState.error ||
                    productState.productCategoriesReqState == ReqState.error ||
                    productState.productByCategoryReqState == ReqState.error) {
                  return ConnectionErrorWidget(
                    onTap: () {
                      context.read<HomeBloc>().add(GetBannersEvent());
                      context
                          .read<ActivityBloc>()
                          .add(GetCompaniesEvent());
                      context.read<ActivityBloc>().add(GetAllActivityEvent());
                      context.read<ActivityBloc>().add(
                          const UpdateCatSelectedEvent(
                              id: 0, name: 'جيمع النوادي'));
                      context.read<ProductBloc>().add(GetAllProductEvent());
                      context
                          .read<ProductBloc>()
                          .add(GetProductCategoriesEvent());
                      context.read<ProductBloc>().add(
                          const UpdateCatProductSelectedEvent(
                              id: 0, name: 'جميع المنتجات'));
                    },
                  );
                }

                return const HomeScreenContent();
              },
            );
          },
        );
      },
    );
  }
}

class HomeScreenContent extends StatelessWidget {
  const HomeScreenContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FadeAnimation(
        child: SafeArea(
          bottom: false,
          child: ListView(physics: const BouncingScrollPhysics(), children: [
            Container(
               padding: EdgeInsetsDirectional.only(
                   top: 20.h, start: 10.w,end: 10.w),
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    const HomeInfoWidget(),
                    20.verticalSpace,
                    const HomeSearchWidget(),
                    10.verticalSpace,
                    const BannerWidget(),
                    20.verticalSpace,
                    const ClubWidget(),
                  //  20.verticalSpace,
                    const LatestActivities(),
                    10.verticalSpace,
                    const LatestProducts(),
                    30.verticalSpace,
                  ],
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
