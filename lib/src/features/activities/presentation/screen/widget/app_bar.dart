import 'package:alnawadi/src/core/resources/app_strings.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';


AppBar activityAppBar(context) => AppBar(
  title: Text(
    AppStrings.activity.tr(),
    style: Theme.of(context).textTheme.titleSmall!.copyWith(

    ),
  ),
  centerTitle: true,
  actions: [
    IconButton(
      onPressed: () {},
      icon: const Icon(
        Icons.search,
      ),
    ),
  ],
);

