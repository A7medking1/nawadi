import 'package:alnawadi/src/core/enums.dart';
import 'package:alnawadi/src/core/resources/app_strings.dart';
import 'package:alnawadi/src/core/validator_form.dart';
import 'package:alnawadi/src/core/widget/custom_loading.dart';
import 'package:alnawadi/src/core/widget/custom_text_formField.dart';
import 'package:alnawadi/src/features/activities/domain/entity/activity_entity.dart';
import 'package:alnawadi/src/features/activities/presentation/controller/activity_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final registerActivityKey = GlobalKey<FormState>();

class FormRegisterActivity extends StatelessWidget with Validator {
  final ActivityData activityData;

  const FormRegisterActivity({
    super.key,
    required this.activityData,
  });

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<ActivityBloc>();
    return BlocConsumer<ActivityBloc, ActivityState>(
      listener: (context, state) {
        if (state.subToActivityState == ReqState.loading) {
          OverlayLoadingProgress.start(context);
        }

        if (state.subToActivityState == ReqState.success) {
          OverlayLoadingProgress.stop();
        }

        if (state.subToActivityState == ReqState.error) {
          OverlayLoadingProgress.stop();
        }
      },
      builder: (context, state) {
        return Column(
          children: [
            CustomTextFormField(
              controller: bloc.name,
              title: AppStrings.subscriber_name.tr(),
              hintText: AppStrings.enter_full_name.tr(),
              validator: validate,
            ),
            20.verticalSpace,
            CustomTextFormField(
              controller: bloc.age,
              title: AppStrings.subscriber_age.tr(),
              hintText: AppStrings.subscriber_age.tr(),
              validator: validate,
            ),
            20.verticalSpace,
            CustomTextFormField(
              controller: bloc.living,
              title: AppStrings.residence.tr(),
              hintText: AppStrings.enter_detailed_residence.tr(),
              validator: validate,
            ),
            //  20.verticalSpace,
            /*   CustomTextFormField(
              controller: bloc.typeScrip,
              title: 'مدة الاشتراك',
              hintText: 'month - year - day',
              validator: (value) {
                if (value!.isEmpty ||
                    value.trim().compareTo("month") != 0 &&
                        value.trim().compareTo("day") != 0 &&
                        value.trim().compareTo("year") != 0) {
                  return 'الرجاء إدخال month - day - year';
                }
                return null;
              },
            ),*/
            20.verticalSpace,
            CustomTextFormField(
              controller: bloc.numberIndividuals,
              title: 'عدد الأفراد',
              hintText: 'عدد الأفراد',
              validator: validate,
            ),
            20.verticalSpace,
            MenuWidget(bloc: bloc),
            CustomTextFormField(
              controller: bloc.subscriptionAmount,
              title: AppStrings.subscription_amount.tr(),
              hintText: '${activityData.price} \$',
              readOnly: true,
              //  validator: validate,
            ),
            20.verticalSpace,
            CustomTextFormField(
              controller: bloc.phoneNumber,
              title: AppStrings.phone_number.tr(),
              hintText: AppStrings.phone_number.tr(),
              validator: validate,
            ),
          ],
        );
      },
    );
  }
}

class MenuWidget extends StatefulWidget {
  const MenuWidget({
    super.key,
    required this.bloc,
  });

  final ActivityBloc bloc;

  @override
  State<MenuWidget> createState() => _MenuWidgetState();
}

class _MenuWidgetState extends State<MenuWidget> {
  @override
  Widget build(BuildContext context) {
    final bloc = context.read<ActivityBloc>();

    return DropdownButton<String>(
      value: widget.bloc.typeScrip,
      isExpanded: true,
      style: Theme.of(context).textTheme.titleSmall,
      padding: const EdgeInsetsDirectional.all(16),
      items: <String>['month', 'year', 'day'].map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (value) {
        bloc.typeScrip = value!;
        setState(() {});
      },
    );
  }
}
