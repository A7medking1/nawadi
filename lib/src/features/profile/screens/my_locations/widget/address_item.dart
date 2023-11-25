import 'package:alnawadi/src/core/resources/app_colors.dart';
import 'package:alnawadi/src/core/resources/style.dart';
import 'package:alnawadi/src/features/profile/controller/address/address_bloc.dart';
import 'package:alnawadi/src/features/profile/domain/entity/address.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddressItems extends StatelessWidget {
  final AddressEntity address;
  final void Function()? onTap;
  final void Function()? onTapDelete;
  final bool isOrderScreen ;

  const AddressItems({
    super.key,
    required this.address,
     this.onTap,
    this.onTapDelete ,
    this.isOrderScreen = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          padding: const EdgeInsetsDirectional.all(10),
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.primary.withOpacity(0.1),
            borderRadius: BorderRadiusDirectional.circular(15),
            border: Border.all(
              color: AppColors.grey.withOpacity(0.4),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    address.address_1,
                    style: getSemiBoldStyle(
                      color: AppColors.primary,
                    ),
                  ),
                  if(!isOrderScreen)...[
                    Row(
                      children: [
                        InkWell(
                          onTap: () {},
                          child: const CircleAvatar(
                            backgroundColor: AppColors.primary,
                            radius: 13,
                            child: Icon(
                              Icons.edit,
                              color: Colors.white,
                              size: 17,
                            ),
                          ),
                        ),
                        10.horizontalSpace,
                        IconButton(
                          onPressed: onTapDelete ?? () {
                            context
                                .read<AddressBloc>()
                                .add(DeleteAddressEvent(addressId: address.id!));
                          },
                          icon: const Icon(
                            Icons.delete_outline_outlined,
                            color: Colors.red,
                            size: 27,
                          ),
                        ),
                      ],
                    ),
                  ]
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.location_on,
                    color: AppColors.primary,
                  ),
                  Text(
                    '${address.country} - ${address.state} - ${address.address_1}',
                    style:
                        getRegularStyle(color: AppColors.grey, fontSize: 16.sp),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
