import 'package:alnawadi/src/core/enums.dart';
import 'package:alnawadi/src/core/hepler.dart';
import 'package:alnawadi/src/core/resources/app_assets.dart';
import 'package:alnawadi/src/core/resources/app_colors.dart';
import 'package:alnawadi/src/core/widget/list_view_horizontal.dart';
import 'package:alnawadi/src/features/products/domain/entity/product_category_entity.dart';
import 'package:alnawadi/src/features/products/presentation/controller/products_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductCatBuilder extends StatelessWidget {
  const ProductCatBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductsState>(


      builder: (context, state) {

        if (state.productCategoriesReqState == ReqState.error ) {
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
        return ListViewHorizontal(
          height: 110.h,
          count: state.productCategory!.data.length + 1,
          itemBuilder: (context, index) {
            if (index == 0) {
              return const ProductCatItemsBuilder(
                categoryEntity: ProductCategoryData(
                  image: '',
                  id: 0,
                  name: 'جميع المنتجات',
                ),
              );
            }
            return ProductCatItemsBuilder(
              categoryEntity: state.productCategory!.data[index - 1],
            );
          },
          separatorBuilder: (context, index) {
            return 15.horizontalSpace;
          },
        );
      },
    );
  }
}

class ProductCatItemsBuilder extends StatelessWidget {
  const ProductCatItemsBuilder({
    super.key,
    required this.categoryEntity,
  });

  final ProductCategoryData categoryEntity;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductsState>(
      builder: (context, state) {
        bool isSelected = state.selectedCategory!.catId == categoryEntity.id;
        final int catId = categoryEntity.id;
        final String catName = categoryEntity.name;
        return InkWell(
          splashColor: Colors.transparent,
          onTap: () {
            onTapCategory(context, catId, catName);
          },
          child: CategoryActivityItems(
            isSelected: isSelected,
            categoryEntity: categoryEntity,
          ),
        );
      },
    );
  }

  void onTapCategory(BuildContext context, int catId, String catName) {
    if (categoryEntity.id != 0) {
      context.read<ProductBloc>().add(GetProductByCatEvent(catId));
    } else {
      context.read<ProductBloc>().add(GetAllProductEvent());
    }
    context.read<ProductBloc>().add(
          UpdateCatProductSelectedEvent(id: catId, name: catName),
        );
  }
}

class CategoryActivityItems extends StatelessWidget {
  const CategoryActivityItems({
    super.key,
    required this.isSelected,
    required this.categoryEntity,
  });

  final bool isSelected;
  final ProductCategoryData categoryEntity;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 400),
      height: 8.h,
      child: Column(
        children: [
          CircleAvatar(
            radius: 30.r,
            backgroundColor:
                isSelected ? AppColors.primary : Colors.transparent,
            child: CircleAvatar(
              radius: 25.r,
              backgroundColor: Colors.yellow.shade50,
              child: categoryEntity.id == 0
                  ? SvgPicture.asset(AppSvg.all)
                  : CircleAvatar(
                      radius: 40,
                      backgroundImage: CachedNetworkImageProvider(
                        categoryEntity.image.toImageUrl,
                      ),
                      //   child:
                    ),
            ),
          ),
          8.verticalSpace,
          Text(
            categoryEntity.name,
            style: Theme.of(context)
                .textTheme
                .titleSmall!
                .copyWith(fontWeight: FontWeight.w300, fontSize: 13.sp),
          ),
        ],
      ),
    );
  }
}
