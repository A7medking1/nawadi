import 'package:alnawadi/src/features/on_boarding/presentation/widget/page_view_builder.dart';
import 'package:alnawadi/src/features/on_boarding/presentation/widget/skip_button.dart';
import 'package:flutter/material.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [
          SkipButton(),
        ],
      ),
      body: const _OnBoardingScreenContent(),
    );
  }
}

class _OnBoardingScreenContent extends StatelessWidget {
  const _OnBoardingScreenContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        PageViewBuilder(),
      ],
    );
  }
}
