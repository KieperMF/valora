import 'package:lucid_validation/lucid_validation.dart';
import 'package:valora/feature/auth/domain/entities/new_user_entity.dart';

class NewUserValidation extends LucidValidator<NewUserEntity> {
  NewUserValidation() {
    ruleFor((user) => user.email, key: 'email')
        .notEmpty(message: "E-mail não pode ser vazio")
        .validEmail(message: "E-mail inválido");
    ruleFor((user) => user.password, key: 'password')
        .notEmpty(message: "Senha é obrigatória")
        .minLength(6, message: "A senha não pode ter menos de 6 caracteres");
    ruleFor(
      (user) => user.confirmPassword,
      key: 'confirm',
    ).equalTo((user) => user.password, message: "As senhas estão diferentes");
    ruleFor(
      (user) => user.userName,
      key: 'name',
    ).notEmpty(message: "Seu nome ou dá empresa é obrigatório");
  }
}
