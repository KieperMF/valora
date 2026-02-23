import 'package:flutter/material.dart';
import 'package:valora/feature/sales/domain/entities/sale_entity.dart';
import 'package:valora/feature/sales/domain/repositories/sale_repository.dart';
import 'package:valora/injection.dart';

class SaleController extends ChangeNotifier {
  final _repository = sl<SaleRepository>();

  List<SaleEntity> sales = [];

  Future<void> featchSales() async {
    final result = await _repository.getSales();
    result.fold((sales) {
      sales = sales;
      notifyListeners();
    }, (error) {});
  }

  Future<void> registerSale({required SaleEntity newSale}) async {
    final result = await _repository.createSale(sale: newSale);
    result.fold((success) {
      sales.add(newSale);
      notifyListeners();
    }, (error) {});
  }
}
