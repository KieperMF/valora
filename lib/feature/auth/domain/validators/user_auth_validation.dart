import 'package:lucid_validation/lucid_validation.dart';
import 'package:valora/feature/auth/domain/entities/user_auth_entity.dart';

class UserAuthValidation extends LucidValidator<UserAuthEntity> {
  UserAuthValidation() {
    ruleFor((user) => user.email, key: 'email')
        .notEmpty(message: "E-mail não pode ser vazio")
        .validEmail(message: "E-mail inválido");
    ruleFor(
      (user) => user.password,
      key: 'password',
    ).notEmpty(message: "Senha é obrigatória");
  }
}
