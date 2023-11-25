class ApiConstant {
  static const String _baseUrl =
      'https://wealthest22.com/elnawadi_backend/public/api';

  static const String _baseImageUrl =
      'https://wealthest22.com/elnawadi_backend/public';

  static String imagePath(String path) => '$_baseImageUrl/$path';

  /// auth
  static const String register = '$_baseUrl/register';
  static const String login = '$_baseUrl/login';
  static const String verifyEmail = '$_baseUrl/verify-email';
  static const String logout = '$_baseUrl/logout';
  static const String forgotPassword = '$_baseUrl/forgot-password';
  static const String resendCode = '$_baseUrl/verification-notification';
  static const String resetPassword = '$_baseUrl/reset-password';
  static const String verifyCode = '$_baseUrl/verify-code';

  /// home

  static const String banners = '$_baseUrl/banners';
  static const String searchActivities = '$_baseUrl/search-activities';
  static const String searchProduct = '$_baseUrl/search-product';

  /// activity
  static String subToActivity = '$_baseUrl/subscriptions/store';

  static String companies(int page) => '$_baseUrl/companies?page=$page';

  static String activities(int page) => '$_baseUrl/activities?page=$page';

  static String activityByCompany(int page, int compId) =>
      '$_baseUrl/companies/activities?page=$page&company_id=$compId';

  static String subscribedActivity(int page) =>
      '$_baseUrl/subscriptions/user?page=$page';

  /// product

  static String products(int page) => '$_baseUrl/products?page=$page';

  static String productByCategory(int page, int catId) =>
      '$_baseUrl/categories/$catId/products?page=$page';

  static String productCategories(int page) =>
      '$_baseUrl/categories?page=$page';

  /// profile

  static const String userProfile = '$_baseUrl/userInformation';
  static const String changePassword = '$_baseUrl/changePassword';
  static const String updateUserInfo = '$_baseUrl/updateUserInfo';
  static const String contactUs = '$_baseUrl/contact';
  static const String getStorePolicy = '$_baseUrl/store-policy';
  static const String getPolicyPage = '$_baseUrl/return-policy';
  static const String getPrivacyPolicy = '$_baseUrl/privacy';
  static const String getAboutUsPage = '$_baseUrl/about';
  static const String getTermsPage = '$_baseUrl/terms';
  static const String getSettings = '$_baseUrl/settings';

  /// cart

  static String addToCart(int productId, int quantity) =>
      '$_baseUrl/cart/add?product_id=$productId&quantity=$quantity';

  static String reduceQuantity(int cartId) =>
      '$_baseUrl/cart/reduce?cart_id=$cartId';

  static String removeProductFromCart(int cartId) =>
      '$_baseUrl/cart/remove?cart_id=$cartId';

  static const String clearAllCartItems = '$_baseUrl/cart/clear';

  static const String cartItems = '$_baseUrl/cart/items';

  static String applyCoupons(String couponCode) =>
      '$_baseUrl/cart/applycoupon?coupon_code=$couponCode';

  /// address

  static const String getUserAddress = '$_baseUrl/user-addresses';

  static String deleteAddress(int addressId) =>
      '$_baseUrl/user-addresses/destroy/$addressId';

  static const String updateAddress = '$_baseUrl/user-addresses/update';

  static const String addAddress = '$_baseUrl/user-addresses/store';

  /// order

  static const String getUserOrders = '$_baseUrl/orders';

  static const String createOrder = '$_baseUrl/orders/create';
  static const String cancelOrder = '$_baseUrl/orders/cancel';

  static String orderDetails(int orderId) =>
      '$_baseUrl/orders/detalis/$orderId';

  static const String notification = '$_baseUrl/notifications';
  static const String notificationMarkAsRead =
      '$_baseUrl/notifications/mark-all-read';
  static const String notificationUnreadCount =
      '$_baseUrl/notifications/unread';
}
