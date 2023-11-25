import 'package:alnawadi/src/core/resources/app_assets.dart';
import 'package:alnawadi/src/core/resources/app_strings.dart';
import 'package:alnawadi/src/features/on_boarding/model/on_boarding_model.dart';

List<OnBoardingModel> onBoardingItems = [
  const OnBoardingModel(
    title: AppStrings.title1,
    body: AppStrings.description1,
    image: AppImages.onBoardingOne,
  ),
  const OnBoardingModel(
    title: AppStrings.title2,
    body: AppStrings.description2,
    image: AppImages.onBoardingTwo,
  ),
  const OnBoardingModel(
    title: AppStrings.title3,
    body: AppStrings.description3,
    image: AppImages.onBoardingThree,
  ),
];
