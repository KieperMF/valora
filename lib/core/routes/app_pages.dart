import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:valora/core/middlewares/auth_middleware.dart';
import 'package:valora/core/routes/routes_name.dart';
import 'package:valora/feature/auth/presentation/page/login_page.dart';
import 'package:valora/feature/auth/presentation/page/sign_up_page.dart';
import 'package:valora/feature/customer/presentation/controllers/customer_controller.dart';
import 'package:valora/feature/customer/presentation/pages/customer_register_page.dart';
import 'package:valora/feature/home/presentation/controllers/home_controller.dart';
import 'package:valora/feature/home/presentation/pages/home_navigation.dart';
import 'package:valora/feature/products/presentation/pages/product_register_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:valora/feature/sales/presentation/controllers/sale_controller.dart';
import 'package:valora/feature/sales/presentation/pages/register_sale_page.dart';

final authNotifier = AuthNotifier(Supabase.instance.client);
final homeController = HomeController();
final customerController = CustomerController();
final saleController = SaleController();

final router = GoRouter(
  initialLocation: RoutesName.home,

  redirect: (context, state) {
    debugPrint('redirect');
    final supa = Supabase.instance.client;
    final isLoggedIn = authNotifier.isLoggedIn;
    final isLoginRoute = state.fullPath == RoutesName.login;
    if (isLoggedIn && isLoginRoute) {
      return RoutesName.home;
    }

    if (supa.auth.currentSession?.accessToken == null &&
        state.fullPath != RoutesName.login) {
      return RoutesName.login;
    }

    return null;
  },

  routes: [
    GoRoute(
      path: RoutesName.home,
      builder: (context, state) => HomeNavigation(),
    ),
    GoRoute(path: RoutesName.login, builder: (context, state) => LoginPage()),
    GoRoute(path: RoutesName.signup, builder: (context, state) => SignUpPage()),

    GoRoute(
      path: RoutesName.registerProduct,
      builder: (context, state) {
        return ProductRegisterPage();
      },
    ),

    GoRoute(
      path: RoutesName.customerRegister,
      builder: (context, state) => CustomerRegisterPage(),
    ),

    GoRoute(
      path: RoutesName.saleRegister,
      builder: (context, state) => RegisterSalePage(),
    ),
  ],
);
