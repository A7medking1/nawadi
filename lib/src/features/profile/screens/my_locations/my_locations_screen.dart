import 'package:alnawadi/src/core/app_prefs/app_prefs.dart';
import 'package:alnawadi/src/core/enums.dart';
import 'package:alnawadi/src/core/resources/app_assets.dart';
import 'package:alnawadi/src/core/resources/app_colors.dart';
import 'package:alnawadi/src/core/resources/app_strings.dart';
import 'package:alnawadi/src/core/resources/routes_manager.dart';
import 'package:alnawadi/src/core/services/index.dart';
import 'package:alnawadi/src/core/widget/custom_button.dart';
import 'package:alnawadi/src/features/cart/presentation/screen/cart_screens.dart';
import 'package:alnawadi/src/features/profile/controller/address/address_bloc.dart';
import 'package:alnawadi/src/features/profile/data/models/address.dart';
import 'package:alnawadi/src/features/profile/screens/my_locations/widget/address_item.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class MyLocationsScreen extends StatefulWidget {
  const MyLocationsScreen({Key? key}) : super(key: key);

  @override
  State<MyLocationsScreen> createState() => _MyLocationsScreenState();
}

class _MyLocationsScreenState extends State<MyLocationsScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<AddressBloc>().add(GetAddressEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppStrings.myAddresses.tr(),
          style: Theme.of(context).textTheme.titleSmall,
        ),
      ),
      body: const _MyLocationsBody(),
      bottomNavigationBar: Container(
        margin: EdgeInsetsDirectional.only(bottom: 40.h),
        padding: const EdgeInsetsDirectional.all(15),
        child: CustomButton(
          onTap: () {
            context.pushNamed(Routes.addLocations);
          },
          text: AppStrings.add_new_address.tr(),
        ),
      ),
    );
  }
}

class EmptyLocations extends StatelessWidget {
  const EmptyLocations({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            AppSvg.my_locations,
            height: 120,
          ),
          30.verticalSpace,
          Text(
            'لا يوجد عنوانين لديك',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          30.verticalSpace,
          Text(
            'قم باضافة عنوانين',
            style: Theme.of(context)
                .textTheme
                .titleSmall!
                .copyWith(color: AppColors.grey),
          ),
        ],
      ),
    );
  }
}

class _MyLocationsBody extends StatelessWidget {
  const _MyLocationsBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddressBloc, AddressState>(
      builder: (context, state) {
        switch (state.getAddressReqState) {
          case ReqState.error:
            return ConnectionErrorWidget(onTap: () {});
          case ReqState.empty:
            return const EmptyLocations();
          case ReqState.loading:
            return const CartShimmer();

          case ReqState.success:
            return ListView.separated(
              itemCount: state.address.length,
              itemBuilder: (context, index) {
                return AddressItems(
                  onTap: () {
                    final address = state.address[index];
                    sl<AppPreferences>().setLocation(
                      AddressModel(
                        id: address.id,
                        country: address.country,
                        state: address.state,
                        city: address.city,
                        address_1: address.address_1,
                        name: address.name,
                        email: address.email,
                        phone: address.phone,
                      ),
                    );
                    print(index);
                    context.read<AddressBloc>().add(GetAddressFromPrefs());
                    context.pop();
                  },
                  address: state.address[index],
                );
              },
              separatorBuilder: (BuildContext context, int index) =>
                  5.verticalSpace,
            );
        }
      },
    );
  }
}
/*

class AddressBuilder extends StatelessWidget {
  const AddressBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
  }
}

*/
