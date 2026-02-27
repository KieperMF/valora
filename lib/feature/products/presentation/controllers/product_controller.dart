import 'package:flutter/foundation.dart';
import 'package:mobx/mobx.dart';
import 'package:valora/feature/products/domain/entities/product_entity.dart';
import 'package:valora/feature/products/domain/repositories/product_repository.dart';
import 'package:valora/injection.dart';
import 'package:result_dart/result_dart.dart';

part 'product_controller.g.dart';

class ProductController = ProductStore with _$ProductController;

abstract class ProductStore with Store {
  final repository = sl<ProductReository>();

  @observable
  List<ProductEntity> products = [];

  @action
  Future<void> fetchProducts() async {
    final result = await repository.getProducts();
    result.fold(
      (success) {
        products = success;

        debugPrint('Fetched ${success.length} products.');
      },
      (failure) {
        debugPrint('Failed to fetch products: $failure');
      },
    );
  }

  AsyncResult<Unit> registerProduct(ProductEntity product) async {
    final result = await repository.createProduct(product: product);
    return result.fold(
      (success) {
        debugPrint('Product added successfully.');
        return Success(unit);
      },
      (failure) {
        debugPrint('Failed to add product: $failure');
        return Failure(failure);
      },
    );
  }
}
