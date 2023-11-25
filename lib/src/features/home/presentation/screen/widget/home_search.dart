import 'package:alnawadi/src/core/resources/app_colors.dart';
import 'package:alnawadi/src/core/resources/app_strings.dart';
import 'package:alnawadi/src/core/resources/routes_manager.dart';
import 'package:alnawadi/src/core/widget/custom_text_formField.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeSearchWidget extends StatelessWidget {
  const HomeSearchWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      readOnly: true,
      onTap: () => context.pushNamed(Routes.search),
      title: '',
      hintText: AppStrings.search_for_products_and_activities.tr(),
      prefixIcon: const Icon(
        Icons.search,
        color: AppColors.primary,
        size: 25,
      ),
    );
  }
}
