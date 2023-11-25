import 'package:alnawadi/src/core/resources/app_colors.dart';
import 'package:alnawadi/src/core/resources/app_strings.dart';
import 'package:alnawadi/src/core/resources/style.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SeeMoreWidget extends StatelessWidget {
  final String title;
  final Widget? page;
  final void Function()? onPressed;

  const SeeMoreWidget({
    Key? key,
    required this.title,
    this.page,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme
              .of(context)
              .textTheme
              .titleSmall!
              .copyWith(
            fontSize: 15.sp,
          ),
        ),
        InkWell(
          onTap: onPressed,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text(
                    AppStrings.show_more.tr(),
                    style: Theme
                        .of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(
                      fontSize: 12.sp,
                      color: const Color(0xFF9D9D9D)
                    ),
                ),
                const Icon(
                  Icons.arrow_forward_ios,
                  size: 13.0,
                  color: Color(0xFF9D9D9D),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
