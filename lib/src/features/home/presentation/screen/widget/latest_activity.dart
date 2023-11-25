import 'package:alnawadi/src/core/resources/app_strings.dart';
import 'package:alnawadi/src/core/resources/routes_manager.dart';
import 'package:alnawadi/src/core/widget/list_view_horizontal.dart';
import 'package:alnawadi/src/core/widget/see_more_widget.dart';
import 'package:alnawadi/src/features/activities/presentation/controller/activity_bloc.dart';
import 'package:alnawadi/src/features/home/presentation/screen/widget/activity_items.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class LatestActivities extends StatelessWidget {
  const LatestActivities({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<ActivityBloc>().state.allActivities;
    return Column(
      children: [
        SeeMoreWidget(
          title: AppStrings.the_latest_activities.tr(),
          onPressed: () => context.pushNamed(Routes.latestActivity),
        ),
        ListViewHorizontal(
          height: 230.h,
          count: bloc!.data.length,
          itemBuilder: (context, index) {
            return ActivityItem(
              activity: bloc.data[index],
            );
          },
        ),
      ],
    );
  }
}
