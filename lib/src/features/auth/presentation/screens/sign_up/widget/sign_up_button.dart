import 'dart:io';

import 'package:alnawadi/src/core/resources/app_strings.dart';
import 'package:alnawadi/src/core/widget/custom_button.dart';
import 'package:alnawadi/src/features/auth/data/model/register_model.dart';
import 'package:alnawadi/src/features/auth/presentation/controller/auth_bloc.dart';
import 'package:alnawadi/src/features/auth/presentation/screens/sign_up/sign_up_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpButton extends StatelessWidget {
  const SignUpButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<AuthBloc>();

    return CustomButton(
      text: AppStrings.create_new_account.tr(),
      onTap: () async {
        if (signUpFormKey.currentState!.validate()) {
          /*   print('sign up ');
          context.pushNamed(Routes.verifyCode, queryParameters: {
            'isForgetPassword': 'false',
            'email':bloc.email.text,
          });*/

          if (Platform.isAndroid) {
            final fcm = await FirebaseMessaging.instance.getToken();
            print(fcm);
            bloc.add(
              RegisterAuthEvent(
                RegisterModel(
                  name: bloc.userName.text,
                  email: bloc.email.text,
                  fcm: fcm!,
                  phone: bloc.phone.text,
                  password: bloc.password.text,
                ),
              ),
            );
          }
          bloc.add(
            RegisterAuthEvent(
              RegisterModel(
                name: bloc.userName.text,
                email: bloc.email.text,
                fcm: 'ios fcm not added yet',
                phone: bloc.phone.text,
                password: bloc.password.text,
              ),
            ),
          );
        }
      },
    );
  }
}
