import 'package:e_commerce/core/routes_manager/routes.dart';

import 'package:e_commerce/features/presentation/pages/auth/login/login_screen.dart';
import 'package:e_commerce/features/presentation/pages/auth/register/register_screen.dart';
import 'package:e_commerce/features/presentation/pages/main/MainLayout.dart';
import 'package:e_commerce/features/presentation/pages/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_e_commerece_c11_sun/core/routes_manager/routes.dart';
// import 'package:flutter_e_commerece_c11_sun/features/auth/presentation/screens/login/login_screen.dart';
// import 'package:flutter_e_commerece_c11_sun/features/auth/presentation/screens/register/register_screen.dart';

// import '../../features/cart/screens/cart_screen.dart';
// import '../../features/main_layout/main_layout.dart';
// import '../../features/product_details/presentation/screen/product_details.dart';
// import '../../features/products_screen/presentation/screens/products_screen.dart';
// import '../../features/splash/splash_screen.dart';

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      //   case Routes.cartRoute:
      //     return MaterialPageRoute(builder: (_) => const CartScreen());
        case Routes.mainRoute:
          return MaterialPageRoute(builder: (_) => const Mainlayout());

      //   case Routes.productsScreenRoute:
      //     return MaterialPageRoute(builder: (_) => const ProductsScreen());

      //   case Routes.productDetails:
      //     return MaterialPageRoute(builder: (_) => const ProductDetails());

      case Routes.signInRoute:
        return MaterialPageRoute(builder: (_) =>  LoginScreen());

      case Routes.splashScreenRoute:
        return MaterialPageRoute(builder: (_) => const SplashScreen());

      case Routes.signUpRoute:
        return MaterialPageRoute(builder: (_) => RegisterScreen());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text('No Route Found'),
        ),
        body: const Center(child: Text('No Route Found')),
      ),
    );
  }
}
