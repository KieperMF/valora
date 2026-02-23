import 'package:lucid_validation/lucid_validation.dart';
import 'package:valora/feature/sales/domain/entities/sale_entity.dart';

class SaleValidator extends LucidValidator<SaleEntity> {
  SaleValidator() {
    ruleFor(
      (sale) => sale.paymentMethod,
      key: "paymentMethod",
    ).notEmpty(message: "O método de pagamento é obrigatório.");
  }
}
