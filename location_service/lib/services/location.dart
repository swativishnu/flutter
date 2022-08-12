// ignore: depend_on_referenced_packages
import 'package:get_it/get_it.dart';
import 'package:location_service/models/location_model.dart';
import 'package:location_service/services/location_services.dart';

GetIt getIt = GetIt.instance;
void locator() {
  getIt.registerLazySingleton(() => LocationModel);
  getIt.registerFactory(() => LocationService);
}
