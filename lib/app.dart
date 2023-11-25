import 'package:alnawadi/src/core/app_prefs/app_prefs.dart';
import 'package:alnawadi/src/core/resources/routes_manager.dart';
import 'package:alnawadi/src/core/resources/theme/app_dark_theme.dart';
import 'package:alnawadi/src/core/resources/theme/app_light_theme.dart';
import 'package:alnawadi/src/core/services/index.dart';
import 'package:alnawadi/src/features/activities/presentation/controller/activity_bloc.dart';
import 'package:alnawadi/src/features/cart/presentation/controller/cart_bloc.dart';
import 'package:alnawadi/src/features/home/presentation/controller/home_bloc.dart';
import 'package:alnawadi/src/features/products/presentation/controller/products_bloc.dart';
import 'package:alnawadi/src/features/profile/controller/address/address_bloc.dart';
import 'package:alnawadi/src/features/profile/controller/my_order/my_order_bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AppPreferences _appPreferences = sl<AppPreferences>();

  final Connectivity connectivity = Connectivity();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    /*   connectivity.onConnectivityChanged.listen((event) {
      print(event.name);
    });*/
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    _appPreferences.getLocal().then((local) {
      return context.setLocale(local);
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(context) {
    print(sl<AppPreferences>().getUserToken());
    return ScreenUtilInit(
      designSize: const Size(414, 896),
      minTextAdapt: true,
      builder: (context, Widget? child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
                create: (_) => sl<ProductBloc>()
                  ..add(GetAllProductEvent())
                  ..add(GetProductCategoriesEvent())
                  ..add(const UpdateCatProductSelectedEvent(
                      id: 0, name: 'جميع المنتجات'))),
            BlocProvider(
              create: (_) => sl<HomeBloc>()..add(GetBannersEvent()),
            ),
            BlocProvider(
              create: (_) => sl<CartBloc>(),
            ),
            BlocProvider(
              create: (_) => sl<MyOrderBloc>(),
            ),
            BlocProvider(
              create: (_) => sl<AddressBloc>()..add(GetAddressFromPrefs()),
            ),
            BlocProvider(
              create: (_) => sl<ActivityBloc>()
                ..add(GetAllActivityEvent())
                ..add(GetCompaniesEvent())
                ..add(
                    const UpdateCatSelectedEvent(id: 0, name: 'جيمع النوادي')),
            ),
          ],
          child: MaterialApp.router(
            debugShowCheckedModeBanner: false,
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            theme: getAppTheme(),
            themeMode: ThemeMode.light,
            darkTheme: getAppDarkTheme(),
            routerConfig: AppRouter.router,
          ),
        );
      },
    );
  }
}
