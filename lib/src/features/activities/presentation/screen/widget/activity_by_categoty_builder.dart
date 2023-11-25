import 'package:alnawadi/src/core/enums.dart';
import 'package:alnawadi/src/core/widget/vertical_shimmer.dart';
import 'package:alnawadi/src/features/activities/presentation/controller/activity_bloc.dart';
import 'package:alnawadi/src/features/activities/presentation/screen/widget/activity_vertical_items.dart';
import 'package:alnawadi/src/features/profile/screens/my_activity/my_activity_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ActivitiesByCategory extends StatelessWidget {
  const ActivitiesByCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ActivityBloc, ActivityState>(
      builder: (context, state) {
        if (state.activitiesByCompanyReqState == ReqState.error) {
          return Align(
            alignment: AlignmentDirectional.center,
            child: Text(
              state.message,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          );
        }
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'انشطة ${state.selectedCategory.catName}',
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    fontWeight: FontWeight.w300,
                  ),
            ),
            15.verticalSpace,
            switch (state.activitiesByCompanyReqState) {
              ReqState.loading => const BuildShimmer(),
              ReqState.empty => const EmptyActivity(),
              ReqState.error => const CircularProgressIndicator(),
              ReqState.success => ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: state.activitiesByCompany!.data.length,
                  itemBuilder: (context, index) {
                    return ActivityByCatVerticalListItems(
                      activity: state.activitiesByCompany!.data[index],
                    );
                  },
                ),
            },
          ],
        );
      },
    );
  }
}
