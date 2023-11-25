import 'package:alnawadi/src/core/resources/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormField extends StatelessWidget {
  final String title;
  final String? hintText;
  final TextEditingController? controller;

  final bool obscureText;
  final Widget? prefixIcon;

  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  final TextInputType? textInputType;
  final bool readOnly;
  final int? maxLines;
  final void Function(String)? onFieldSubmitted;

  final void Function()? onTap;

  const CustomTextFormField({
    super.key,
    this.obscureText = false,
    required this.title,
    this.suffixIcon,
    this.textInputType,
    this.prefixIcon,
    this.readOnly = false,
    this.validator,
    this.controller,
    this.hintText,
    this.maxLines = 1,
    this.onTap,
    this.onFieldSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        title != ''
            ? Text(
                title,
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      fontSize: 12.sp,
                    ),
              )
            : const SizedBox.shrink(),
        title != ''
            ? SizedBox(
                height: 10.h,
              )
            : const SizedBox.shrink(),
        TextFormField(
          controller: controller,
          validator: validator,
          onTapOutside: (s) => FocusManager.instance.primaryFocus?.unfocus(),
          keyboardType: textInputType,
          onFieldSubmitted: onFieldSubmitted,
          onTap: onTap,
          style: Theme.of(context).textTheme.titleSmall,
          readOnly: readOnly,
          obscureText: obscureText,
          maxLines: maxLines,
          decoration: InputDecoration(
            hintText: hintText,
            isDense: true,
            hintStyle: Theme.of(context).textTheme.titleSmall!.copyWith(
                  fontSize: 12.sp,
                  color: const Color(0xFF9B9FA2),
                ),
            errorStyle: Theme.of(context)
                .textTheme
                .titleSmall!
                .copyWith(color: Colors.red, fontSize: 11.sp),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                15,
              ),
              borderSide: const BorderSide(
                color: AppColors.primary,
              ),
            ),
            prefixIcon: prefixIcon,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                15,
              ),
              borderSide: const BorderSide(color: AppColors.primary),
            ),
            suffixIcon: suffixIcon,
          ),
        ),
      ],
    );
  }
}
