import 'package:alnawadi/src/core/services/index.dart';
import 'package:alnawadi/src/features/auth/presentation/controller/auth_bloc.dart';
import 'package:alnawadi/src/features/auth/presentation/screens/sign_up/widget/form_field_widget.dart';
import 'package:alnawadi/src/features/auth/presentation/screens/sign_up/widget/signInText.dart';
import 'package:alnawadi/src/features/auth/presentation/screens/sign_up/widget/sign_up_button.dart';
import 'package:alnawadi/src/features/auth/presentation/screens/sign_up/widget/sign_up_info_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

final signUpFormKey = GlobalKey<FormState>();

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<AuthBloc>(),
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsetsDirectional.all(15),
              child: SizedBox(
                width: double.infinity,
                child: Form(
                  key: signUpFormKey,
                  child: Column(
                    children: [
                      const BackButton(),
                      10.verticalSpace,
                      const SignUpInfoWidget(),
                      30.verticalSpace,
                      const FormFieldWidget(),
                      30.verticalSpace,
                      const SignUpButton(),
                      20.verticalSpace,
                      const SignInText(),
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

class BackButton extends StatelessWidget {
  const BackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.topStart,
      child: IconButton(
        onPressed: () => context.pop(),
        icon: const Icon(
          Icons.arrow_back_ios,
        ),
      ),
    );
  }
}
