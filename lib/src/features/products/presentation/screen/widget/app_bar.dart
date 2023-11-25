import 'package:alnawadi/src/core/resources/app_strings.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

AppBar productAppBar(context) => AppBar(
      title: Text(
        AppStrings.products.tr(),
        style: Theme.of(context).textTheme.titleSmall,
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
