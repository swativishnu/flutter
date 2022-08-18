import 'package:employee_book/Data/local/DB/app_db.dart';
import 'package:flutter/foundation.dart';

class EmployeeChangeNotifier extends ChangeNotifier {
  AppDb? _appDb;
  late final AppDb db = AppDb();

  void initAppDb(AppDb db) {
    _appDb = db;
  }

  late ValueListenable<List<EmployeeData>> _employeeListFuture;
  late List<EmployeeData> _employeeListStream = [];
  ValueListenable<List<EmployeeData>> get employeeListFuture =>
      _employeeListFuture;
  List<EmployeeData> get employeeListStream => _employeeListStream;
  EmployeeData? _employeeData;
  EmployeeData? get employeeData => _employeeData;
  String _error = '';
  String get error => _error;
  bool _isAdded = false;
  bool get added => _isAdded;
  bool _isUpdated = false;
  bool get isUpdated => _isUpdated;
  bool _isDeleted = false;
  bool get isDeleted => _isDeleted;

  List<EmployeeData> getEmployeeFuture() {
    initAppDb(db);
    _appDb?.getEmployees().then((value) {
      _employeeListFuture = value;
      notifyListeners();

      return _employeeListFuture;
      // ignore: invalid_return_type_for_catch_error
    }).catchError((error, stackTrace) => {});
    return _employeeListFuture;
  }

  void getEmployeeStream() {
    _appDb?.getEmployeeStream().listen((event) {
      _employeeListStream = event;
    });
    notifyListeners();
  }

  void getSingleEmployee(int id) {
    _appDb?.getEmployee(id).then((value) {
      _employeeData = value;
    }).catchError((error, stackTrace) => {});
    notifyListeners();
  }

  void createEmployee(EmployeeCompanion entity) {
    _appDb?.insertEmployee(entity).then((value) {
      _isAdded = value == 1 ? true : false;
      notifyListeners();
    }).catchError((error, stackTrace) => {});
    notifyListeners();
  }

  void deleteEmployee(int id) {
    _appDb?.deleteEmployee(id).then((value) {
      _isDeleted = value == 1 ? true : false;
    }).catchError((error, stackTrace) => {});
    notifyListeners();
  }

  void updateEmployee(EmployeeCompanion entity) {
    _appDb?.updateEmployee(entity).then((value) {
      _isUpdated = value;
    }).catchError((error, stackTrace) => {});
    notifyListeners();
  }
}
