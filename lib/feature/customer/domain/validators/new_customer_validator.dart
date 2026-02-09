import 'package:lucid_validation/lucid_validation.dart';
import 'package:valora/feature/customer/domain/entities/customer_entity.dart';

class NewCustomerValidator extends LucidValidator<CustomerEntity> {
  NewCustomerValidator() {
    ruleFor(
      (entity) => entity.name,
      key: 'Name',
    ).notEmpty(message: "O nome não pode ser vazio.");
  }
}
