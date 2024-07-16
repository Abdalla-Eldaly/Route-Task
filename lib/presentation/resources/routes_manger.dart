import 'package:flutter/material.dart';
import 'package:route_task/app/di.dart';
import 'package:route_task/presentation/home_details_screen/view/home_details_screen.dart';
import 'package:route_task/presentation/resources/string_manger.dart';
import 'package:route_task/presentation/search_screen/view/search_screen.dart';
import '../main_layout/view/home_screen.dart';

class Routes {
  Routes._();

  static const String homeScreenRoute = '/';
  static const String searchScreenRoute = '/searchScreen';
  static const String homeDetailsScreenRoute = '/homeDetailsScreen';
}

class RouteGenerator {
  RouteGenerator._();

  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.homeScreenRoute:
        intiHomeUseCase();
        return MaterialPageRoute(builder: (_) =>  const HomeScreen());
      case Routes.searchScreenRoute:
        intiHomeSearchUseCase();
        return MaterialPageRoute(builder: (_) =>   SearchScreen());
      case Routes.homeDetailsScreenRoute:
        intiHomeSearchUseCase();
        return MaterialPageRoute(builder: (_) =>   const HomeDetailsScreen());


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
