import 'package:alnawadi/src/core/app_prefs/app_prefs.dart';
import 'package:alnawadi/src/core/resources/app_strings.dart';
import 'package:alnawadi/src/core/resources/routes_manager.dart';
import 'package:alnawadi/src/core/services/index.dart';
import 'package:alnawadi/src/core/show_toast.dart';
import 'package:alnawadi/src/core/validator_form.dart';
import 'package:alnawadi/src/core/widget/custom_loading.dart';
import 'package:alnawadi/src/core/widget/custom_text_formField.dart';
import 'package:alnawadi/src/features/auth/presentation/controller/auth_bloc.dart';
import 'package:alnawadi/src/features/auth/presentation/screens/sign_up/widget/form_field_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class FormFieldWidget extends StatelessWidget with Validator {
  const FormFieldWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state.loginReqState == AuthRequestState.loading) {
          OverlayLoadingProgress.start(context);
        }
        if (state.loginReqState == AuthRequestState.success) {
          OverlayLoadingProgress.stop();
          sl<AppPreferences>().setUserToken(state.token!);
        //  context.read<ProfileBloc>().add(GetUserDataEvent());

          context.goNamed(Routes.home);
        }
        if (state.loginReqState == AuthRequestState.error) {
          OverlayLoadingProgress.stop();
          if (state.message == 'Email not verified.') {
            context.pushNamed(Routes.verifyCode, queryParameters: {
              'email': context.read<AuthBloc>().email.text,
              'isEmailVerify': 'false'
            });
          }
          showToast(msg: state.message, state: ToastStates.ERROR);
        }
      },
      builder: (context, state) {
        final bloc = context.read<AuthBloc>();


        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextFormField(
              controller: bloc.email,
              title: AppStrings.user_name_or_phone.tr(),
              hintText: AppStrings.user_name_or_phone.tr(),
              validator: (value) => validateEmail(value),
            ),
            20.verticalSpace,
            CustomTextFormField(
              controller: bloc.password,
              title: AppStrings.password.tr(),
              hintText: AppStrings.password.tr(),
              obscureText: state.isVisible,
              suffixIcon: IconButton(onPressed: (){
                context.read<AuthBloc>().add(ChangePassTextEvent(state.isVisible));
              }, icon: const Icon(Icons.visibility)) ,
              validator: (value) => validatePassword(value),
            ),
          ],
        );
      },
    );
  }
}
