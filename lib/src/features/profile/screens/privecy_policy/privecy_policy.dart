import 'package:alnawadi/src/core/enums.dart';
import 'package:alnawadi/src/core/resources/app_strings.dart';
import 'package:alnawadi/src/core/services/index.dart';
import 'package:alnawadi/src/core/widget/vertical_shimmer.dart';
import 'package:alnawadi/src/features/profile/controller/profile_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<ProfileBloc>()..add(GetPrivacyPolicyEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppStrings.aboutTheApplication.tr()),
        ),
        body: const _PrivacyPolicyBody(),
      ),
    );
  }
}

class _PrivacyPolicyBody extends StatelessWidget {
  const _PrivacyPolicyBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        return switch (state.policyReqState) {
          ReqState.empty => const BuildShimmer(),
          ReqState.loading => const BuildShimmer(),
          ReqState.error => const BuildShimmer(),
          ReqState.success => _BuildScreen(
              data: state.text,
            ),
        };
      },
    );
  }
}

class _BuildScreen extends StatelessWidget {
  const _BuildScreen({Key? key, required this.data}) : super(key: key);

  final String data;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Html(
              data: data,
            )
          ],
        ),
      ),
    );
  }
}
