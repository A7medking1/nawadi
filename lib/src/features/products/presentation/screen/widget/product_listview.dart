import 'package:alnawadi/src/core/enums.dart';
import 'package:alnawadi/src/core/hepler.dart';
import 'package:alnawadi/src/core/widget/vertical_shimmer.dart';
import 'package:alnawadi/src/features/home/presentation/screen/widget/product_items.dart';
import 'package:alnawadi/src/features/products/presentation/controller/products_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BuildProductList extends StatelessWidget {
  const BuildProductList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductsState>(
      builder: (context, state) {
        if (state.productByCategoryReqState == ReqState.error) {
          return Align(
            alignment: AlignmentDirectional.center,
            child: Text(
              state.message,
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    fontWeight: FontWeight.w300,
                  ),
            ),
          );
        }
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'منتجات ${state.selectedCategory!.catName} ',
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    fontWeight: FontWeight.w300,
                  ),
            ),
            switch (state.productByCategoryReqState) {
              ReqState.loading => const BuildShimmer(),
              ReqState.empty => const CircularProgressIndicator(),
              ReqState.error => const CircularProgressIndicator(),
              ReqState.success => FadeAnimation(
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: state.productByCategory!.data.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 1,
                        childAspectRatio: 1 / 1.1,
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        return ProductsItems(
                          product: state.productByCategory!.data[index],
                        );
                      },
                    ),
                  ),
                )
            },
          ],
        );
      },
    );
  }
}
