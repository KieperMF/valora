import 'package:my_sales/feature/products/data/dto/product_dto.dart';
import 'package:result_dart/result_dart.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ProductDatasource {
  final supa = Supabase.instance.client;

  AsyncResult<Unit> createProduct({required ProductDto product}) async {
    try {
      product.companyId = supa.auth.currentUser!.id;
      await supa.from("products").insert(product.toJson());
      return Success(unit);
    } catch (e) {
      return Failure(Exception(e));
    }
  }

  AsyncResult<List<ProductDto>> getProducts() async {
    try {
      final result = await supa.from('products').select();
      final data = result.map((e) {
        return ProductDto.fromJson(e);
      }).toList();

      return Success(data);
    } catch (e) {
      return Failure(Exception(e));
    }
  }
}
