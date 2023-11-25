import 'package:alnawadi/src/core/app_prefs/app_prefs.dart';
import 'package:alnawadi/src/core/enums.dart';
import 'package:alnawadi/src/core/resources/app_assets.dart';
import 'package:alnawadi/src/core/resources/app_colors.dart';
import 'package:alnawadi/src/core/resources/app_strings.dart';
import 'package:alnawadi/src/core/resources/routes_manager.dart';
import 'package:alnawadi/src/core/services/index.dart';
import 'package:alnawadi/src/core/widget/alert_dialog.dart';
import 'package:alnawadi/src/core/widget/custom_loading.dart';
import 'package:alnawadi/src/core/widget/list_tile_widget.dart';
import 'package:alnawadi/src/features/profile/controller/profile_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class SignOutButton extends StatelessWidget {
  const SignOutButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileBloc, ProfileState>(
      listener: (context, state) {
        if (state.logOutReqState == ReqState.loading) {
          OverlayLoadingProgress.start(context);
        }
        if (state.logOutReqState == ReqState.success) {
          OverlayLoadingProgress.stop();
          sl<AppPreferences>().removeUserToken();
          sl<AppPreferences>().removeLocation();
          state.copyWith(logOutReqState: ReqState.empty);
          context.goNamed(Routes.signIn);
        }
        if (state.logOutReqState == ReqState.error) {
          OverlayLoadingProgress.stop();
          sl<AppPreferences>().removeUserToken();
          sl<AppPreferences>().removeLocation();
          context.goNamed(Routes.signIn);
        }
      },
      builder: (context, state) {
        return CustomListTileWidget(
          title: AppStrings.logOut.tr(),
          leadingIcon: AppSvg.Logout,
          onTap: () {
            //    context.read<ProfileBloc>().add(LogOutEvent());
            showAlertDialog(
              context: context,
              icon: AppSvg.logoutdialog,
              title: AppStrings.areYouSureToLogOut.tr(),
              onTapYes: () {
                context.pop();
                context.read<ProfileBloc>().add(LogOutEvent());
              },
            );
          },
        );
      },
    );
  }
}


//"هل انت متأكد أنك تريد  تسجيل خروج ؟"
