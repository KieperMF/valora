import 'package:flutter/foundation.dart';
import 'package:my_sales/feature/products/domain/entities/product_entity.dart';
import 'package:my_sales/feature/products/domain/repositories/product_repository.dart';
import 'package:my_sales/injection.dart';
import 'package:result_dart/result_dart.dart';

class ProductController extends ChangeNotifier {
  final repository = sl<ProductReository>();

  List<ProductEntity> products = [];

  Future<void> fetchProducts() async {
    final result = await repository.getProducts();
    result.fold(
      (success) {
        products = success;
        notifyListeners();
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
