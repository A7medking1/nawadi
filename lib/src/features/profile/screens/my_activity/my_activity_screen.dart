import 'package:alnawadi/src/core/enums.dart';
import 'package:alnawadi/src/core/resources/app_assets.dart';
import 'package:alnawadi/src/core/resources/app_strings.dart';
import 'package:alnawadi/src/core/services/index.dart';
import 'package:alnawadi/src/core/widget/vertical_shimmer.dart';
import 'package:alnawadi/src/features/activities/domain/entity/subscriptions_activity_entity.dart';
import 'package:alnawadi/src/features/profile/controller/subscribe_activity/subscribe_activity_bloc.dart';
import 'package:alnawadi/src/features/profile/screens/my_activity/widget/activity_items.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyActivityScreen extends StatelessWidget {
  const MyActivityScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          sl<SubscribeActivityBloc>()..add(GetSubScribedActivityEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            AppStrings.participatedActivities.tr(),
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
        body: const MyActivityBody(),
      ),
    );
  }
}

class EmptyActivity extends StatelessWidget {
  const EmptyActivity({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            AppSvg.empty_activity,
            height: 120,
          ),
          30.verticalSpace,
          Text(
            'لا يوجد انشطة مشترك فيها',
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(fontWeight: FontWeight.w300),
          ),
          30.verticalSpace,
        ],
      ),
    );
  }
}

class MyActivityBody extends StatelessWidget {
  const MyActivityBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SubscribeActivityBloc, SubscribeActivityState>(
      builder: (context, state) {
        return switch (state.subReqState) {
          ReqState.loading => const BuildShimmer(),
          ReqState.empty => const EmptyActivity(),
          ReqState.error => Text(state.message),
          ReqState.success => MyActivityBuilder(
              activity: state.subscribed!.data,
              count: state.subscribed!.data.length,
            ),
        };
      },
    );
  }
}

class MyActivityBuilder extends StatelessWidget {
  const MyActivityBuilder({
    super.key,
    required this.activity,
    required this.count,
  });

  final List<SubScripActivityDataEntity> activity;

  final int count;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: ListView.separated(
        itemCount: count,
        itemBuilder: (context, index) {
          return MyActivityItems(activity: activity[index]);
        },
        separatorBuilder: (BuildContext context, int index) => 20.verticalSpace,
      ),
    );
  }
}
