import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:streamz/modules/Details/view_models/details_provider.dart';
import 'package:streamz/modules/dashboard/view_model/dashboard_provider.dart';

import 'locator.dart';
import 'router/route.dart';
import 'router/routers.dart';
import 'core/services/services.dart';
import 'core/utils/theme.dart';

void main() {
  setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  final Color colorSeedLight = const Color(0xFF00296B);
  final Color colorSeedDark = const Color(0xFF6B8BC3);
  final bool material3 = true;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<DetailsProvider>(
          create: (_) => DetailsProvider(),
        ),
        ChangeNotifierProvider<DashboardProvider>(
          create: (_) => DashboardProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Streamz',
        theme: StreamzTheme.dark(colorSeedDark, material3),
        initialRoute: dashBoardRoute,
        navigatorKey: getIt<NavigationService>().navigatorKey,
        onGenerateRoute: RouteGenerator.generateRoute,
      ),
    );
  }
}
