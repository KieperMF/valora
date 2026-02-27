// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sale_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SaleController on SaleStore, Store {
  late final _$salesAtom = Atom(name: 'SaleStore.sales', context: context);

  @override
  ObservableList<SaleEntity> get sales {
    _$salesAtom.reportRead();
    return super.sales;
  }

  @override
  set sales(ObservableList<SaleEntity> value) {
    _$salesAtom.reportWrite(value, super.sales, () {
      super.sales = value;
    });
  }

  late final _$saleRegisterAtom = Atom(
    name: 'SaleStore.saleRegister',
    context: context,
  );

  @override
  SaleEntity get saleRegister {
    _$saleRegisterAtom.reportRead();
    return super.saleRegister;
  }

  @override
  set saleRegister(SaleEntity value) {
    _$saleRegisterAtom.reportWrite(value, super.saleRegister, () {
      super.saleRegister = value;
    });
  }

  late final _$paymentMethodsAtom = Atom(
    name: 'SaleStore.paymentMethods',
    context: context,
  );

  @override
  ObservableList<String> get paymentMethods {
    _$paymentMethodsAtom.reportRead();
    return super.paymentMethods;
  }

  @override
  set paymentMethods(ObservableList<String> value) {
    _$paymentMethodsAtom.reportWrite(value, super.paymentMethods, () {
      super.paymentMethods = value;
    });
  }

  late final _$fetchSalesAsyncAction = AsyncAction(
    'SaleStore.fetchSales',
    context: context,
  );

  @override
  Future<void> fetchSales() {
    return _$fetchSalesAsyncAction.run(() => super.fetchSales());
  }

  late final _$registerSaleAsyncAction = AsyncAction(
    'SaleStore.registerSale',
    context: context,
  );

  @override
  Future<void> registerSale({required SaleEntity newSale}) {
    return _$registerSaleAsyncAction.run(
      () => super.registerSale(newSale: newSale),
    );
  }

  late final _$logoutAsyncAction = AsyncAction(
    'SaleStore.logout',
    context: context,
  );

  @override
  Future<void> logout() {
    return _$logoutAsyncAction.run(() => super.logout());
  }

  late final _$SaleStoreActionController = ActionController(
    name: 'SaleStore',
    context: context,
  );

  @override
  void setPaymentMethod(String paymentMethod) {
    final _$actionInfo = _$SaleStoreActionController.startAction(
      name: 'SaleStore.setPaymentMethod',
    );
    try {
      return super.setPaymentMethod(paymentMethod);
    } finally {
      _$SaleStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
sales: ${sales},
saleRegister: ${saleRegister},
paymentMethods: ${paymentMethods}
    ''';
  }
}
