import 'package:valora/feature/products/domain/entities/product_entity.dart';
import 'package:result_dart/result_dart.dart';

abstract class ProductReository {
  AsyncResult<Unit> createProduct({required ProductEntity product});
  AsyncResult<List<ProductEntity>> getProducts();
}
