import 'package:go_router/go_router.dart';
import 'package:reyy_cinema/features/main_navigation/pages/main_navigation_page.dart';
import 'package:reyy_cinema/features/notification/pages/notification_page.dart';
import 'package:reyy_cinema/features/splash/pages/splash_page.dart';
import 'package:reyy_cinema/routes/cupertino_page.dart';

import '../features/auth/pages/login_page.dart';
import '../features/products/pages/product_detail_page.dart';
import '../features/products/pages/products_page.dart';
import 'app_paths.dart';

final appRouter = GoRouter(
  initialLocation: AppPaths.splash,
  routes: [
    GoRoute(
      path: AppPaths.splash,
      pageBuilder: (context, state) => buildCupertinoPage(
        key: state.pageKey,
        child: const SplashPage(),
      ),
    ),
    GoRoute(
      path: AppPaths.products,
      pageBuilder: (context, state) => buildCupertinoPage(
        key: state.pageKey,
        child: const ProductsPage(),
      ),
    ),
    GoRoute(
      path: AppPaths.productDetail,
      pageBuilder: (context, state) => buildCupertinoPage(
        key: state.pageKey,
        child: ProductDetailPage(
          id: int.parse(state.pathParameters['id']!),
        ),
      ),
    ),
    GoRoute(
      path: AppPaths.login,
      pageBuilder: (context, state) => buildCupertinoPage(
        key: state.pageKey,
        child: const LoginPage(),
      ),
    ),
    GoRoute(
      path: AppPaths.mainNavigation,
      pageBuilder: (context, state) => buildCupertinoPage(
        key: state.pageKey,
        child: const MainNavigationPage(),
      ),
    ),
    GoRoute(
      path: AppPaths.notification,
      pageBuilder: (context, state) => buildCupertinoPage(
        key: state.pageKey,
        child: const NotificationPage(),
      ),
    ),
  ],
);
