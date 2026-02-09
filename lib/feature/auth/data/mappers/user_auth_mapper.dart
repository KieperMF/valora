import 'package:valora/feature/auth/data/dto/user_auth_dto.dart';
import 'package:valora/feature/auth/domain/entities/new_user_entity.dart';
import 'package:valora/feature/auth/domain/entities/user_auth_entity.dart';

extension UserAuthEntityMapper on UserAuthEntity {
  UserAuthDto toDto() {
    return UserAuthDto(email: email, password: password);
  }
}

extension NewUserEntityMapper on NewUserEntity {
  UserAuthDto toDto() {
    return UserAuthDto(email: email, password: password, name: userName);
  }
}
