class AppPaths {
  AppPaths._();

  static const String splash = '/';
  static const String onboarding = '/onboarding';
  static const String login = '/login';
  static const String mainNavigation = '/main-navigation';
  static const String products = '/products';
  static const String productDetail = '/product/:id';
  static const String reminder = '/reminder';
  static const String filmDetail = '/film-detail/:id';
  static const String buyTicket = '/buy-ticket/:id';
  static const String seatSelect = '/seat-select';
  static const String ticketDetail = '/ticket-detail/:id';
  static const String terms = '/terms';
  static const String faq = '/faq';
  static const String aboutApp = '/about-app';

  static String productDetailWithId(int id) => '/product/$id';
  static String filmDetailWithId(int id) => '/film-detail/$id';
  static String buyTicketWithId(int id) => '/buy-ticket/$id';
  static String ticketDetailWithId(String id) => '/ticket-detail/$id';
}
