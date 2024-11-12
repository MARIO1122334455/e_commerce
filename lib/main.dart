import 'package:e_commerce/core/routes_manager/route_generator.dart';
import 'package:e_commerce/core/routes_manager/routes.dart';
import 'package:e_commerce/di.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  configureDependencies();
  runApp(const Ecommerce());
}

class Ecommerce extends StatelessWidget {
  const Ecommerce({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 032),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) { 
        return const MaterialApp(
          debugShowCheckedModeBanner: false,
          onGenerateRoute: RouteGenerator.getRoute,
          initialRoute: Routes.splashScreenRoute,
        );
      },
    );
  }
}
