import 'package:mobx/mobx.dart';
import 'package:valora/feature/customer/domain/entities/customer_entity.dart';
import 'package:valora/feature/customer/domain/repositories/customer_repository.dart';
import 'package:valora/feature/sales/domain/entities/sale_entity.dart';
import 'package:valora/feature/sales/domain/repositories/sale_repository.dart';
import 'package:valora/injection.dart';

part 'sale_controller.g.dart';

class SaleController = SaleStore with _$SaleController;

abstract class SaleStore with Store {
  final _repository = sl<SaleRepository>();
  final _customerRepository = sl<CustomerRepository>();

  @observable
  List<SaleEntity> sales = [];

  @observable
  List<CustomerEntity> customers = [];

  @observable
  SaleEntity saleRegister = SaleEntity.toEmpty().copyWith(
    paymentMethod: 'Dinheiro',
  );

  @observable
  List<String> paymentMethods = [
    'Dinheiro',
    'Cartão de Crédito',
    'Cartão de Débito',
    'Pix',
  ];

  @action
  void setPaymentMethod(String paymentMethod) {
    saleRegister = saleRegister.copyWith(paymentMethod: paymentMethod);
  }

  @action
  Future<void> fetchSales() async {
    final result = await _repository.getSales();

    result.fold((fetchedSales) {
      sales = ObservableList.of(fetchedSales);
    }, (error) {});
  }

  @action
  Future<void> registerSale({required SaleEntity newSale}) async {
    final result = await _repository.createSale(sale: newSale);

    result.fold((success) {
      sales.add(newSale);
    }, (error) {});
  }

  @action
  Future<List<String>> fetchCustomer({required String name}) async {
    final result = await _customerRepository.getCustomersByName(name: name);

    return result.fold(
      (result) {
        customers = result;
        return customers.map((e) => e.name).toList();
      },
      (error) {
        return [];
      },
    );
  }

  @action
  Future<void> logout() async {
    await _repository.logout();
  }
}
