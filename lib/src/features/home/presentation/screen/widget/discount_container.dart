import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DiscountContainer extends StatelessWidget {
  final String title;
  final IconData? iconData;
  final Color? fontColor;
  final Color? color;

  const DiscountContainer({
    super.key,
    required this.title,
    this.iconData,
    this.fontColor,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
  margin: const EdgeInsetsDirectional.all(2),
      padding: const EdgeInsetsDirectional.all(5),
      decoration: BoxDecoration(
          color: color, borderRadius: BorderRadiusDirectional.circular(70)),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    fontSize: 11,
                    color: fontColor,
                  ),
            ),
            iconData != null
                ? Icon(
                    iconData!,
                    size: 16,
                    color: const Color(0xFFF59A24),
                  )
                : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
