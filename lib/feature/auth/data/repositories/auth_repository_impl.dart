import 'package:valora/feature/auth/data/datasource/auth_datasource.dart';
import 'package:valora/feature/auth/data/mappers/user_auth_mapper.dart';
import 'package:valora/feature/auth/domain/entities/new_user_entity.dart';
import 'package:valora/feature/auth/domain/entities/user_auth_entity.dart';
import 'package:valora/feature/auth/domain/repositories/user_auth_repository.dart';
import 'package:valora/injection.dart';
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

  @override
  Future<void> logout() async {
    await _datasource.logout();
  }
}
