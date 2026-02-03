import 'package:my_sales/feature/auth/domain/entities/new_user_entity.dart';
import 'package:my_sales/feature/auth/domain/entities/user_auth_entity.dart';
import 'package:result_dart/result_dart.dart';

abstract class UserAuthRepository {
  AsyncResult<Unit> login({required UserAuthEntity user});
  AsyncResult<Unit> signUp({required NewUserEntity user});
}
