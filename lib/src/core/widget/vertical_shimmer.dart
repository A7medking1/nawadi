import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class BuildShimmer extends StatelessWidget {
  const BuildShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 5,
      itemBuilder: (context, index) {
        return const BuildShimmerItems();
      },
    );
  }
}

class BuildShimmerItems extends StatelessWidget {
  const BuildShimmerItems({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Shimmer.fromColors(
          baseColor: Colors.grey.withOpacity(0.3),
          highlightColor: Colors.white.withOpacity(0.6),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 140,
                  width: double.infinity,
                  decoration: buildBoxDecoration(),
                ),
                10.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 20,
                      width: 120,
                      decoration: buildBoxDecoration(),
                    ),
                    Container(
                      height: 20,
                      width: 120,
                      decoration: buildBoxDecoration(),
                    ),
                  ],
                ),
                20.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 40,
                      width: 120,
                      decoration: buildBoxDecoration(),
                    ),
                    Container(
                      height: 40,
                      width: 120,
                      decoration: buildBoxDecoration(),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

BoxDecoration buildBoxDecoration() {
  return BoxDecoration(
    color: Colors.grey.withOpacity(0.9),
    borderRadius: buildBorderRadius(),
  );
}

BorderRadiusDirectional buildBorderRadius() =>
    BorderRadiusDirectional.circular(15);
