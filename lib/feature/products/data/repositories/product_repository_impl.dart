import 'package:valora/feature/products/data/datasource/product_datasource.dart';
import 'package:valora/feature/products/data/mappers/product_mapper.dart';
import 'package:valora/feature/products/domain/entities/product_entity.dart';
import 'package:valora/feature/products/domain/repositories/product_repository.dart';
import 'package:valora/injection.dart';
import 'package:result_dart/result_dart.dart';

class ProductRepositoryImpl implements ProductRepository {
  final data = sl<ProductDatasource>();

  @override
  AsyncResult<Unit> createProduct({required ProductEntity product}) async {
    return await data.createProduct(product: product.toDto());
  }

  @override
  AsyncResult<List<ProductEntity>> getProducts() async {
    return await data.getProducts().map(
      (productsDto) => productsDto.map((dto) => dto.toEntity()).toList(),
    );
  }

  @override
  AsyncResult<List<ProductEntity>> getProductsByName({
    required String name,
  }) async {
    return await data
        .getProductsByName(name: name)
        .map(
          (productsDto) => productsDto.map((dto) => dto.toEntity()).toList(),
        );
  }
}
