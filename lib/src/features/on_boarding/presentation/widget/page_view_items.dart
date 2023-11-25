import 'package:alnawadi/src/core/resources/style.dart';
import 'package:alnawadi/src/features/on_boarding/model/on_boarding_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PageViewWidget extends StatelessWidget {
  final OnBoardingModel model;

  const PageViewWidget({
    super.key,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Image.asset(
            model.image,
            height: 170.h,
          ),
          SizedBox(
            height: 60.w,
          ),
          Text(
            model.title.tr(),
            style: getBoldStyle(fontSize: 22.h),
          ),
          const SizedBox(
            height: 30,
          ),
          Expanded(
            child: Text(
              model.body.tr(),
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
        ],
      ),
    );
  }
}
