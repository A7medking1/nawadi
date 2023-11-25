import 'dart:math';

import 'package:alnawadi/src/core/api/api_constant.dart';
import 'package:alnawadi/src/core/hepler.dart';
import 'package:alnawadi/src/core/resources/app_strings.dart';
import 'package:alnawadi/src/core/widget/cached_image_network.dart';
import 'package:alnawadi/src/core/widget/list_view_horizontal.dart';
import 'package:alnawadi/src/features/activities/domain/entity/company_entity.dart';
import 'package:alnawadi/src/features/activities/presentation/controller/activity_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ClubWidget extends StatelessWidget {
  const ClubWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<ActivityBloc>().state.company;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // SeeMoreWidget(title: AppStrings.club.tr()),
        Text(
          AppStrings.club.tr(),
          style: Theme.of(context).textTheme.titleSmall!.copyWith(
                color: const Color(0xFF353535),
                fontWeight: FontWeight.w700,
              ),
        ),
        15.verticalSpace,
        ListViewHorizontal(
          height: 108.h,
          count: bloc!.data.length,
          itemBuilder: (context, index) {
            return ClubItems(categoryEntity: bloc.data[index]);
          },
          separatorBuilder: (context, index) {
            return 20.horizontalSpace;
          },
        ),
      ],
    );
  }
}

class ClubItems extends StatelessWidget {
  const ClubItems({
    super.key,
    required this.categoryEntity,
  });

  final CompaniesData? categoryEntity;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
      /*  Container(
          width: 70.w,
          height: 70.h,
          decoration: BoxDecoration(
            color: Colors
                .primaries[Random().nextInt(Colors.primaries.length)].shade50,
            borderRadius: BorderRadiusDirectional.circular(100.r),
          ),
          child: ClipRRect(
            borderRadius: BorderRadiusDirectional.circular(100),
            child: CachedImages(
              imageUrl: ApiConstant.imagePath(categoryEntity!.image),
              fit: BoxFit.cover,
            ),
          ),
        ),*/
        CircleAvatar(
          radius: 30,
          backgroundImage: CachedNetworkImageProvider(categoryEntity!.image.toImageUrl),
        ),
        8.verticalSpace,
        Text(
          categoryEntity!.name,
          style: Theme.of(context).textTheme.titleSmall!.copyWith(
                fontSize: 13.sp,
            fontWeight: FontWeight.w400,
            color: const Color(0xFF646464)
              ),
        ),
      ],
    );
  }
}
