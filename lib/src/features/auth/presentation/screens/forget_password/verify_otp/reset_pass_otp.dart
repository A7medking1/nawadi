import 'package:alnawadi/src/core/app_prefs/app_prefs.dart';
import 'package:alnawadi/src/core/resources/app_colors.dart';
import 'package:alnawadi/src/core/resources/app_strings.dart';
import 'package:alnawadi/src/core/resources/routes_manager.dart';
import 'package:alnawadi/src/core/services/index.dart';
import 'package:alnawadi/src/core/show_toast.dart';
import 'package:alnawadi/src/core/widget/custom_button.dart';
import 'package:alnawadi/src/core/widget/custom_loading.dart';
import 'package:alnawadi/src/core/widget/custom_otp_code.dart';
import 'package:alnawadi/src/features/auth/domain/use_cases/verify_code_useCase.dart';
import 'package:alnawadi/src/features/auth/presentation/controller/auth_bloc.dart';
import 'package:alnawadi/src/features/auth/presentation/screens/forget_password/verify_otp/otp_info_widget.dart';
import 'package:alnawadi/src/features/auth/presentation/screens/sign_up/widget/form_field_widget.dart';
import 'package:alnawadi/src/features/auth/presentation/screens/verify_otp/code_resend_counter.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ResetPassOtpScreen extends StatelessWidget {
  final String email;

  const ResetPassOtpScreen({
    Key? key,
    required this.email,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<AuthBloc>(),
      child: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state.verifyCodeReqState == AuthRequestState.loading) {
            OverlayLoadingProgress.start(context);
          }
          if (state.verifyCodeReqState == AuthRequestState.success) {
            OverlayLoadingProgress.stop();
            sl<AppPreferences>().setUserToken(state.token!);
            print('state.token ${state.token}');
            context.pushNamed(Routes.resetPassword);
          }
          if (state.verifyCodeReqState == AuthRequestState.error) {
            OverlayLoadingProgress.stop();
            showToast(msg: state.message.tr(), state: ToastStates.ERROR);
          }
        },
        builder: (context, state) {
          final bloc = context.read<AuthBloc>();
          return Scaffold(
            appBar: AppBar(),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: SizedBox(
                  width: double.infinity,
                  child: Column(
                    children: [
                      const OtpInfoWidget(),
                      30.verticalSpace,
                      emailWidget(email: email),
                      50.verticalSpace,
                      CustomOtpCode(
                        controller: bloc.otp,
                      ),
                      20.verticalSpace,
                      const CodeResendCounter(),
                      50.verticalSpace,
                      CustomButton(
                        onTap: () {
                          if (bloc.otp.text.length == 6) {
                            bloc.add(
                              VerifyCodeAuthEvent(
                                VerifyCodeParameters(
                                  email: email,
                                  otp: bloc.otp.text,
                                ),
                              ),
                            );
                          }
                          //context.pushNamed(Routes.resetPassword);

                        },
                        text: AppStrings.continue_verify.tr(),
                      ),
                      20.verticalSpace,
                      CustomButton(
                        onTap: () {
                          bloc.add(ResendCodeAuthEvent(email));
                        },
                        color: AppColors.white,
                        fontColor: AppColors.primary,
                        text: AppStrings.please_resend_the_code.tr(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class emailWidget extends StatelessWidget {
  const emailWidget({
    super.key,
    required this.email,
  });

  final String email;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250.w,
      height: 60.h,
      decoration: BoxDecoration(
          color: AppColors.primary.withOpacity(0.3),
          borderRadius: BorderRadius.circular(
            30.r,
          ),
          border: Border.all(
            color: AppColors.primary,
          )),
      child: Align(
        alignment: AlignmentDirectional.center,
        child: Text(
          email,
          style: Theme.of(context).textTheme.titleSmall,
        ),
      ),
    );
  }
}
