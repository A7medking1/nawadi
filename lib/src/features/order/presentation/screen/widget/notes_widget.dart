import 'package:alnawadi/src/core/resources/app_strings.dart';
import 'package:alnawadi/src/core/widget/custom_text_formField.dart';
import 'package:alnawadi/src/features/order/presentation/controller/order_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotesWidget extends StatelessWidget {
  const NotesWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      controller: context.read<OrderBloc>().descController,
      title: AppStrings.otherNotes.tr(),
      hintText: AppStrings.writeNotes.tr(),
      maxLines: 5,
    );
  }
}
