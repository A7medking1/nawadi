import 'package:alnawadi/src/core/app_prefs/app_prefs.dart';
import 'package:alnawadi/src/core/resources/app_strings.dart';
import 'package:alnawadi/src/core/resources/routes_manager.dart';
import 'package:alnawadi/src/core/services/index.dart';
import 'package:alnawadi/src/core/widget/custom_button.dart';
import 'package:alnawadi/src/features/on_boarding/data/data.dart';
import 'package:alnawadi/src/features/on_boarding/presentation/widget/indicator_pageView.dart';
import 'package:alnawadi/src/features/on_boarding/presentation/widget/page_view_items.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class PageViewBuilder extends StatefulWidget {
  const PageViewBuilder({
    super.key,
  });

  @override
  State<PageViewBuilder> createState() => _PageViewBuilderState();
}

class _PageViewBuilderState extends State<PageViewBuilder> {
  final pageController = PageController(initialPage: 0);

  int currentPage = 0;

  bool isLastPage = false;

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.45,
            child: PageView.builder(
              physics: const BouncingScrollPhysics(),
              controller: pageController,
              scrollDirection: Axis.horizontal,
              itemCount: onBoardingItems.length,
              onPageChanged: (int index) {
                if (index == onBoardingItems.length - 1) {
                  isLastPage = true;
                } else {
                  isLastPage = false;
                }
                setState(() {
                  currentPage = index;
                });
              },
              itemBuilder: (context, index) {
                return PageViewWidget(
                  model: onBoardingItems[index],
                );
              },
            ),
          ),
          IndicatorPageView(currentIndex: currentPage),
          SizedBox(
            height: 70.h,
          ),
          CustomButton(
            onTap: () {
              if (isLastPage) {
                 sl<AppPreferences>().setOnBoarding();
                context.goNamed(Routes.signIn);
              } else {
                pageController.nextPage(
                  duration: const Duration(milliseconds: 750),
                  curve: Curves.fastLinearToSlowEaseIn,
                );
              }
            },
            text: textBtn,
          ),
        ],
      ),
    );
  }

  String get textBtn =>
      !isLastPage ? AppStrings.btnNext.tr() : AppStrings.btnGetStarted.tr();
}
