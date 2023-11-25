import 'package:alnawadi/src/core/app_prefs/app_prefs.dart';
import 'package:alnawadi/src/core/resources/app_strings.dart';
import 'package:alnawadi/src/core/resources/routes_manager.dart';
import 'package:alnawadi/src/core/services/index.dart';
import 'package:alnawadi/src/core/widget/custom_button.dart';
import 'package:alnawadi/src/features/profile/controller/profile_bloc.dart';
import 'package:alnawadi/src/features/profile/screens/app_information.dart';
import 'package:alnawadi/src/features/profile/screens/sign_out_button.dart';
import 'package:alnawadi/src/features/profile/screens/user_account_list_tiles.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<ProfileBloc>(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            AppStrings.profile.tr(),
            style: Theme.of(context).textTheme.titleSmall!,
          ),
        ),
        body: const _ProfileScreen(),
      ),
    );
  }
}

class _ProfileScreen extends StatelessWidget {
  const _ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isUserSkipLogin = sl<AppPreferences>().isSkipLogin();
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: EdgeInsetsDirectional.only(
            start: 15.w, top: 15.h, end: 15.w, bottom: 120.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (!isUserSkipLogin) ...[
              const UserAccount(),
            ],
            if (isUserSkipLogin) ...[
              CustomButton(
                text: AppStrings.sign_in.tr(),
                onTap: () {
                  sl<AppPreferences>().removeUserToken();
                  context.goNamed(Routes.signIn);
                },
              ),
              20.verticalSpace,
            ],
            const ApplicationInformation(),
            10.verticalSpace,
            if (!isUserSkipLogin) ...[
              const SignOutButton(),
            ],
          ],
        ),
      ),
    );
  }
}
