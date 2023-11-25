import 'package:alnawadi/src/core/resources/app_strings.dart';
import 'package:alnawadi/src/core/widget/custom_button.dart';
import 'package:alnawadi/src/features/auth/domain/entity/login_entity.dart';
import 'package:alnawadi/src/features/auth/presentation/controller/auth_bloc.dart';
import 'package:alnawadi/src/features/auth/presentation/screens/sign_in/sign_in_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInButton extends StatelessWidget {
  const SignInButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<AuthBloc>();

    return CustomButton(
      onTap: () {
        if (signInFormKey.currentState!.validate()) {
          bloc.add(
            LoginAuthEvent(
              LoginEntity(
                email: bloc.email.text,
                password: bloc.password.text,
              ),
            ),
          );
        }
      },
      text: AppStrings.sign_in.tr(),
    );
  }
}
