import 'package:alnawadi/src/core/enums.dart';
import 'package:alnawadi/src/core/resources/app_strings.dart';
import 'package:alnawadi/src/core/validator_form.dart';
import 'package:alnawadi/src/core/widget/custom_button.dart';
import 'package:alnawadi/src/core/widget/custom_loading.dart';
import 'package:alnawadi/src/core/widget/custom_text_formField.dart';
import 'package:alnawadi/src/features/profile/controller/address/address_bloc.dart';
import 'package:alnawadi/src/features/profile/data/models/address.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddLocationsScreen extends StatelessWidget {
  const AddLocationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppStrings.add_new_address.tr(),
          style: Theme.of(context).textTheme.titleSmall,

        ),
      ),
      body: const _AddLocationsBody(),
    );
  }
}

class _AddLocationsBody extends StatefulWidget {
  const _AddLocationsBody({Key? key}) : super(key: key);

  @override
  State<_AddLocationsBody> createState() => _AddLocationsBodyState();
}

class _AddLocationsBodyState extends State<_AddLocationsBody> with Validator {
  final TextEditingController country = TextEditingController();
  final TextEditingController city = TextEditingController();
  final TextEditingController stateUser = TextEditingController();
  final TextEditingController address = TextEditingController();
  final TextEditingController name = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController email = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    email.dispose();
    city.dispose();
    country.dispose();
    stateUser.dispose();
    address.dispose();
    name.dispose();
    phone.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddressBloc, AddressState>(
      buildWhen: (prev, cur) => prev.addReqState != cur.addReqState,
      listener: (context, state) {
        if (state.addReqState == ReqState.loading) {
          OverlayLoadingProgress.start(context);
        }
        if (state.addReqState == ReqState.success) {
          OverlayLoadingProgress.stop();
        }
        if (state.addReqState == ReqState.error) {
          OverlayLoadingProgress.stop();
        }
      },
      builder: (context, state) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  CustomTextFormField(
                    title: 'البلد',
                    controller: country,
                    validator: validateAddress,
                  ),
                  10.verticalSpace,
                  CustomTextFormField(
                    title: 'المدينة',
                    controller: city,
                    validator: validateCity,
                  ),
                  10.verticalSpace,
                  CustomTextFormField(
                    title: 'المنطقة',
                    controller: stateUser,
                    validator: validateCity,
                  ),
                  10.verticalSpace,
                  CustomTextFormField(
                    title: 'قم بادخال اسم المكان',
                    controller: address,
                    validator: validateAddress,
                  ),
                  10.verticalSpace,
                  CustomTextFormField(
                    title: 'اسم الشخص',
                    controller: name,
                    validator: validateName,
                  ),
                  10.verticalSpace,
                  CustomTextFormField(
                    title: AppStrings.email.tr(),
                    controller: email,
                    validator: validateEmail,
                  ),
                  10.verticalSpace,
                  CustomTextFormField(
                    title: AppStrings.phone.tr(),
                    controller: phone,
                    validator: validatePhone,
                  ),
                  50.verticalSpace,
                  CustomButton(
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        AddressModel addressE = AddressModel(
                          country: country.text,
                          state: stateUser.text,
                          city: city.text,
                          address_1: address.text,
                          name: name.text,
                          email: email.text,
                          phone: phone.text,
                        );
                        context.read<AddressBloc>().add(
                              AddAddressEvent(
                                context,
                                addressEntity: addressE,

                              ),
                            );
/*
                        sl<AppPreferences>().setLocation(addressE);
                        context.read<AddressBloc>().add(GetAddressFromPrefs());
*/
                      }
                    },
                    text: AppStrings.add_new_address.tr(),
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
