import 'package:valora/feature/products/domain/entities/product_entity.dart';
import 'package:result_dart/result_dart.dart';

abstract class ProductRepository {
  AsyncResult<Unit> createProduct({required ProductEntity product});
  AsyncResult<List<ProductEntity>> getProducts();
  AsyncResult<List<ProductEntity>> getProductsByName({required String name});
}
