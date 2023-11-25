import 'package:alnawadi/src/features/activities/domain/entity/activity_entity.dart';
import 'package:alnawadi/src/features/app_layOut.dart';
import 'package:alnawadi/src/features/auth/presentation/screens/forget_password/forget_password_screen.dart';
import 'package:alnawadi/src/features/auth/presentation/screens/forget_password/verify_otp/reset_pass_otp.dart';
import 'package:alnawadi/src/features/auth/presentation/screens/reset_password_screen/reset_password_screen.dart';
import 'package:alnawadi/src/features/auth/presentation/screens/sign_in/sign_in_screen.dart';
import 'package:alnawadi/src/features/auth/presentation/screens/sign_up/sign_up_screen.dart';
import 'package:alnawadi/src/features/auth/presentation/screens/verify_otp/verify_code_screen.dart';
import 'package:alnawadi/src/features/cart/domain/entity/cart_entity.dart';
import 'package:alnawadi/src/features/home/presentation/screen/latest_activity_screen.dart';
import 'package:alnawadi/src/features/home/presentation/screen/latest_product_screen.dart';
import 'package:alnawadi/src/features/home/presentation/screen/search_screen/search_screen.dart';
import 'package:alnawadi/src/features/home/presentation/screen/subscription-activities/subscription-activities.dart';
import 'package:alnawadi/src/features/home/presentation/screen/subscription-activities/success_subscribe_screen.dart';
import 'package:alnawadi/src/features/on_boarding/presentation/on_boarding_screen.dart';
import 'package:alnawadi/src/features/order/presentation/payment.dart';
import 'package:alnawadi/src/features/order/presentation/screen/create_order_screen.dart';
import 'package:alnawadi/src/features/order/presentation/screen/success_order_pay_screen.dart';
import 'package:alnawadi/src/features/profile/screens/about_app/about_app_screen.dart';
import 'package:alnawadi/src/features/profile/screens/contact_us/contact_us_screen.dart';
import 'package:alnawadi/src/features/profile/screens/my_activity/my_activity_screen.dart';
import 'package:alnawadi/src/features/profile/screens/my_locations/add_locations_screen.dart';
import 'package:alnawadi/src/features/profile/screens/my_locations/my_locations_screen.dart';
import 'package:alnawadi/src/features/profile/screens/my_order/my_order_screen.dart';
import 'package:alnawadi/src/features/profile/screens/notifications/notifications_screen.dart';
import 'package:alnawadi/src/features/profile/screens/personal_info_screen/personal_info_screen.dart';
import 'package:alnawadi/src/features/profile/screens/personal_info_screen/widget/change_pass_screen.dart';
import 'package:alnawadi/src/features/profile/screens/privecy_policy/privecy_policy.dart';
import 'package:alnawadi/src/features/splash/splash.dart';
import 'package:go_router/go_router.dart';

class Routes {
  Routes._();

  static const splash = '/';
  static const onBoarding = 'onBoarding';
  static const signIn = 'signIn';
  static const signUp = 'signUp';
  static const verifyCode = 'verifyCode';
  static const forgetPassword = 'forgetPassword';
  static const resetPassword = 'resetPassword';
  static const resetPassOtpScreen = 'ResetPassOtpScreen';
  static const home = 'home';
  static const latestActivity = 'latestActivity';
  static const latestProduct = 'latestProduct';
  static const subscriptionActivities = 'subscriptionActivities';
  static const successSubscribeScreen = 'successSubscribeScreen';
  static const personalInfo = 'personalInfo';
  static const myActivity = 'myActivity';
  static const myOrder = 'myOrder';
  static const notifications = 'notifications';
  static const contactUs = 'contactUs';
  static const aboutApp = 'aboutApp';
  static const myLocations = 'myLocations';
  static const createOrder = 'createOrder';
  static const addLocations = 'addLocations';
  static const successPayOrder = 'successPayOrder';
  static const changePass = 'changePass';
  static const privacyPolicy = 'privacyPolicy';
  static const search = 'search';
  static const pay = 'pay';
}

class _RouterPath {
  _RouterPath._();

  static const splash = '/';
  static const onBoarding = '/onBoarding';
  static const signIn = '/signIn';
  static const signUp = '/signUp';
  static const verifyCode = '/verifyCode';
  static const forgetPassword = '/forgetPassword';
  static const resetPassword = '/resetPassword';
  static const resetPassOtpScreen = '/ResetPassOtpScreen';
  static const home = '/home';
  static const latestActivity = '/latestActivity';
  static const latestProduct = '/latestProduct';
  static const subscriptionActivities = '/subscriptionActivities';
  static const successSubscribeScreen = '/successSubscribeScreen';
  static const personalInfo = '/personalInfo';
  static const myActivity = '/myActivity';
  static const myOrder = '/myOrder';
  static const notifications = '/notifications';
  static const contactUs = '/contactUs';
  static const aboutApp = '/aboutApp';
  static const myLocations = '/myLocations';
  static const addLocations = '/addLocations';
  static const createOrder = '/createOrder';
  static const successPayOrder = '/successPayOrder';
  static const changePass = '/changePass';
  static const privacyPolicy = '/privacyPolicy';
  static const search = '/search';
  static const pay = '/pay';
}

