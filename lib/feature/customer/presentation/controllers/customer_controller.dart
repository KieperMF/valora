import 'package:mobx/mobx.dart';
import 'package:valora/feature/customer/domain/entities/customer_entity.dart';
import 'package:valora/feature/customer/domain/repositories/customer_repository.dart';
import 'package:valora/injection.dart';
import 'package:result_dart/result_dart.dart';

part 'customer_controller.g.dart';

class CustomerController = CustomerStore with _$CustomerController;

abstract class CustomerStore with Store {
  final respository = sl<CustomerRepository>();

  @observable
  List<CustomerEntity> customers = [];
  @observable
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

  @action
  Future<void> getCustomers() async {
    final result = await respository.getCustomers();
    result.fold((onSuccess) {
      customers = onSuccess;
      customerInDebt = customers.where((customer) => customer.bill > 0).length;
    }, (onFailure) {});
  }
}
