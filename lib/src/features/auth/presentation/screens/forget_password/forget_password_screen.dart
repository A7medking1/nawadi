import 'package:alnawadi/src/core/resources/app_assets.dart';
import 'package:alnawadi/src/core/resources/app_strings.dart';
import 'package:alnawadi/src/core/resources/routes_manager.dart';
import 'package:alnawadi/src/core/services/index.dart';
import 'package:alnawadi/src/core/show_toast.dart';
import 'package:alnawadi/src/core/widget/custom_button.dart';
import 'package:alnawadi/src/core/widget/custom_loading.dart';
import 'package:alnawadi/src/core/widget/custom_text_formField.dart';
import 'package:alnawadi/src/features/auth/presentation/controller/auth_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

final globalKey = GlobalKey<FormState>();

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<AuthBloc>(),
      child: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state.forgetPasswordReqState == AuthRequestState.loading) {
            OverlayLoadingProgress.start(context);
          }
          if (state.forgetPasswordReqState == AuthRequestState.success) {
            OverlayLoadingProgress.stop();
            context.pushNamed(Routes.resetPassOtpScreen, queryParameters: {
              'email': context.read<AuthBloc>().email.text,
            });
          }
          if (state.forgetPasswordReqState == AuthRequestState.error) {
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
                          AppSvg.forgetPassword,
                        ),
                        20.verticalSpace,
                        Text(
                          AppStrings.verification_via_email_address.tr(),
                          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            fontSize: 22
                          ),
                        ),
                        10.verticalSpace,
                        Text(
                          AppStrings.this_text_is_an_example.tr(),
                          style:
                              Theme.of(context).textTheme.titleSmall!.copyWith(
                                    color: const Color(0xFF1F283D),
                                fontSize: 12.sp
                                  ),
                        ),
                        50.verticalSpace,
                        CustomTextFormField(
                          controller: bloc.email,
                          title: AppStrings.email.tr(),
                          hintText: AppStrings.email.tr(),
                          prefixIcon: const Icon(Icons.email_outlined),
                        ),
                        80.verticalSpace,
                        CustomButton(
                          onTap: () {
                            if (globalKey.currentState!.validate()) {
                              bloc.add(
                                  ForgetPasswordAuthEvent(bloc.email.text));
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