class AppRouter {
  static GoRouter router = GoRouter(
    routes: [
      GoRoute(
        name: Routes.splash,
        path: _RouterPath.splash,
        builder: (_, state) => const SplashScreen(),
      ),
      GoRoute(
        name: Routes.onBoarding,
        path: _RouterPath.onBoarding,
        builder: (_, state) => const OnBoardingScreen(),
      ),
      GoRoute(
        name: Routes.signIn,
        path: _RouterPath.signIn,
        builder: (_, state) => SignInScreen(),
      ),
      GoRoute(
        name: Routes.signUp,
        path: _RouterPath.signUp,
        builder: (_, state) => const SignUpScreen(),
      ),
      GoRoute(
        name: Routes.verifyCode,
        path: _RouterPath.verifyCode,
        builder: (_, state) => VerifyCodeScreen(
          email: state.queryParameters['email']!,
          isEmailVerified: state.queryParameters['isEmailVerify']!,
        ),
      ),
      GoRoute(
        name: Routes.forgetPassword,
        path: _RouterPath.forgetPassword,
        builder: (_, state) => const ForgetPasswordScreen(),
      ),
      GoRoute(
        name: Routes.resetPassword,
        path: _RouterPath.resetPassword,
        builder: (_, state) => const ResetPasswordScreen(),
      ),
      GoRoute(
        name: Routes.home,
        path: _RouterPath.home,
        builder: (_, state) => const AppLayOut(),
      ),
      GoRoute(
        name: Routes.resetPassOtpScreen,
        path: _RouterPath.resetPassOtpScreen,
        builder: (_, state) => ResetPassOtpScreen(
          email: state.queryParameters['email']!,
        ),
      ),
      GoRoute(
        name: Routes.latestActivity,
        path: _RouterPath.latestActivity,
        builder: (_, state) => const LatestActivityScreen(),
      ),
      GoRoute(
        name: Routes.latestProduct,
        path: _RouterPath.latestProduct,
        builder: (_, state) => const LatestProductScreen(),
      ),
      GoRoute(
        name: Routes.subscriptionActivities,
        path: _RouterPath.subscriptionActivities,
        builder: (_, state) => SubscriptionActivities(
          activityData: state.extra as ActivityData,
        ),
      ),
      GoRoute(
        name: Routes.successSubscribeScreen,
        path: _RouterPath.successSubscribeScreen,
        builder: (_, state) => const SuccessSubscribeScreen(),
      ),
      GoRoute(
        name: Routes.personalInfo,
        path: _RouterPath.personalInfo,
        builder: (_, state) => const PersonalInfoScreen(),
      ),
      GoRoute(
        name: Routes.myActivity,
        path: _RouterPath.myActivity,
        builder: (_, state) => const MyActivityScreen(),
      ),
      GoRoute(
        name: Routes.myOrder,
        path: _RouterPath.myOrder,
        builder: (_, state) => const MyOrderScreen(),
      ),
      GoRoute(
        name: Routes.notifications,
        path: _RouterPath.notifications,
        builder: (_, state) => const NotificationsScreen(),
      ),
      GoRoute(
        name: Routes.contactUs,
        path: _RouterPath.contactUs,
        builder: (_, state) => const ContactUsScreen(),
      ),
      GoRoute(
        name: Routes.aboutApp,
        path: _RouterPath.aboutApp,
        builder: (_, state) => const AboutAppScreen(),
      ),
      GoRoute(
        name: Routes.myLocations,
        path: _RouterPath.myLocations,
        builder: (_, state) => const MyLocationsScreen(),
      ),
      GoRoute(
        name: Routes.createOrder,
        path: _RouterPath.createOrder,
        builder: (_, state) => CreateOrderScreen(
          pricesEntity: state.extra as CartPricesEntity,
          couponCode: state.queryParameters['coupon']!,
        ),
      ),
      GoRoute(
        name: Routes.addLocations,
        path: _RouterPath.addLocations,
        builder: (_, state) => const AddLocationsScreen(),
      ),
      GoRoute(
        name: Routes.pay,
        path: _RouterPath.pay,
        builder: (_, state) => PaymentWeb(content: state.extra as String),
      ),
      GoRoute(
        name: Routes.successPayOrder,
        path: _RouterPath.successPayOrder,
        builder: (_, state) => const SuccessOrderPayScreen(),
      ),
      GoRoute(
        name: Routes.changePass,
        path: _RouterPath.changePass,
        builder: (_, state) => const ChangePassScreen(),
      ),
      GoRoute(
        name: Routes.privacyPolicy,
        path: _RouterPath.privacyPolicy,
        builder: (_, state) => const PrivacyPolicyScreen(),
      ),
      GoRoute(
        name: Routes.search,
        path: _RouterPath.search,
        builder: (_, state) => const SearchScreen(),
      ),
    ],
  );
}
