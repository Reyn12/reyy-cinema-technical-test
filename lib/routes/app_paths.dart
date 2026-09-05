class AppPaths {
  AppPaths._();

  static const String splash = '/';
  static const String login = '/login';
  static const String mainNavigation = '/main-navigation';
  static const String products = '/products';
  static const String productDetail = '/product/:id';
  static const String notification = '/notification';

  static String productDetailWithId(int id) => '/product/$id';
}
