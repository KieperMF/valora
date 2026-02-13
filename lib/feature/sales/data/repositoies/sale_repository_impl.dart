import 'package:result_dart/result_dart.dart';
import 'package:valora/feature/sales/data/datasource/sales_datasource.dart';
import 'package:valora/feature/sales/data/mappers/sale_mapper.dart';
import 'package:valora/feature/sales/domain/entities/sale_entity.dart';
import 'package:valora/feature/sales/domain/repositories/sale_repository.dart';
import 'package:valora/injection.dart';

class SaleRepositoryImpl implements SaleRepository {
  final _datasource = sl<SalesDatasource>();

  @override
  AsyncResult<Unit> createSale({required SaleEntity sale}) {
    return _datasource.createSale(sale: sale.toDto());
  }

  @override
  AsyncResult<List<SaleEntity>> getSales() {
    return _datasource.getSales().map(
      (salesDto) => salesDto.map((dto) => dto.toEntity()).toList(),
    );
  }
}
