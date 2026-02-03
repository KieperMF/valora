import 'package:my_sales/feature/customer/domain/entities/customer_entity.dart';
import 'package:result_dart/result_dart.dart';

abstract class CustomerRepository {
  AsyncResult<Unit> addCustomer(CustomerEntity customer);
  AsyncResult<List<CustomerEntity>> getCustomers();
}
