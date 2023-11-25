import 'package:alnawadi/src/core/resources/app_colors.dart';
import 'package:flutter/material.dart';

class IncreaseReduceIcon extends StatelessWidget {
  const IncreaseReduceIcon({
    super.key,
    this.onTap,
    required this.icon,
  });

  final void Function()? onTap;

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: CircleAvatar(
        radius: 10,
        backgroundColor: AppColors.primary.withOpacity(0.2),
        child: Icon(
          icon,
          color: Colors.black,
          size: 16,
        ),
      ),
    );
  }
}
