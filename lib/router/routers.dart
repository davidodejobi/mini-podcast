import 'package:flutter/material.dart';
import 'package:streamz/router/route.dart';

import '../modules/Details/details.dart';
import '../modules/dashboard/dashboard.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case dashBoardRoute:
        return MaterialPageRoute(builder: (_) => const Dashboard());
      case '/details':
        return MaterialPageRoute(builder: (_) => const Details());
      // case '/login':
      //   return MaterialPageRoute(builder: (_) => LoginUI());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Text('No route defined for ${settings.name}'),
          ),
        );
    }
  }
}
