import 'package:get_it/get_it.dart';
import 'package:streamz/core/utils/utils.dart';

import 'modules/dashboard/view_model/view_model.dart';
import 'core/services/services.dart';

GetIt getIt = GetIt.I;

setup() {
  //View Model
  getIt.registerFactory<DashBoardProvider>(() => DashBoardProvider());
  getIt.registerFactory<StreamzTheme>(() => StreamzTheme());
  // Services
  getIt.registerLazySingleton<NavigationService>(() => NavigationService());
}
