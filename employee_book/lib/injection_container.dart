import 'package:employee_book/Data/local/DB/app_db.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerFactory(() => AppDb());
}
