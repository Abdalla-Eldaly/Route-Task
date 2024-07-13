import 'package:flutter/material.dart';
import 'package:route_task/presentaion/resourses/string_manger.dart';
import '../main_layout/view/home_screen.dart';

class Routes {
  Routes._();

  static const String homeScreenRoute = '/';
}

class RouteGenerator {
  RouteGenerator._();

  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.homeScreenRoute:
        return MaterialPageRoute(builder: (_) =>  const HomeScreen());


      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text(AppStrings.noRouteFound),
        ),
        body: const Center(child: Text(AppStrings.noRouteFound)),
      ),
    );
  }
}
