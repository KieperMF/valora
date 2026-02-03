import 'package:result_dart/result_dart.dart';

abstract class HomeRepository {
  AsyncResult<Unit> logoutUser();
}
