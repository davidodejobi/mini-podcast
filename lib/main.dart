import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<StreamzTheme>(
          create: (_) => StreamzTheme(),
        ),
      ],
      child: Consumer<StreamzTheme>(
        builder: (context, appTheme, _) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Streamz',
            theme: StreamzTheme.light(colorSeedLight, material3),
            darkTheme: StreamzTheme.dark(colorSeedDark, material3),
            themeMode: appTheme.currentTheme,
            initialRoute: dashBoardRoute,
            navigatorKey: getIt<NavigationService>().navigatorKey,
            onGenerateRoute: RouteGenerator.generateRoute,
          );
        },
      ),
    );
  }
}
