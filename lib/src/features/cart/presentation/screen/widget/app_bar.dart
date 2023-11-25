import 'package:alnawadi/src/core/resources/app_strings.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

AppBar buildAppBarCartScreen(context) {
  return AppBar(
    title: Text(
      AppStrings.shoppingBasket.tr(),
      style: Theme.of(context).textTheme.titleSmall,
    ),
    actions: [
      Container(
        margin: const EdgeInsetsDirectional.only(
          start: 20,
          end: 15,
        ),
        child: const Icon(
          Icons.shopping_cart_outlined,
        ),
      ),
    ],
  );
}