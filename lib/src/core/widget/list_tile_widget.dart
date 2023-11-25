import 'package:alnawadi/src/core/resources/app_colors.dart';
import 'package:alnawadi/src/core/resources/font_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomListTileWidget extends StatelessWidget {
  final String? title;
  final String? leadingIcon;
  final Widget? trailingWidget;
  final void Function()? onTap;

  const CustomListTileWidget(
      {super.key,
      this.onTap,
      this.leadingIcon,
      this.trailingWidget,
      this.title});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      contentPadding: EdgeInsets.zero,
      leading: SvgPicture.asset(
        leadingIcon!,
        height: 27.h,
      ),
      title: Text(
        title!,
        style: Theme.of(context).textTheme.titleSmall!.copyWith(
              fontWeight: FontWeight.w400,
              fontSize: FontSize.s14.sp,
            ),
      ),
      trailing: trailingWidget ??
          Icon(
            Icons.keyboard_arrow_left,
            size: 30,
            color: AppColors.black,
          ),
    );
  }
}
