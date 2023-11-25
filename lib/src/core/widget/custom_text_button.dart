import 'package:alnawadi/src/core/resources/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextButton extends StatelessWidget {
  final String text;

  final double fontSize;

  final Color fontColor;
  final void Function() onPressed;

  const CustomTextButton({
    super.key,
    required this.text,
    this.fontSize = 20,
    this.fontColor = AppColors.primary,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: Theme.of(context).textTheme.titleSmall!.copyWith(
              color: fontColor,
              fontSize: 14.sp,
            ),
      ),
    );
  }
}
