import 'package:alnawadi/src/core/resources/app_assets.dart';
import 'package:alnawadi/src/core/resources/routes_manager.dart';
import 'package:alnawadi/src/core/resources/style.dart';
import 'package:alnawadi/src/core/widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class SuccessOrderPayScreen extends StatelessWidget {
  const SuccessOrderPayScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'تمت عملية الشراء بنجـــــاح',
                style: getRegularStyle(fontSize: 25.sp),
              ),
              50.verticalSpace,
              SvgPicture.asset(AppSvg.success_pay),
              50.verticalSpace,
              CustomButton(
                onTap: () => context.goNamed(Routes.home),
                text: 'العودة الى الرئيسية ',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
