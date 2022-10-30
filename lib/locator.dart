import 'package:get_it/get_it.dart';
import 'package:streamz/core/utils/utils.dart';

import 'core/services/services.dart';
import 'modules/dashboard/view_model/dashboard_provider.dart';

GetIt getIt = GetIt.I;

setup() {
  //View Model
  getIt.registerFactory<DashboardProvider>(() => DashboardProvider());
  getIt.registerFactory<StreamzTheme>(() => StreamzTheme());
  // Services
  getIt.registerLazySingleton<NavigationService>(() => NavigationService());
}
