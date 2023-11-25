import 'package:alnawadi/src/core/resources/app_strings.dart';
import 'package:alnawadi/src/core/services/index.dart';
import 'package:alnawadi/src/core/validator_form.dart';
import 'package:alnawadi/src/core/widget/custom_button.dart';
import 'package:alnawadi/src/core/widget/custom_text_formField.dart';
import 'package:alnawadi/src/features/profile/controller/profile_bloc.dart';
import 'package:alnawadi/src/features/profile/data/models/contact_us_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<ProfileBloc>(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            AppStrings.contactUs.tr(),
          ),
        ),
        body: const ContactUsScreenBody(),
      ),
    );
  }
}

class ContactUsScreenBody extends StatefulWidget {
  const ContactUsScreenBody({Key? key}) : super(key: key);

  @override
  State<ContactUsScreenBody> createState() => _ContactUsScreenBodyState();
}

class _ContactUsScreenBodyState extends State<ContactUsScreenBody>
    with Validator {
  final TextEditingController fullName = TextEditingController();
  final TextEditingController subject = TextEditingController();
  final TextEditingController message = TextEditingController();
  final TextEditingController phone = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<ProfileBloc>();
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  CustomTextFormField(
                    controller: fullName,
                    title: '',
                    hintText: AppStrings.full_name.tr(),
                    validator: validateName,
                  ),
                  20.verticalSpace,
                  CustomTextFormField(
                    controller: phone,
                    title: '',
                    hintText: AppStrings.phone_number.tr(),
                    validator: validatePhone,
                  ),
                  20.verticalSpace,
                  CustomTextFormField(
                    controller: subject,
                    title: '',
                    hintText: AppStrings.subjectTitle.tr(),
                    validator: validate,
                  ),
                  20.verticalSpace,
                  CustomTextFormField(
                    controller: message,
                    title: '',
                    maxLines: 7,
                    hintText: AppStrings.notes.tr(),
                    validator: validate,
                  ),
                  40.verticalSpace,
                  CustomButton(
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        bloc.add(PostContactUsEvent(
                            ContactUsModel(
                              name: fullName.text,
                              phone: phone.text,
                              subject: subject.text,
                              message: message.text,
                            ),
                            context));
                      }
                    },
                    text: AppStrings.continue_verify.tr(),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
