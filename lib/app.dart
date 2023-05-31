import 'package:flutter/material.dart';
import 'package:furniture_app/screens/boarding_screen.dart';
import 'package:furniture_app/services/app_routes.dart';

class FurnitureApp extends StatelessWidget {
  const FurnitureApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.initialRoute,
      theme: ThemeData(),
      routes: AppRoutes.routes,
    );
  }
}
