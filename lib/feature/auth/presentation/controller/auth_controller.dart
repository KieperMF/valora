import 'package:mobx/mobx.dart';
import 'package:valora/feature/auth/domain/entities/new_user_entity.dart';
import 'package:valora/feature/auth/domain/entities/user_auth_entity.dart';
import 'package:valora/feature/auth/domain/repositories/user_auth_repository.dart';
import 'package:valora/injection.dart';

part 'auth_controller.g.dart';

class AuthController = AuthStore with _$AuthController;

abstract class AuthStore with Store {
  final _repository = sl<UserAuthRepository>();

  @observable
  bool showPassword = true;
  @observable
  bool showConfirm = true;
  @observable
  bool isLoading = false;
  final user = NewUserEntity.toEmpty();
  final userAuth = UserAuthEntity.toEmpty();

  @action
  void setShowPassword() {
    showPassword = !showPassword;
  }

  @action
  void setShowConfirm() {
    showConfirm = !showConfirm;
  }

  Future<bool> login({required UserAuthEntity user}) async {
    isLoading = true;
    final response = await _repository.login(user: user);
    isLoading = false;
    return response.fold((onSuccess) => true, (onFailure) => false);
  }

  Future<bool> signUp({required NewUserEntity user}) async {
    isLoading = true;
    final response = await _repository.signUp(user: user);
    isLoading = false;
    return response.fold((onSuccess) => true, (onFailure) => false);
  }

  Future<void> logout() async {
    await _repository.logout();
  }
}
