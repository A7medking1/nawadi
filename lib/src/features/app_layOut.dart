import 'package:alnawadi/src/core/app_prefs/app_prefs.dart';
import 'package:alnawadi/src/core/resources/app_assets.dart';
import 'package:alnawadi/src/core/resources/app_colors.dart';
import 'package:alnawadi/src/core/resources/app_strings.dart';
import 'package:alnawadi/src/core/services/index.dart';
import 'package:alnawadi/src/features/activities/presentation/screen/activity_screen.dart';
import 'package:alnawadi/src/features/cart/presentation/screen/cart_screens.dart';
import 'package:alnawadi/src/features/home/presentation/screen/home.dart';
import 'package:alnawadi/src/features/home/presentation/screen/widget/alert_dialog.dart';
import 'package:alnawadi/src/features/products/presentation/screen/products_screen.dart';
import 'package:alnawadi/src/features/profile/screens/profile_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

List<Widget> screens = [
  const HomeScreen(),
  const ActivityScreen(),
  const ProductsScreen(),
  const ProfileScreen(),
];

class AppLayOut extends StatefulWidget {
  const AppLayOut({Key? key}) : super(key: key);

  @override
  State<AppLayOut> createState() => _AppLayOutState();
}

class _AppLayOutState extends State<AppLayOut>
    with SingleTickerProviderStateMixin {
  late TabController? tabController;

  bool isCartScreen = false;

  void change() {
    isCartScreen = true;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: !isCartScreen
          ? TabBarView(
              physics: const NeverScrollableScrollPhysics(),
              controller: tabController,
              children: screens,
            )
          : const CartScreen(),
      backgroundColor: Colors.white,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: floatingCart(),
      bottomNavigationBar: Container(
        color: Colors.transparent,
        child: BottomAppBar(
          clipBehavior: Clip.antiAlias,
          notchMargin: 0.0,
          shape: const CircularNotchedRectangle(),
          child: TabBar(
            isScrollable: false,
            controller: tabController,
            labelStyle: Theme.of(context)
                .textTheme
                .titleSmall!
                .copyWith(fontSize: 12.sp),
            labelColor: isCartScreen ? Colors.black : AppColors.primary,
            onTap: (index) {
              isCartScreen = false;
              setState(() {});
            },
            tabs: [
              Tab(
                text: AppStrings.home.tr(),
                icon: buildSvgIcon(0, AppSvg.home),
              ),
              Tab(
                text: AppStrings.activity.tr(),
                //     icon: const Icon(Icons.area_chart),
                icon: buildSvgIcon(1, AppSvg.activity),
              ),
              Tab(
                text: AppStrings.products.tr(),
                icon: buildSvgIcon(2, AppSvg.product),
              ),
              Tab(
                text: AppStrings.profile.tr(),
                icon: buildSvgIcon(3, AppSvg.profile),
              ),
            ],
          ),
        ),
      ),
    );
  }

  SvgPicture buildSvgIcon(int index, String icon) {
    return SvgPicture.asset(
      icon,
      color: tabController?.index == index && !isCartScreen
          ? AppColors.primary
          : AppColors.black,
    );
  }

  Widget floatingCart() => Padding(
        padding: const EdgeInsets.all(5.0),
        child: FloatingActionButton(
          mini: true,
          shape: const CircleBorder(),
          onPressed: () {
            final bool isUserSkipLogin = sl<AppPreferences>().isSkipLogin();

            if (!isUserSkipLogin) {
              change();
            } else {
              showAlertForSkipSignIn(context);
            }
          },
          backgroundColor: const Color(0xFF595BB5),
          child: const Icon(
            Icons.shopping_cart_outlined,
            color: Colors.white,
          ),
        ),
      );
}
