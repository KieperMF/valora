import 'package:my_sales/feature/products/data/datasource/product_datasource.dart';
import 'package:my_sales/feature/products/data/mappers/product_mapper.dart';
import 'package:my_sales/feature/products/domain/entities/product_entity.dart';
import 'package:my_sales/feature/products/domain/repositories/product_repository.dart';
import 'package:my_sales/injection.dart';
import 'package:result_dart/result_dart.dart';

class ProductRepositoryImpl implements ProductReository {
  final data = sl<ProductDatasource>();

  @override
  AsyncResult<Unit> createProduct({required ProductEntity product}) {
    return data.createProduct(product: product.toDto());
  }

  @override
  AsyncResult<List<ProductEntity>> getProducts() async {
    final result = await data.getProducts();
    return result.mapFold(
      (success) => success.map((e) => e.toEntity()).toList(),
      (failure) => Exception(failure),
    );
  }
}
