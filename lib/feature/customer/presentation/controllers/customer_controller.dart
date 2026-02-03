import 'package:flutter/foundation.dart';
import 'package:my_sales/feature/customer/domain/entities/customer_entity.dart';
import 'package:my_sales/feature/customer/domain/repositories/customer_repository.dart';
import 'package:my_sales/injection.dart';
import 'package:result_dart/result_dart.dart';

class CustomerController extends ChangeNotifier {
  final respository = sl<CustomerRepository>();

  List<CustomerEntity> customers = [];
  int customerInDebt = 0;

  AsyncResult addCustomer({required CustomerEntity customer}) async {
    final result = await respository.addCustomer(customer);
    return result.fold(
      (onSuccess) {
        return Success(unit);
      },
      (onFailure) {
        return Failure(onFailure);
      },
    );
  }

  Future<void> getCustomers() async {
    final result = await respository.getCustomers();
    result.fold((onSuccess) {
      customers = onSuccess;
      customerInDebt = customers.where((customer) => customer.bill > 0).length;
      notifyListeners();
    }, (onFailure) {});
  }
}
