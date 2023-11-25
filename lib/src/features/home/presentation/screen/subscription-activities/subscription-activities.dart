import 'package:alnawadi/src/core/resources/app_strings.dart';
import 'package:alnawadi/src/core/widget/custom_button.dart';
import 'package:alnawadi/src/features/activities/data/model/post_sub_activity_model.dart';
import 'package:alnawadi/src/features/activities/domain/entity/activity_entity.dart';
import 'package:alnawadi/src/features/activities/presentation/controller/activity_bloc.dart';
import 'package:alnawadi/src/features/home/presentation/screen/subscription-activities/form_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SubscriptionActivities extends StatelessWidget {
  final ActivityData activityData;

  const SubscriptionActivities({Key? key, required this.activityData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppStrings.registering_for_the_activity.tr(),
          style: Theme.of(context).textTheme.titleSmall,
        ),
      ),
      body: SubscriptionActivitiesContent(
        activityData: activityData,
      ),
    );
  }
}

class SubscriptionActivitiesContent extends StatefulWidget {
  final ActivityData activityData;

  const SubscriptionActivitiesContent({Key? key, required this.activityData})
      : super(key: key);

  @override
  State<SubscriptionActivitiesContent> createState() =>
      _SubscriptionActivitiesContentState();
}

class _SubscriptionActivitiesContentState
    extends State<SubscriptionActivitiesContent> {
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
  //  context.read<ActivityBloc>().reset();

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<ActivityBloc>();
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SingleChildScrollView(
        child: Form(
          key: registerActivityKey,
          child: Column(
            children: [
              FormRegisterActivity(activityData: widget.activityData),
              50.verticalSpace,
              CustomButton(
                onTap: () {
                  if (registerActivityKey.currentState!.validate()) {
                    bloc.add(
                      SubToActivityEvent(
                        model: SubToActivityModel(
                          age: bloc.age.text,
                          name: bloc.name.text,
                          living: bloc.living.text,
                          phoneNumber: bloc.phoneNumber.text,
                          subscriptionAmount: widget.activityData.price,
                          activityId: widget.activityData.id.toString(),
                          typeScrip: bloc.typeScrip,
                          numberIndividuals: bloc.numberIndividuals.text,
                        ),
                        context: context,
                      ),
                    );
                    // context.goNamed(Routes.successSubscribeScreen);
                  }
                },
                text: AppStrings.subscription.tr(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
