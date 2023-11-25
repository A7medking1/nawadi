import 'package:alnawadi/src/core/resources/app_assets.dart';
import 'package:alnawadi/src/core/resources/app_colors.dart';
import 'package:alnawadi/src/core/resources/style.dart';
import 'package:alnawadi/src/features/profile/controller/my_order/my_order_bloc.dart';
import 'package:alnawadi/src/features/profile/screens/my_order/widget/amount_order_info.dart';
import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

RoundedRectangleBorder roundedRectangleBorder = RoundedRectangleBorder(
  borderRadius: BorderRadiusDirectional.only(
    topStart: Radius.circular(30.r),
    topEnd: Radius.circular(30.r),
  ),
);

int activeStepOrderStatus(String status) {
  switch (status) {
    case 'pending':
      return 1;
    case 'processing':
      return 2;
    case 'delivering':
      return 3;
    case 'completed':
      return 4;
  }
  return 5;
}

Future<dynamic> buildShowModalBottomSheet(BuildContext context) async {
  return await showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: roundedRectangleBorder,
    builder: (builder) {
      return SizedBox(
        height: MediaQuery.sizeOf(context).height * 0.7,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomEasyStepper(),
                15.verticalSpace,
                const PriceInfo(),
                20.verticalSpace,
                const OrderInfoAddressPayMethod(),
              ],
            ),
          ),
        ),
      );
    },
  );
}

class OrderInfoAddressPayMethod extends StatelessWidget {
  const OrderInfoAddressPayMethod({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<MyOrderBloc>().state.orderDetailsEntity;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'عنوان التوصيل وطريقة الدفع',
          style: getMediumStyle(),
        ),
        10.verticalSpace,
        Container(
          padding: const EdgeInsetsDirectional.all(25),
          decoration: BoxDecoration(
            border: Border.all(
              color: AppColors.grey.withOpacity(0.3),
            ),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  SvgPicture.asset(bloc!.payment_method == 'cash_on_delivery'
                      ? AppSvg.pay_cash
                      : AppSvg.visa_pay),
                  10.horizontalSpace,
                  Text(
                    bloc.payment_method != 'cash_on_delivery'
                        ? 'الدفع عن طريق بطاقة بنكية'
                        : 'الدفع عند الاستلام',
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(fontSize: 14.sp),
                  )
                ],
              ),
              10.verticalSpace,
              Row(
                children: [
                  SvgPicture.asset(AppSvg.my_locations),
                  10.horizontalSpace,
                  Text(
                    '${bloc.addressEntity.country} - ${bloc.addressEntity.state} - ${bloc.addressEntity.address_1}',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 15.sp),
                  ),
                ],
              ),
            ],
          ),
        ),
        20.verticalSpace,
        Text(
          'ملاحظات العميل',
          style: getMediumStyle(),
        ),
        10.verticalSpace,
        if(bloc.description != '')
        Container(
          padding: const EdgeInsetsDirectional.all(25),
          decoration: BoxDecoration(
            border: Border.all(
              color: AppColors.grey.withOpacity(0.3),
            ),
          ),
          child: Text(
            bloc.description,
            style: getMediumStyle(color: AppColors.grey),
          ),
        ),
      ],
    );
  }
}

class PriceInfo extends StatelessWidget {
  const PriceInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<MyOrderBloc>();
    return Container(
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadiusDirectional.circular(15),
      ),
      padding: const EdgeInsetsDirectional.all(15),
      child: AmountOrderInformation(
        totalAmount: '\$${bloc.state.orderDetailsEntity!.total}',
        totalPurchaseAmount: '\$${bloc.state.orderDetailsEntity!.subtotal}',
        discountPrice: '\$${bloc.state.orderDetailsEntity!.discount}',
      ),
    );
  }
}

class CustomEasyStepper extends StatelessWidget {
  const CustomEasyStepper({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<MyOrderBloc>();
    return EasyStepper(
      activeStep: activeStepOrderStatus(bloc.state.orderDetailsEntity!.status),
      activeLineColor: AppColors.grey,
      unreachedLineColor: AppColors.grey,
      finishedLineColor: AppColors.primary,
      enableStepTapping: false,
      activeStepBackgroundColor: AppColors.primary,
      lineLength: 60,
      stepShape: StepShape.circle,
      stepBorderRadius: 0,
      borderThickness: 1,
      lineType: LineType.normal,
      //  padding: const EdgeInsetsDirectional.all(20),
      stepRadius: 20,
      //    finishedStepBorderColor: Colors.deepOrange,
      //finishedStepTextColor: AppColors.primary.withOpacity(0.1),
      finishedStepBackgroundColor: const Color(0xFFE3E3F2),
      finishedStepIconColor: AppColors.primary,
      //   activeStepIconColor: Colors.black,
      fitWidth: true,
      disableScroll: false,
      // showLoadingAnimation: false,
      showLoadingAnimation: true,
      activeStepIconColor: Colors.white,
      unreachedStepIconColor: AppColors.black,
      steps: [
        buildEasyStep(
          title: 'تم قبول الطلب',
        ),
        buildEasyStep(
          title: 'التحضير',
        ),
        buildEasyStep(
          title: 'طلبكم في الطريق',
        ),
        buildEasyStep(
          title: 'تم التوصيل',
        ),
      ],
      //  onStepReached: (index) => setState(() => activeStep = index),
    );
  }
}

EasyStep buildEasyStep({required String title}) {
  return EasyStep(
    icon: const Icon(Icons.delivery_dining),
    finishIcon: const Icon(
      Icons.done,
      color: AppColors.primary,
    ),
    activeIcon: Icon(
      Icons.access_alarm,
      color: AppDarkColors.black,
    ),
    customTitle: Text(
      title,
      textAlign: TextAlign.center,
      style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
    ),
  );
}
