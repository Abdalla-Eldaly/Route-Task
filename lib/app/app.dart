import 'package:flutter/material.dart';

import '../presentaion/resourses/routes_manger.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.homeScreenRoute,
      onGenerateRoute: RouteGenerator.getRoute,
    );
  }
}
