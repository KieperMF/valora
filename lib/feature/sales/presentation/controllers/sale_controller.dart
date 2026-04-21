import 'package:flutter/material.dart';
import 'package:valora/feature/customer/domain/entities/customer_entity.dart';
import 'package:valora/feature/customer/domain/repositories/customer_repository.dart';
import 'package:valora/feature/sales/domain/entities/sale_entity.dart';
import 'package:valora/feature/sales/domain/repositories/sale_repository.dart';
import 'package:valora/injection.dart';

class SaleController extends ChangeNotifier {
  final _repository = sl<SaleRepository>();
  final _customerRepository = sl<CustomerRepository>();

  List<SaleEntity> sales = [];
  List<CustomerEntity> customers = [];
  SaleEntity saleRegister = SaleEntity.toEmpty();
  List<String> paymentMethods = [
    'Dinheiro',
    'Cartão de Crédito',
    'Cartão de Débito',
    'Pix',
  ];

  void setPaymentMethod(String paymentMethod) {
    saleRegister.paymentMethod = paymentMethod;
    notifyListeners();
  }

  Future<void> featchSales() async {
    final result = await _repository.getSales();
    result.fold((sales) {
      sales = sales;
    }, (error) {});
    notifyListeners();
  }

  Future<void> registerSale({required SaleEntity newSale}) async {
    final result = await _repository.createSale(sale: newSale);
    result.fold((success) {
      sales.add(newSale);
    }, (error) {});
    notifyListeners();
  }

  Future<List<CustomerEntity>> getCustomers({required String name}) async {
    final result = await _customerRepository.getCustomerByName(name);
    debugPrint(name);
    return result.fold(
      (customers) {
        debugPrint(customers.first.name);
        customers = customers;
        notifyListeners();
        return customers;
      },
      (error) {
        notifyListeners();
        return [];
      },
    );
  }

  Future<void> logout() async {
    await _repository.logout();
  }
}
