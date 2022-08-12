import 'package:get_it/get_it.dart';
import 'package:get_it_demo/service.dart';

GetIt locator = GetIt.instance;
void setupLocator() {
  locator.registerFactory(() => APIService());
}
