import 'package:alnawadi/src/core/resources/app_colors.dart';
import 'package:alnawadi/src/core/resources/app_strings.dart';
import 'package:alnawadi/src/core/services/index.dart';
import 'package:alnawadi/src/core/validator_form.dart';
import 'package:alnawadi/src/core/widget/custom_button.dart';
import 'package:alnawadi/src/core/widget/custom_text_formField.dart';
import 'package:alnawadi/src/features/profile/controller/profile_bloc.dart';
import 'package:alnawadi/src/features/profile/data/models/chnage_password.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChangePassScreen extends StatelessWidget {
  const ChangePassScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<ProfileBloc>(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.primary,
        ),
        body: _ChangePassBody(),
      ),
    );
  }
}

class _ChangePassBody extends StatelessWidget with Validator {
  final formKey = GlobalKey<FormState>();

  _ChangePassBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<ProfileBloc>();
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomTextFormField(
                    controller: bloc.oldPass,
                    title: 'كلمة المرور القديمة',
                    hintText: '*******',
                    validator: validatePassword,
                    // readOnly: true,
                  ),
                  10.verticalSpace,
                  CustomTextFormField(
                    controller: bloc.newPass,
                    title: AppStrings.password.tr(),
                    hintText: '*******',
                    validator: validatePassword,
                    //  readOnly: true,
                  ),
                  10.verticalSpace,
                  CustomTextFormField(
                    controller: bloc.confirmPass,
                    title: AppStrings.password_confirm.tr(),
                    hintText: '*******',
                    validator: (value) =>
                        validateConfirmPassword(value, bloc.confirmPass.text),
                    // readOnly: true,
                  ),
                  70.verticalSpace,
                  CustomButton(
                    onTap: () {
                      bloc.add(
                        ChangeUserPassEvent(
                          ChangePassModel(
                            old_password: bloc.oldPass.text,
                            new_password: bloc.newPass.text,
                            new_password_confirmation: bloc.confirmPass.text,
                          ),
                          context,
                        ),
                      );
                    },
                    text: AppStrings.confirmation.tr(),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
