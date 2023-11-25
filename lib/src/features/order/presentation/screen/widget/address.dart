import 'package:alnawadi/src/core/enums.dart';
import 'package:alnawadi/src/core/resources/app_colors.dart';
import 'package:alnawadi/src/core/resources/app_strings.dart';
import 'package:alnawadi/src/core/resources/routes_manager.dart';
import 'package:alnawadi/src/features/profile/controller/address/address_bloc.dart';
import 'package:alnawadi/src/features/profile/domain/entity/address.dart';
import 'package:alnawadi/src/features/profile/screens/my_locations/widget/address_item.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class AddressSectionWidget extends StatelessWidget {
  const AddressSectionWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddressBloc, AddressState>(
      builder: (context, state) {
        if (state.addressReqState == ReqState.loading) {
          return const CircularProgressIndicator();
        }

        return Column(
          children: [
            GestureDetector(
              onTap: () => context.pushNamed(Routes.myLocations),
              child: Row(
                children: [
                  /* Container(
                    height: 25.r,
                    width: 25.r,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadiusDirectional.circular(25.r),
                      border: Border.all(
                        color: AppColors.primary,
                      ),
                    ),
                    child: const Icon(
                      Icons.add,
                      size: 19,
                      color: AppColors.primary,
                    ),
                  ),*/
                  CircleAvatar(
                    radius: 13.r,
                    backgroundColor: AppColors.white,
                    child: const Icon(
                      Icons.add,
                      size: 19,
                      color: AppColors.primary,
                    ),
                  ),
                  10.horizontalSpace,
                  Text(
                    AppStrings.add_new_address.tr(),
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: AppColors.primary,
                      fontSize: 14.sp,
                        ),
                  ),
                ],
              ),
            ),
            10.verticalSpace,
            if (state.currentAddress!.country != '')
              AddressItems(
                isOrderScreen: true,
                address: AddressEntity(
                  country: state.currentAddress!.country,
                  state: state.currentAddress!.state,
                  city: state.currentAddress!.city,
                  address_1: state.currentAddress!.address_1,
                  name: state.currentAddress!.name,
                  email: state.currentAddress!.email,
                  phone: state.currentAddress!.phone,
                ),
              ),
          ],
        );
      },
    );
  }
}
