import 'package:alnawadi/src/core/resources/app_strings.dart';
import 'package:alnawadi/src/core/resources/routes_manager.dart';
import 'package:alnawadi/src/core/widget/list_view_horizontal.dart';
import 'package:alnawadi/src/core/widget/see_more_widget.dart';
import 'package:alnawadi/src/features/home/presentation/screen/widget/product_items.dart';
import 'package:alnawadi/src/features/products/presentation/controller/products_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class LatestProducts extends StatelessWidget {
  const LatestProducts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<ProductBloc>().state.allProducts;

    return Column(
      children: [
        SeeMoreWidget(
          title: AppStrings.the_latest_results.tr(),
          onPressed: () => context.pushNamed(Routes.latestProduct),
        ),
        ListViewHorizontal(
          height: 220.h,
          count: bloc!.data.length,
          itemBuilder: (context, index) {
            return ProductsItems(
              product: bloc.data[index],
            );
          },
        ),
      ],
    );
  }
}
