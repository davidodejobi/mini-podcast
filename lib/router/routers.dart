import 'package:flutter/material.dart';
import 'package:streamz/modules/modules.dart';
import 'package:streamz/router/route.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case dashBoardRoute:
        return MaterialPageRoute(builder: (_) => const Dashboard());
      // case '/main':
      //   return MaterialPageRoute(builder: (_) => MainUI());
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
