import 'package:alnawadi/src/core/resources/app_assets.dart';
import 'package:alnawadi/src/core/resources/app_colors.dart';
import 'package:alnawadi/src/core/resources/app_strings.dart';
import 'package:alnawadi/src/core/resources/style.dart';
import 'package:alnawadi/src/features/order/presentation/controller/order_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChoosePayMethodsWidget extends StatelessWidget {
  const ChoosePayMethodsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.paymentMethods.tr(),
          style: Theme.of(context).textTheme.titleSmall!.copyWith(

          ),
        ),
        8.verticalSpace,
        const PayMethodsBuilder(),
      ],
    );
  }
}

class PayMethodsBuilder extends StatelessWidget {
  const PayMethodsBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180.h,
      child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 2,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return PayMethodsItems(
              model: payMethods[index],
            );
          }),
    );
  }
}

class PayMethodsItems extends StatelessWidget {
  const PayMethodsItems({
    super.key,
    required this.model,
  });

  final PayMethodModel model;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderBloc, OrderState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            context.read<OrderBloc>().add(SelectPayMethodEvent(model.id));
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 400),
            curve: Curves.linear,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: const EdgeInsets.all(13.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadiusDirectional.circular(15),
                  border: Border.all(
                    color: model.id == state.selectPayMethodsId
                        ? AppColors.primary
                        : AppColors.grey.withOpacity(0.2),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset(
                          model.icon,
                          height: 40,
                        ),
                        10.horizontalSpace,
                        Text(
                          model.name,
                          style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            fontSize: 13.sp,
                          ),
                        ),
                      ],
                    ),
                    CircleAvatar(
                      radius: 10,
                      backgroundColor: AppColors.primary,
                      child: CircleAvatar(
                        radius: 8,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                          radius: 4,
                          backgroundColor: model.id == state.selectPayMethodsId
                              ? AppColors.primary
                              : AppColors.white,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

List<PayMethodModel> payMethods = const [
  PayMethodModel(id: 1, name: 'الدفع عند الاستلام', icon: AppSvg.pay_cash),
  PayMethodModel(id: 2, name: 'الدفع عن طريق فيزا', icon: AppSvg.visa_pay),
];

class PayMethodModel extends Equatable {
  final int id;

  final String name;

  final String icon;

  const PayMethodModel({
    required this.id,
    required this.name,
    required this.icon,
  });

  @override
  List<Object> get props => [id, name, icon];
}
