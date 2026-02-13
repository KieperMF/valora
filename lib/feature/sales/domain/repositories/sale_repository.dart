import 'package:result_dart/result_dart.dart';
import 'package:valora/feature/sales/domain/entities/sale_entity.dart';

abstract class SaleRepository {
  AsyncResult<Unit> createSale({required SaleEntity sale});
  AsyncResult<List<SaleEntity>> getSales();
}
