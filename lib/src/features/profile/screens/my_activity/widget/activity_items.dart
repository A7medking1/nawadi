import 'package:alnawadi/src/core/hepler.dart';
import 'package:alnawadi/src/core/resources/app_colors.dart';
import 'package:alnawadi/src/core/resources/style.dart';
import 'package:alnawadi/src/core/string_language_helper.dart';
import 'package:alnawadi/src/features/activities/domain/entity/subscriptions_activity_entity.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyActivityItems extends StatelessWidget {
  const MyActivityItems({
    super.key,
    required this.activity,
  });

  final SubScripActivityDataEntity activity;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsetsDirectional.all(10),
      decoration: BoxDecoration(
        color: AppColors.grey.withOpacity(0.05),
        borderRadius: BorderRadiusDirectional.circular(15.r),
        border: Border.all(
          color: AppColors.grey,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [

              if(activity.fileType != 'video')
              CircleAvatar(
                radius: 17.r,
                backgroundImage:   CachedNetworkImageProvider(activity.image.toImageUrl),
              ),
              10.horizontalSpace,
              Text(
                stringLang(activity.nameEn, activity.nameAr),
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ],
          ),
          10.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.location_on,
                    color: AppColors.primary,
                    size: 25,
                  ),
                  Text(
                    activity.address,
                    style:
                        getRegularStyle(color: AppColors.grey, fontSize: 14.sp),
                  ),
                ],
              ),
              Text(
                '\$${activity.price}',
                style: getSemiBoldStyle(
                  color: AppColors.primary,
                ),
              ),
            ],
          ),
          10.verticalSpace,
          Text(
            DateFormat("yyyy/MM/dd").format(DateTime.parse(activity.startDate)),
            style: getSemiBoldStyle(fontSize: 14.sp),
          )
        ],
      ),
    );
  }
}
