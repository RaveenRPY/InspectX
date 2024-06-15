// Define the Routes class
import 'package:flutter/material.dart';
import 'package:inspectx/inspectx.dart';

import 'main.dart';

class Routes {
  static const String kHomeScreen = "kHomeScreen";
  static const String kSettingsScreen = "kSettingsScreen";

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.kHomeScreen:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
          settings: const RouteSettings(name: Routes.kHomeScreen),
        );
      case Routes.kSettingsScreen:
        return MaterialPageRoute(
          builder: (_) => const InspectX(page: SettingsScreen()),
          settings: const RouteSettings(name: Routes.kSettingsScreen),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(
              child: Text("Invalid Route"),
            ),
          ),
        );
    }
  }
}