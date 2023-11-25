import 'package:alnawadi/src/core/resources/app_assets.dart';
import 'package:alnawadi/src/core/resources/app_colors.dart';
import 'package:alnawadi/src/core/resources/app_strings.dart';
import 'package:alnawadi/src/core/resources/routes_manager.dart';
import 'package:alnawadi/src/core/services/index.dart';
import 'package:alnawadi/src/core/show_toast.dart';
import 'package:alnawadi/src/core/validator_form.dart';
import 'package:alnawadi/src/core/widget/custom_button.dart';
import 'package:alnawadi/src/core/widget/custom_loading.dart';
import 'package:alnawadi/src/core/widget/custom_text_formField.dart';
import 'package:alnawadi/src/features/auth/domain/use_cases/reset_password_useCase.dart';
import 'package:alnawadi/src/features/auth/presentation/controller/auth_bloc.dart';
import 'package:alnawadi/src/features/auth/presentation/screens/sign_up/widget/form_field_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

final globalKey = GlobalKey<FormState>();

class ResetPasswordScreen extends StatelessWidget with Validator {
  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<AuthBloc>(),
      child: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state.resetPasswordReqState == AuthRequestState.loading) {
            OverlayLoadingProgress.start(context);
          }
          if (state.resetPasswordReqState == AuthRequestState.success) {
            OverlayLoadingProgress.stop();
            context.goNamed(Routes.signIn);
          }
          if (state.resetPasswordReqState == AuthRequestState.error) {
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
                  child: Form(
                    key: globalKey,
                    child: Column(
                      children: [
                        SvgPicture.asset(
                          AppSvg.resetPassword,
                        ),
                        10.verticalSpace,
                        Text(
                          AppStrings.set_a_new_password.tr(),
                          style:
                              Theme.of(context).textTheme.titleMedium!.copyWith(
                                    fontSize: 20.sp,
                                  ),
                        ),
                        10.verticalSpace,
                        Text(
                          AppStrings.this_text_is_an_example.tr(),
                          style:
                              Theme.of(context).textTheme.titleSmall!.copyWith(
                                    color: AppColors.grey,
                                fontSize: 13.sp
                                  ),
                        ),
                        20.verticalSpace,
                        CustomTextFormField(
                          controller: bloc.password,
                          title: AppStrings.password.tr(),
                          prefixIcon: const Icon(Icons.email_outlined),
                          validator: (value) => validatePassword(value),
                        ),
                        20.verticalSpace,
                        CustomTextFormField(
                          controller: bloc.confirmPassword,
                          title: AppStrings.password_confirm.tr(),
                          prefixIcon: const Icon(Icons.email_outlined),
                          validator: (value) => validateConfirmPassword(
                            value,
                            bloc.password.text,
                          ),
                        ),
                        60.verticalSpace,
                        CustomButton(
                          onTap: () {
                            if (globalKey.currentState!.validate()) {
                              bloc.add(
                                ResetPasswordAuthEvent(
                                  ResetPasswordParameters(
                                    password: bloc.password.text,
                                    confirmPassword: bloc.confirmPassword.text,
                                  ),
                                ),
                              );
                            }
                          },
                          text: AppStrings.continue_verify.tr(),
                        ),
                      ],
                    ),
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
