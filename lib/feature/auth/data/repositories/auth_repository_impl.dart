import 'package:my_sales/feature/auth/data/datasource/auth_datasource.dart';
import 'package:my_sales/feature/auth/data/mappers/user_auth_mapper.dart';
import 'package:my_sales/feature/auth/domain/entities/new_user_entity.dart';
import 'package:my_sales/feature/auth/domain/entities/user_auth_entity.dart';
import 'package:my_sales/feature/auth/domain/repositories/user_auth_repository.dart';
import 'package:my_sales/injection.dart';
import 'package:result_dart/result_dart.dart';

class AuthRepositoryImpl implements UserAuthRepository {
  final _datasource = sl<AuthDatasource>();

  @override
  AsyncResult<Unit> login({required UserAuthEntity user}) {
    return _datasource.login(user: user.toDto());
  }

  @override
  AsyncResult<Unit> signUp({required NewUserEntity user}) {
    return _datasource.signUp(user: user.toDto());
  }
}
