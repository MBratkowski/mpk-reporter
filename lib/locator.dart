import 'package:get_it/get_it.dart';
import 'package:mpk_reporter/core/services/Api.dart';
import 'package:mpk_reporter/core/viewmodels/CRUDModel.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => Api('incidents'));
  locator.registerLazySingleton(() => CRUDModel());
}
