part of services;

final sl = GetIt.instance;

class ServicesLocator {
  Future<void> init() async {
    /// app prefs

    final sharedPrefs = await SharedPreferences.getInstance();

    sl.registerFactory<SharedPreferences>(() => sharedPrefs);

    sl.registerLazySingleton<AppPreferences>(() => AppPreferences(sl()));

    /// Dio
    sl.registerLazySingleton<Dio>(() => Dio());

    sl.registerLazySingleton(
      () => PrettyDioLogger(
        request: false,
        responseBody: false,
        requestBody: false,
      ),
    );
    sl.registerLazySingleton(() => AppInterceptors());

    sl.registerLazySingleton<ApiConsumer>(() => DioConsumer(client: sl()));

    /// TODO
    authInjection();
    homeInjection();
    activity();
    product();
    profile();
    cart();
    order();
  }

  void authInjection() {
    sl.registerLazySingleton<AuthBaseRemoteDataSource>(
        () => AuthRemoteDataSourceImpl(sl()));

    sl.registerLazySingleton<BaseAuthRepository>(() => AuthRepository(sl()));

    sl.registerLazySingleton(() => ForgetPasswordUseCase(sl()));
    sl.registerLazySingleton(() => LoginUseCase(sl()));
    sl.registerLazySingleton(() => LogOutUseCase(sl()));
    sl.registerLazySingleton(() => RegisterUseCase(sl()));
    sl.registerLazySingleton(() => ResendCodeUseCase(sl()));
    sl.registerLazySingleton(() => ResetPasswordUseCase(sl()));
    sl.registerLazySingleton(() => VerifyCodeUseCase(sl()));
    sl.registerLazySingleton(() => VerifyEmailUseCase(sl()));

    sl.registerFactory(
        () => AuthBloc(sl(), sl(), sl(), sl(), sl(), sl(), sl(), sl()));
  }

  void homeInjection() {
    sl.registerLazySingleton<HomeBaseRemoteDataSource>(
        () => HomeRemoteDataSourceImpl(sl()));

    sl.registerLazySingleton<BaseHomeRepository>(() => HomeRepository(sl()));

    sl.registerLazySingleton(() => GetBannersUseCase(sl()));
    sl.registerLazySingleton(() => SearchActivityUseCase(sl()));
    sl.registerLazySingleton(() => SearchProductUseCase(sl()));

    sl.registerFactory(() => HomeBloc(sl()));
    sl.registerFactory(() => SearchBloc(sl(), sl()));
  }

  void activity() {
    sl.registerLazySingleton<ActivityBaseRemoteDataSource>(
        () => ActivityRemoteDataSourceImpl(sl()));

    sl.registerLazySingleton<BaseActivityRepository>(
        () => ActivityRepository(sl()));

    sl.registerLazySingleton(() => GetAllActivityUseCase(sl()));
    sl.registerLazySingleton(() => GetActivityByCategoryUseCase(sl()));
    sl.registerLazySingleton(() => GetActivityCategoryUseCase(sl()));
    sl.registerLazySingleton(() => GetSubscribedActivitiesUseCase(sl()));
    sl.registerLazySingleton(() => SubToActivityUseCase(sl()));

    sl.registerFactory(() => ActivityBloc(sl(), sl(), sl(), sl()));
    sl.registerFactory(() => SubscribeActivityBloc(sl()));
  }

  void product() {
    sl.registerLazySingleton<ProductsBaseRemoteDataSource>(
        () => ProductsRemoteDataSourceImpl(sl()));

    sl.registerLazySingleton<BaseProductsRepository>(
        () => ProductsRepository(sl()));

    sl.registerLazySingleton(() => GetAllProductUseCase(sl()));
    sl.registerLazySingleton(() => GetProductByCategoryUseCase(sl()));
    sl.registerLazySingleton(() => GetProductCategoryUseCase(sl()));

    sl.registerFactory(() => ProductBloc(sl(), sl(), sl()));
  }

  void profile() {
    sl.registerLazySingleton<BaseProfileRemoteDataSource>(
        () => ProfileRemoteDataSource(sl()));

    sl.registerLazySingleton<BaseProfileRepository>(
        () => ProfileRepository(sl()));

    sl.registerLazySingleton(() => GetUserDataUseCase(sl()));
    sl.registerLazySingleton(() => LogOutUserUseCase(sl()));
    sl.registerLazySingleton(() => ChangeUserPasswordUseCase(sl()));
    sl.registerLazySingleton(() => UpdateUserDataUseCase(sl()));

    ///address
    sl.registerLazySingleton(() => GetAddressUseCase(sl()));
    sl.registerLazySingleton(() => DeleteAddressUseCase(sl()));
    sl.registerLazySingleton(() => UpdateAddressUseCase(sl()));
    sl.registerLazySingleton(() => AddAddressUseCase(sl()));
    sl.registerLazySingleton(() => ContactUsUseCase(sl()));
    sl.registerLazySingleton(() => GetSettingsUseCase(sl()));
    sl.registerLazySingleton(() => GetPolicyPageUseCase(sl()));
    sl.registerLazySingleton(() => GetPrivacyPolicyUseCase(sl()));
    sl.registerLazySingleton(() => GetStorePolicyUseCase(sl()));
    sl.registerLazySingleton(() => GetTermsPageUseCase(sl()));
    sl.registerLazySingleton(() => GetAboutUsPageUseCase(sl()));
    sl.registerLazySingleton(() => GetNotificationUseCase(sl()));

    sl.registerFactory(() => ProfileBloc(sl(), sl(), sl(), sl(), sl(), sl(),
        sl(), sl(), sl(), sl(), sl(), sl()));
    sl.registerFactory(() => AddressBloc(sl(), sl(), sl(), sl()));
  }

  void cart() {
    sl.registerLazySingleton<BaseCartRemoteDataSource>(
        () => CartRemoteDataSource(sl()));

    sl.registerLazySingleton<BaseCartRepository>(() => CartRepository(sl()));

    sl.registerLazySingleton(() => GetCartItemsUseCase(sl()));
    sl.registerLazySingleton(() => AddProductToCartUseCase(sl()));
    sl.registerLazySingleton(() => ReduceQuantityForProductUseCase(sl()));
    sl.registerLazySingleton(() => RemoveProductFromCartUseCase(sl()));
    sl.registerLazySingleton(() => ClearAllCartItemsUseCase(sl()));
    sl.registerLazySingleton(() => ApplyCouponUseCase(sl()));

    sl.registerFactory(() => CartBloc(sl(), sl(), sl(), sl(), sl(), sl()));
  }

  void order() {
    sl.registerLazySingleton<BaseOrderRemoteDataSource>(
        () => OrderRemoteDataSource(sl()));

    sl.registerLazySingleton<BaseOrderRepository>(() => OrderRepository(sl()));

    sl.registerFactory(() => OrderBloc(sl(), sl()));

    sl.registerLazySingleton(() => GetUserOrderUseCase(sl()));
    sl.registerLazySingleton(() => GetOrderByIdUseCase(sl()));
    sl.registerLazySingleton(() => CancelOrderUseCase(sl()));
    sl.registerLazySingleton(() => CreateOrderUseCase(sl()));

    sl.registerFactory(() => MyOrderBloc(sl(), sl()));
  }
}
