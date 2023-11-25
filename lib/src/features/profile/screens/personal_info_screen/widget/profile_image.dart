import 'package:alnawadi/src/core/resources/app_colors.dart';
import 'package:alnawadi/src/features/profile/screens/personal_info_screen/personal_info_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: -50.h,
      child: Stack(
        //  fit: StackFit.,
        alignment: Alignment.bottomRight,
        children: [
          CircleAvatar(
            radius: 55.r,
            backgroundImage: const NetworkImage(image),
          ),
          CircleAvatar(
            radius: 17.r,
            backgroundColor: AppColors.primary,
            child: const Icon(Icons.camera_alt_outlined),
          ),
        ],
      ),
    );
  }
}
