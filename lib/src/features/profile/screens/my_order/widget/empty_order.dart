import 'package:alnawadi/src/core/resources/app_assets.dart';
import 'package:alnawadi/src/core/resources/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EmptyOrder extends StatelessWidget {
  const EmptyOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        width: MediaQuery.sizeOf(context).width,
    //    height: MediaQuery.sizeOf(context).height *0.5,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              AppSvg.empty_order,
              height: 120.h,
            ),
            20.verticalSpace,
            Text(
              'لا يوجد طلبات لديك !',
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontSize: 21.sp,
              ),
            ),
            8.verticalSpace,
            Text(
              ' قم بمشاهدة المنتجات المتاحة وقم  بالشراء كي نقوم باستعراض طلباتك',
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                color: AppColors.grey,
                fontSize: 13.sp
              ),
            ),
          ],
        ),
      ),
    );
  }
}
