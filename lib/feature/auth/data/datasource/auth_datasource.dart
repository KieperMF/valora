import 'package:valora/feature/auth/data/dto/user_auth_dto.dart';
import 'package:result_dart/result_dart.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthDatasource {
  final supa = Supabase.instance.client;

  AsyncResult<Unit> login({required UserAuthDto user}) async {
    try {
      await supa.auth.signInWithPassword(
        password: user.password,
        email: user.email,
      );

      return Success(unit);
    } on AuthApiException catch (e) {
      return Failure(AuthApiException(e.message));
    } catch (e) {
      return Failure(Exception('Erro inesperado'));
    }
  }

  AsyncResult<Unit> signUp({required UserAuthDto user}) async {
    try {
      await supa.auth.signUp(
        password: user.password,
        email: user.email,
        data: {'display_name': user.name},
      );

      return Success(unit);
    } catch (e) {
      return Failure(Exception(e));
    }
  }
}
