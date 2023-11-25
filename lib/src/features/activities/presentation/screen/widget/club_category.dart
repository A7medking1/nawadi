import 'package:alnawadi/src/core/enums.dart';
import 'package:alnawadi/src/core/hepler.dart';
import 'package:alnawadi/src/core/resources/app_assets.dart';
import 'package:alnawadi/src/core/resources/app_colors.dart';
import 'package:alnawadi/src/core/widget/list_view_horizontal.dart';
import 'package:alnawadi/src/features/activities/domain/entity/company_entity.dart';
import 'package:alnawadi/src/features/activities/presentation/controller/activity_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ClubsBuilder extends StatelessWidget {
  const ClubsBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ActivityBloc, ActivityState>(
      builder: (context, state) {
        if (state.companyReqState == ReqState.error) {
          return Align(
            alignment: AlignmentDirectional.center,
            child: Text(
              state.message,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          );
        }
        return ListViewHorizontal(
          height: 110.h,
          count: state.company!.data.length + 1,
          itemBuilder: (context, index) {
            if (index == 0) {
              return const ClubItemsBuilder(
                categoryEntity: CompaniesData(
                  image: '',
                  id: 0,
                  name: 'جيمع النوادي',
                ),
              );
            }
            return ClubItemsBuilder(
              categoryEntity: state.company!.data[index - 1],
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

class ClubItemsBuilder extends StatelessWidget {
  const ClubItemsBuilder({
    super.key,
    required this.categoryEntity,
  });

  final CompaniesData? categoryEntity;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ActivityBloc, ActivityState>(
      builder: (context, state) {
        bool isSelected = state.selectedCategory.catId == categoryEntity!.id;
        final int catId = categoryEntity!.id;
        final String catName = categoryEntity!.name;
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
    if (categoryEntity!.id != 0) {
      context.read<ActivityBloc>().add(GetActivityByCompanyEvent(catId));
    } else {
      context.read<ActivityBloc>().add(GetAllActivityEvent());
    }
    context.read<ActivityBloc>().add(
          UpdateCatSelectedEvent(id: catId, name: catName),
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
  final CompaniesData? categoryEntity;

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
              child: categoryEntity!.id == 0
                  ? SvgPicture.asset(AppSvg.all)
                  : CircleAvatar(
                      radius: 40,
                      backgroundImage: CachedNetworkImageProvider(
                        categoryEntity!.image.toImageUrl,
                      ),
                      //   child:
                    ),
            ),
          ),
          8.verticalSpace,
          Text(
            categoryEntity!.name,
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

/* Container(
            decoration: BoxDecoration(
              color: isSelected ? AppColors.primary : Colors.transparent,
              borderRadius: BorderRadiusDirectional.circular(100.r),
            ),
            child: Card(
              shape: buildRoundedRectangleBorder(100),
              child: Container(
                width: 50.w,
                height: 50.h,
                decoration: BoxDecoration(
                  color: Colors.yellow.shade50,
                  borderRadius: BorderRadiusDirectional.circular(50.r),
                ),
                child: SvgPicture.asset(
                  AppSvg.all,
                  height: 10,
                  width: 10,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),*/
