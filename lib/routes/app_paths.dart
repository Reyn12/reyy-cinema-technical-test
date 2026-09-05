class AppPaths {
  AppPaths._();

  static const String splash = '/';
  static const String onboarding = '/onboarding';
  static const String login = '/login';
  static const String mainNavigation = '/main-navigation';
  static const String products = '/products';
  static const String productDetail = '/product/:id';
  static const String reminder = '/reminder';
  static const String terms = '/terms';
  static const String faq = '/faq';
  static const String aboutApp = '/about-app';

  static String productDetailWithId(int id) => '/product/$id';
}
