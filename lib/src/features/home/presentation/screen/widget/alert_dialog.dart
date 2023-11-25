import 'package:alnawadi/src/core/resources/app_assets.dart';
import 'package:alnawadi/src/core/resources/app_strings.dart';
import 'package:alnawadi/src/core/resources/routes_manager.dart';
import 'package:alnawadi/src/core/widget/alert_dialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

Future showAlertForSkipSignIn(BuildContext context)async{
 await showAlertDialog(
    context: context,
    onTapYes: () {
      context.pop();
      context.goNamed(Routes.signIn);
    },
    title: AppStrings.pleaseLogInFirst.tr(),
    icon: AppSvg.forgetPassword,
   buttonText: AppStrings.sign_in
  );
}