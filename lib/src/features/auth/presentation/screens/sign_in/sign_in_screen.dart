import 'package:alnawadi/src/core/services/index.dart';
import 'package:alnawadi/src/features/auth/presentation/controller/auth_bloc.dart';
import 'package:alnawadi/src/features/auth/presentation/screens/sign_in/widget/create_account.dart';
import 'package:alnawadi/src/features/auth/presentation/screens/sign_in/widget/forget_password.dart';
import 'package:alnawadi/src/features/auth/presentation/screens/sign_in/widget/form_field.dart';
import 'package:alnawadi/src/features/auth/presentation/screens/sign_in/widget/sign_in_button.dart';
import 'package:alnawadi/src/features/auth/presentation/screens/sign_in/widget/sign_in_info.dart';
import 'package:alnawadi/src/features/auth/presentation/screens/sign_in/widget/skip_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final signInFormKey = GlobalKey<FormState>();

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<AuthBloc>(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsetsDirectional.all(20),
              child: SizedBox(
                width: double.infinity,
                child: Form(
                  key: signInFormKey,
                  child: Column(
                    children: [
                      const SkipButton(),
                      const SignInInfo(),
                      50.verticalSpace,
                      const FormFieldWidget(),
                      10.verticalSpace,
                      const ForgetPasswordWidget(),
                      10.verticalSpace,
                      const SignInButton(),
                      40.verticalSpace,
                      const SignUpText()
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
