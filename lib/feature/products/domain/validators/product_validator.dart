import 'package:lucid_validation/lucid_validation.dart';
import 'package:my_sales/feature/products/domain/entities/product_entity.dart';

class ProductValidator extends LucidValidator<ProductEntity> {
  ProductValidator() {
    ruleFor(
      (product) => product.name,
      key: 'name',
    ).notEmpty(message: "O nome do produto não pode ser vazio");
    ruleFor(
      (product) => product.price,
      key: 'price',
    ).greaterThan(0, message: "O preço do produto deve ser maior que zero");
    ruleFor(
      (product) => product.brand,
      key: 'brand',
    ).notEmpty(message: "A marca do produto não pode ser vazia");
    ruleFor((product) => product.quantity, key: 'quantity').greaterThan(
      0,
      message: "A quantidade do produto deve ser maior que zero",
    );
  }
}
