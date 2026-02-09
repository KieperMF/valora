import 'package:flutter/material.dart';
import 'package:valora/feature/auth/domain/entities/new_user_entity.dart';
import 'package:valora/feature/auth/domain/entities/user_auth_entity.dart';
import 'package:valora/feature/auth/domain/repositories/user_auth_repository.dart';
import 'package:valora/injection.dart';

class AuthController extends ChangeNotifier {
  final _repository = sl<UserAuthRepository>();

  bool showPassword = true;
  bool showConfirm = true;
  final user = NewUserEntity.toEmpty();
  final userAuth = UserAuthEntity.toEmpty();

  void setShowPassword() {
    showPassword = !showPassword;
    notifyListeners();
  }

  void setShowConfirm() {
    showConfirm = !showConfirm;
    notifyListeners();
  }

  Future<bool> login({required UserAuthEntity user}) async {
    final response = await _repository.login(user: user);
    return response.fold((onSuccess) => true, (onFailure) => false);
  }

  Future<bool> signUp({required NewUserEntity user}) async {
    final response = await _repository.signUp(user: user);
    return response.fold((onSuccess) => true, (onFailure) => false);
  }
}
