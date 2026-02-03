import 'package:my_sales/feature/customer/data/datasource/customer_datasource.dart';
import 'package:my_sales/feature/customer/data/mappers/customer_mapper.dart';
import 'package:my_sales/feature/customer/domain/entities/customer_entity.dart';
import 'package:my_sales/feature/customer/domain/repositories/customer_repository.dart';
import 'package:my_sales/injection.dart';
import 'package:result_dart/result_dart.dart';

class CustomerRepositoryImpl implements CustomerRepository {
  final data = sl<CustomerDatasource>();

  @override
  AsyncResult<Unit> addCustomer(CustomerEntity entity) {
    return data.addCustomer(entity.toDto());
  }

  @override
  AsyncResult<List<CustomerEntity>> getCustomers() {
    return data.getCustomers().map(
      (dtos) => dtos.map((dto) => dto.toEntity()).toList(),
    );
  }
}
