import 'package:alnawadi/src/core/app_prefs/app_prefs.dart';
import 'package:alnawadi/src/core/enums.dart';
import 'package:alnawadi/src/core/hepler.dart';
import 'package:alnawadi/src/core/resources/app_assets.dart';
import 'package:alnawadi/src/core/resources/app_colors.dart';
import 'package:alnawadi/src/core/resources/app_strings.dart';
import 'package:alnawadi/src/core/resources/routes_manager.dart';
import 'package:alnawadi/src/core/resources/style.dart';
import 'package:alnawadi/src/core/services/index.dart';
import 'package:alnawadi/src/core/widget/alert_dialog.dart';
import 'package:alnawadi/src/core/widget/cached_image_network.dart';
import 'package:alnawadi/src/core/widget/circle_tab_indicator.dart';
import 'package:alnawadi/src/core/widget/custom_loading.dart';
import 'package:alnawadi/src/core/widget/custom_text_formField.dart';
import 'package:alnawadi/src/features/cart/presentation/controller/cart_bloc.dart';
import 'package:alnawadi/src/features/home/domain/entity/search_entity.dart';
import 'package:alnawadi/src/features/home/presentation/controller/search/search_bloc.dart';
import 'package:alnawadi/src/features/home/presentation/screen/widget/activity_items.dart';
import 'package:alnawadi/src/features/home/presentation/screen/widget/alert_dialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  // AppStrings.search_for_products_and_activities.tr()
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<SearchBloc>(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            AppStrings.search_for_products_and_activities.tr(),
            style: TextStyle(color: Colors.black.withOpacity(0.5)),
          ),
        ),
        body: const Body(),
      ),
    );
  }
}

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> with SingleTickerProviderStateMixin {
  late TabController? tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          controller: tabController,
          unselectedLabelColor: Colors.grey,
          labelColor: AppColors.black,
          labelStyle: Theme.of(context).textTheme.titleSmall,
          indicator: CircleTabIndicator(color: AppColors.primary, radius: 5),
          tabs: const [
            Tab(
              text: 'الانشطة',
            ),
            Tab(
              text: 'المنتجات',
            ),
          ],
        ),
        Expanded(
          child: TabBarView(
            controller: tabController,
            children: const [
              ActivitySearchTab(),
              ProductSearchTab(),
            ],
          ),
        ),
      ],
    );
  }
}

class ProductSearchTab extends StatelessWidget {
  const ProductSearchTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<SearchBloc>();

    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              CustomTextFormField(
                hintText: AppStrings.search_for_products_and_activities.tr(),
                prefixIcon: const Icon(Icons.search),
                controller: bloc.query,
                suffixIcon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary),
                    onPressed: () {
                      bloc.add(SearchProductsEvent());
                    },
                    child: const Text('بحث'),
                  ),
                ),
                title: '',
              ),
              if (state.productState == ReqState.loading) ...[
                10.verticalSpace,
                const LinearProgressIndicator(),
              ],
              BlocBuilder<SearchBloc, SearchState>(
                builder: (context, state) {
                  return switch (state.productState) {
                    ReqState.loading => Container(),
                    ReqState.error => Text(state.message),
                    ReqState.empty => Text(state.message),
                    ReqState.success => Expanded(
                        child: FadeAnimation(
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: GridView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: state.searchProducts.length,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 1,
                                childAspectRatio: 1 / 1.1,
                              ),
                              itemBuilder: (BuildContext context, int index) {
                                return ProductsSearchItems(
                                  product: state.searchProducts[index],
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                  };
                },
              ),
            ],
          ),
        );
      },
    );
  }
}

