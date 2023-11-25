import 'package:alnawadi/src/core/api/api_constant.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

RoundedRectangleBorder buildRoundedRectangleBorder(double radius) {
  return RoundedRectangleBorder(
      borderRadius: BorderRadiusDirectional.circular(radius));
}

extension MyRadius on double {
  void radius() {
    RoundedRectangleBorder(
        borderRadius: BorderRadiusDirectional.circular(this));
  }
}


extension BaseUrl on String {
  String get toImageUrl {
   return ApiConstant.imagePath(this);
  }
}




class FadeAnimation extends StatelessWidget {
  final Widget child;

  const FadeAnimation({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      from: 20,
      duration: const Duration(milliseconds: 500),
      child: child,
    );
  }
}