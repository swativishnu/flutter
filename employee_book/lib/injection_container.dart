import 'package:employee_book/Data/local/DB/app_db.dart';
import 'package:employee_book/screen/employee_future_Notifier.dart';
import 'package:get_it/get_it.dart';

import 'notifier/employee_change_notifier.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerFactory(() => AppDb());
  sl.registerLazySingleton<EmployeeChangeNotifier>(
      () => EmployeeChangeNotifier());
  sl.registerLazySingleton<EmployeeNotifierFututreScreen>(
      () => EmployeeNotifierFututreScreen());
  // sl.registerLazySingleton(() => EmployeeStreamScreen());
}
