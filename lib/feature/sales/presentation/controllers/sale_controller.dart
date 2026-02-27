import 'package:mobx/mobx.dart';
import 'package:valora/feature/sales/domain/entities/sale_entity.dart';
import 'package:valora/feature/sales/domain/repositories/sale_repository.dart';
import 'package:valora/injection.dart';

part 'sale_controller.g.dart';

class SaleController = SaleStore with _$SaleController;

abstract class SaleStore with Store {
  final _repository = sl<SaleRepository>();

  @observable
  ObservableList<SaleEntity> sales = ObservableList<SaleEntity>();

  @observable
  SaleEntity saleRegister = SaleEntity.toEmpty();

  @observable
  ObservableList<String> paymentMethods = ObservableList.of([
    'Dinheiro',
    'Cartão de Crédito',
    'Cartão de Débito',
    'Pix',
  ]);

  @action
  void setPaymentMethod(String paymentMethod) {
    saleRegister.paymentMethod = paymentMethod;
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
  Future<void> logout() async {
    await _repository.logout();
  }
}
