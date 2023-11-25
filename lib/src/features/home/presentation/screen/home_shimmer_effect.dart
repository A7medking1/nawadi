import 'package:alnawadi/src/core/widget/list_view_horizontal.dart';
import 'package:alnawadi/src/core/widget/vertical_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class BuildShimmerHomeWidget extends StatelessWidget {
  const BuildShimmerHomeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Shimmer.fromColors(
        baseColor: Colors.grey.withOpacity(0.3),
        highlightColor: Colors.white.withOpacity(0.25),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 120.h,
                    height: 70.h,
                    color: Colors.grey.withOpacity(0.9),
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.grey.withOpacity(0.9),
                  )
                ],
              ),
              20.verticalSpace,
              Container(
                width: double.infinity,
                height: 70.h,
                decoration: buildBoxDecoration(),
              ),
              20.verticalSpace,
              Container(
                width: double.infinity,
                height: 150.h,
                decoration: buildBoxDecoration(),
              ),
              20.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 120.h,
                    height: 30.h,
                    color: Colors.grey.withOpacity(0.9),
                  ),
                  Container(
                    width: 120.h,
                    height: 30.h,
                    color: Colors.grey.withOpacity(0.9),
                  ),
                ],
              ),
              40.verticalSpace,
              ListViewHorizontal(
                height: 120.h,
                count: 5,
                itemBuilder: (context, state) {
                  return Column(
                    children: [
                      CircleAvatar(
                        radius: 30.r,
                        backgroundColor: Colors.grey.withOpacity(0.9),
                        child: CircleAvatar(
                          radius: 25.r,
                          backgroundColor: Colors.grey.withOpacity(0.9),
                        ),
                      ),
                      10.verticalSpace,
                      Container(
                        width: 120.h,
                        height: 30.h,
                        color: Colors.grey.withOpacity(0.9),
                      ),
                    ],
                  );
                },
              ),
              30.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 120.h,
                    height: 30.h,
                    color: Colors.grey.withOpacity(0.9),
                  ),
                  Container(
                    width: 120.h,
                    height: 30.h,
                    color: Colors.grey.withOpacity(0.9),
                  ),
                ],
              ),
              30.verticalSpace,
              ListViewHorizontal(
                height: 160.h,
                count: 5,
                itemBuilder: (context, state) {
                  return Column(
                    children: [
                      Container(
                        color: Colors.grey.withOpacity(0.9),
                        height: 80,
                        width: 120,
                        child: CircleAvatar(
                          radius: 25.r,
                          backgroundColor: Colors.grey.withOpacity(0.9),
                        ),
                      ),
                      10.verticalSpace,
                      Container(
                        width: 120.h,
                        height: 30.h,
                        color: Colors.grey.withOpacity(0.9),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
