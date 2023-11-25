import 'package:alnawadi/src/core/enums.dart';
import 'package:alnawadi/src/core/resources/app_colors.dart';
import 'package:alnawadi/src/core/resources/app_strings.dart';
import 'package:alnawadi/src/core/resources/routes_manager.dart';
import 'package:alnawadi/src/core/widget/custom_button.dart';
import 'package:alnawadi/src/core/widget/custom_text_formField.dart';
import 'package:alnawadi/src/features/profile/controller/profile_bloc.dart';
import 'package:alnawadi/src/features/profile/data/models/update_user_data.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ProfileFormFieldAndButton extends StatelessWidget {
  const ProfileFormFieldAndButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<ProfileBloc>();
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        if (state.reqState == ReqState.loading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        return Padding(
          padding:
              EdgeInsetsDirectional.only(top: 85.0.h, start: 15.w, end: 15.w),
          child: Column(
            children: [
              CustomTextFormField(
                controller: bloc.fullName,
                title: AppStrings.full_name.tr(),
                hintText: state.user.name,
                // readOnly: true,
              ),
              10.verticalSpace,
              CustomTextFormField(
                controller: bloc.phone,
                title: AppStrings.phone_number.tr(),
                hintText: state.user.phone,
                // readOnly: true,
              ),
              10.verticalSpace,
              CustomTextFormField(
                controller: bloc.email,
                title: AppStrings.email.tr(),
                hintText: state.user.email,
                // readOnly: true,
              ),
              50.verticalSpace,
              CustomButton(
                onTap: () {
                  bloc.add(
                    UpdateUserDataEvent(
                      UpdateUserDataModel(
                        name: bloc.fullName.text,
                        email: bloc.email.text,
                        phone: bloc.phone.text,
                      ),
                      context,
                    ),
                  );
                },
                text: 'حفظ التعديلات',
              ),
              50.verticalSpace,
              CustomButton(
                onTap: () => context.pushNamed(Routes.changePass),
                text: AppStrings.password.tr(),
                color: AppColors.redWIthOp,
              ),
            ],
          ),
        );
      },
    );
  }
}
