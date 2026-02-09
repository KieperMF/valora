import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:valora/core/middlewares/auth_middleware.dart';
import 'package:valora/core/routes/routes_name.dart';
import 'package:valora/feature/auth/presentation/controller/auth_controller.dart';
import 'package:valora/feature/auth/presentation/page/login_page.dart';
import 'package:valora/feature/auth/presentation/page/sign_up_page.dart';
import 'package:valora/feature/customer/presentation/controllers/customer_controller.dart';
import 'package:valora/feature/customer/presentation/pages/customer_register_page.dart';
import 'package:valora/feature/home/presentation/controllers/home_controller.dart';
import 'package:valora/feature/home/presentation/pages/home_navigation.dart';
import 'package:valora/feature/products/presentation/controllers/product_controller.dart';
import 'package:valora/feature/products/presentation/pages/product_register_page.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final authNotifier = AuthNotifier(Supabase.instance.client);
final productController = ProductController();
final homeController = HomeController();
final customerController = CustomerController();

final router = GoRouter(
  initialLocation: RoutesName.home,
  refreshListenable: authNotifier,

  redirect: (context, state) {
    debugPrint('redirect');
    final isLoggedIn = authNotifier.isLoggedIn;
    final isLoginRoute = state.fullPath == RoutesName.login;
    if (isLoggedIn && isLoginRoute) {
      return RoutesName.home;
    }

    if (state.fullPath == RoutesName.signup) {
      return RoutesName.signup;
    }

    if (!isLoggedIn && !isLoginRoute) {
      return RoutesName.login;
    }

    return null;
  },

  routes: [
    GoRoute(
      path: RoutesName.home,
      builder: (context, state) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider.value(value: homeController),
            ChangeNotifierProvider(create: (context) => ProductController()),
            ChangeNotifierProvider(create: (context) => CustomerController()),
          ],
          child: const HomeNavigation(),
        );
      },
    ),
    GoRoute(
      path: RoutesName.login,
      builder: (context, state) => ChangeNotifierProvider(
        create: (context) => AuthController(),
        child: LoginPage(),
      ),
    ),
    GoRoute(
      path: RoutesName.signup,
      builder: (context, state) => ChangeNotifierProvider(
        create: (context) => AuthController(),
        child: SignUpPage(),
      ),
    ),

    GoRoute(
      path: RoutesName.registerProduct,
      builder: (context, state) {
        return ChangeNotifierProvider(
          create: (context) => ProductController(),
          child: const ProductRegisterPage(),
        );
      },
    ),

    GoRoute(
      path: RoutesName.customerRegister,
      builder: (context, state) => ChangeNotifierProvider(
        create: (context) => CustomerController(),
        child: CustomerRegisterPage(),
      ),
    ),
  ],
);
