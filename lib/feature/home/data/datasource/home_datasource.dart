import 'package:result_dart/result_dart.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HomeDatasource {
  final _supa = Supabase.instance.client;

  AsyncResult<Unit> logoutUser() async {
    try {
      await _supa.auth.signOut();
      return Success(unit);
    } catch (e) {
      return Failure(Exception(e));
    }
  }
}
