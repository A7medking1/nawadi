import 'package:alnawadi/src/core/app_prefs/app_prefs.dart';
import 'package:alnawadi/src/core/country_code.dart';
import 'package:alnawadi/src/core/resources/app_strings.dart';
import 'package:alnawadi/src/core/resources/routes_manager.dart';
import 'package:alnawadi/src/core/services/index.dart';
import 'package:alnawadi/src/core/show_toast.dart';
import 'package:alnawadi/src/core/validator_form.dart';
import 'package:alnawadi/src/core/widget/custom_loading.dart';
import 'package:alnawadi/src/core/widget/custom_text_formField.dart';
import 'package:alnawadi/src/features/auth/presentation/controller/auth_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';

class FormFieldWidget extends StatelessWidget with Validator {
  const FormFieldWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state.registerReqState == AuthRequestState.loading) {
          OverlayLoadingProgress.start(context);
        }
        if (state.registerReqState == AuthRequestState.success) {
          OverlayLoadingProgress.stop();
          sl<AppPreferences>().setUserToken(state.token!);
          context.pushNamed(Routes.verifyCode, queryParameters: {
            'email': context.read<AuthBloc>().email.text,
            'isEmailVerify': ''
          });
        }
        if (state.registerReqState == AuthRequestState.error) {
          OverlayLoadingProgress.stop();
          showToast(msg: state.message, state: ToastStates.ERROR);
        }
      },
      builder: (context, state) {
        final bloc = context.read<AuthBloc>();
        return Column(
          children: [
            CustomTextFormField(
              controller: bloc.userName,
              title: AppStrings.full_name.tr(),
              hintText: AppStrings.full_name.tr(),
              validator: (value) => validateName(value),
            ),
            30.verticalSpace,
            CustomTextFormField(
              controller: bloc.phone,
              title: AppStrings.phone.tr(),
              prefixIcon: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "${countryCodeToEmoji('QA')} +974",
                  style: const TextStyle(fontSize: 20),
                ),
              ),
              validator: (value) {
                /// TODO change phone validate
                return validatePhone(value);
              },
            ),
            30.verticalSpace,
            CustomTextFormField(
              controller: bloc.email,
              title: AppStrings.email.tr(),
              hintText: AppStrings.email.tr(),
              validator: (value) => validateEmail(value),
            ),
            30.verticalSpace,
            CustomTextFormField(
              controller: bloc.password,
              title: AppStrings.password.tr(),
              hintText: AppStrings.password.tr(),
              obscureText: state.isVisible,
              suffixIcon: IconButton(
                  onPressed: () {
                    context
                        .read<AuthBloc>()
                        .add(ChangePassTextEvent(state.isVisible));
                  },
                  icon: const Icon(Icons.visibility)),
              validator: (value) => validatePassword(value),
            ),
          ],
        );
      },
    );
  }
}

