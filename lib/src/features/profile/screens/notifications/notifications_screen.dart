import 'package:alnawadi/src/core/enums.dart';
import 'package:alnawadi/src/core/resources/app_assets.dart';
import 'package:alnawadi/src/core/resources/app_colors.dart';
import 'package:alnawadi/src/core/resources/app_strings.dart';
import 'package:alnawadi/src/core/resources/style.dart';
import 'package:alnawadi/src/core/services/index.dart';
import 'package:alnawadi/src/features/profile/controller/profile_bloc.dart';
import 'package:alnawadi/src/features/profile/data/models/notification.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<ProfileBloc>()..add(GetNotificationsEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppStrings.notifications.tr()),
        ),
        body: BlocBuilder<ProfileBloc, ProfileState>(
          builder: (context, state) {
            if (state.getNotificationReqState == ReqState.loading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state.notificationModel!.notifications.isEmpty) {
              return const EmptyNotifications();
            }

            return NotificationsScreenBody(
              notificationModel: state.notificationModel!,
            );
          },
        ),
      ),
    );
  }
}

class EmptyNotifications extends StatelessWidget {
  const EmptyNotifications({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            AppSvg.empty_notifications,
            height: 100.h,
          ),
          30.verticalSpace,
          Text(
            'لا يوجد اشعارات حاليا',
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(fontSize: 16.sp),
          ),
        ],
      ),
    );
  }
}

class NotificationsScreenBody extends StatelessWidget {
  final NotificationModel notificationModel;

  const NotificationsScreenBody({Key? key, required this.notificationModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: ListView.separated(
        itemCount: notificationModel.notifications.length,
        itemBuilder: (context, index) {
          return NotificationsItems(
            notification: notificationModel.notifications[index],
          );
        },
        separatorBuilder: (BuildContext context, int index) => 20.verticalSpace,
      ),
    );
  }
}

class NotificationsItems extends StatelessWidget {
  const NotificationsItems({
    super.key,
    required this.notification,
  });

  final NotificationData notification;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsetsDirectional.all(10),
      decoration: BoxDecoration(
        color: AppColors.grey.withOpacity(0.02),
        borderRadius: BorderRadiusDirectional.circular(15.r),
        border: Border.all(
          color: AppColors.grey,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SvgPicture.asset(AppSvg.notification),
                  10.horizontalSpace,
                  Text(
                    notification.data.title,
                    style: getLightStyle(),
                  )
                ],
              ),
              Text(
                DateFormat('yyyy-MM-dd    hh:mm:ss')
                    .format(DateTime.parse(notification.createdAt))
                    .toString(),
                style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w800),
              ),
            ],
          ),
          10.verticalSpace,
          Text(
            notification.data.message,
            style: getSemiBoldStyle(fontSize: 14.sp, color: AppColors.grey),
          )
        ],
      ),
    );
  }
}