class ActivitySearchTab extends StatelessWidget {
  const ActivitySearchTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<SearchBloc>();
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              CustomTextFormField(
                hintText: AppStrings.search_for_products_and_activities.tr(),
                controller: bloc.query,
                prefixIcon: const Icon(Icons.search),
                suffixIcon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary),
                    onPressed: () {
                      bloc.add(SearchActivityEvent());
                    },
                    child: const Text('بحث'),
                  ),
                ),
                title: '',
              ),
              if (state.activityState == ReqState.loading) ...[
                10.verticalSpace,
                const LinearProgressIndicator(),
              ],
              Expanded(
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: state.searchActivity.length,
                  itemBuilder: (context, index) {
                    return ActivitySearchItems(
                      activity: state.searchActivity[index],
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class ActivitySearchItems extends StatelessWidget {
  const ActivitySearchItems({
    super.key,
    required this.activity,
  });

  final SearchEntity activity;

  @override
  Widget build(BuildContext context) {
    return FadeAnimation(
      child: Card(
        shape: buildRoundedRectangleBorder(20),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            //  color: Colors.black,
            borderRadius: BorderRadiusDirectional.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: ClipRRect(
                    borderRadius: BorderRadiusDirectional.circular(15),
                    child: CachedImages(
                      imageUrl: activity.image.toImageUrl,
                      fit: BoxFit.cover,
                      height: 170.h,
                    ),
                  ),
                ),
                15.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      activity.name,
                      style: getRegularStyle(),
                    ),
                    Text(
                      '\$ ${activity.price}',
                      style: getSemiBoldStyle(color: AppColors.primary),
                    ),
                  ],
                ),
                10.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.location_on,
                          color: AppColors.primary,
                        ),
                      ],
                    ),
                    RegisterToActivityButton(
                      onTap: () {
                        final bool isUserSkipLogin =
                            sl<AppPreferences>().isSkipLogin();
                        if (!isUserSkipLogin) {
                          context.pushNamed(Routes.subscriptionActivities,
                              extra: activity);
                        } else {
                          showAlertForSkipSignIn(context);
                        }
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProductsSearchItems extends StatelessWidget {
  final SearchEntity product;

  const ProductsSearchItems({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartBloc, CartState>(
      buildWhen: (prev, curr) =>
          prev.addProductToCartReqState != curr.addProductToCartReqState,
      listener: (context, state) {
        if (state.addProductToCartReqState == ReqState.loading) {
          OverlayLoadingProgress.start(context);
        }
        if (state.addProductToCartReqState == ReqState.success) {
          OverlayLoadingProgress.stop();
          //showToast(msg: 'Added To Cart', state: ToastStates.SUCCESS);
        }
      },
      builder: (context, state) {
        return FittedBox(
          child: Card(
            shape: OutlineInputBorder(
              borderRadius: BorderRadius.circular(17.r),
              borderSide: BorderSide(
                color: AppColors.grey.withOpacity(0.3),
              ),
            ),
            elevation: 0,
            child: Container(
              width: 220.w,
              // color: AppColors.redWIthOp,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(
                        17.r,
                      ),
                      topLeft: Radius.circular(
                        17.r,
                      ),
                    ),
                    child: SizedBox(
                      width: double.infinity,
                      // child: Image.asset(
                      //   AppImages.product,
                      //   fit: BoxFit.cover,
                      //   height: 120,
                      // ),
                      child: CachedImages(
                        height: 160.h,
                        imageUrl: product.image.toImageUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsetsDirectional.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                product.name,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(fontWeight: FontWeight.w300),
                              ),
                            ),
                            Text(
                              '\$${product.price}',
                              style: getSemiBoldStyle(
                                  color: AppColors.primary, fontSize: 13),
                            ),
                          ],
                        ),
                        10.verticalSpace,
/*
                    Text(
                      'مشروبات غازية',
                      style: getLightStyle(color: AppColors.grey),
                    ),
*/
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
/*
                            Row(
                              children: [
                                DiscountContainer(
                                  title: 'خصم %20',
                                  fontColor: const Color(0xFFF59A24),
                                  color: Colors.red.withOpacity(0.3),
                                ),
                                DiscountContainer(
                                  title: '4.8',
                                  fontColor: const Color(0xFFF59A24),
                                  iconData: Icons.star,
                                  color: AppColors.yellowDark.withOpacity(0.3),
                                ),
                              ],
                            ),
*/
                            InkWell(
                              onTap: () {
                                final bool isUserSkipLogin =
                                    sl<AppPreferences>().isSkipLogin();
                                if (!isUserSkipLogin) {
                                  showAlertDialog(
                                    context: context,
                                    onTapYes: () {
                                      context.pop();
                                      context.read<CartBloc>().add(
                                            AddProductToCartEvent(
                                              productId: product.id,
                                              quantity: 1,
                                            ),
                                          );
                                    },
                                    title: AppStrings
                                        .are_you_sure_you_want_to_add_it_to_the_cart
                                        .tr(),
                                    icon: AppSvg.verify,
                                  );
                                } else {
                                  showAlertForSkipSignIn(context);
                                }
                              },
                              child: const CircleAvatar(
                                radius: 15,
                                backgroundColor: AppColors.primary,
                                child: Icon(
                                  Icons.shopping_cart,
                                  color: AppColors.white,
                                  size: 15,
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
