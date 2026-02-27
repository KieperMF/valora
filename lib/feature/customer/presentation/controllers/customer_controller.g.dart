// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CustomerController on CustomerStore, Store {
  late final _$customersAtom = Atom(
    name: 'CustomerStore.customers',
    context: context,
  );

  @override
  List<CustomerEntity> get customers {
    _$customersAtom.reportRead();
    return super.customers;
  }

  @override
  set customers(List<CustomerEntity> value) {
    _$customersAtom.reportWrite(value, super.customers, () {
      super.customers = value;
    });
  }

  late final _$customerInDebtAtom = Atom(
    name: 'CustomerStore.customerInDebt',
    context: context,
  );

  @override
  int get customerInDebt {
    _$customerInDebtAtom.reportRead();
    return super.customerInDebt;
  }

  @override
  set customerInDebt(int value) {
    _$customerInDebtAtom.reportWrite(value, super.customerInDebt, () {
      super.customerInDebt = value;
    });
  }

  late final _$getCustomersAsyncAction = AsyncAction(
    'CustomerStore.getCustomers',
    context: context,
  );

  @override
  Future<void> getCustomers() {
    return _$getCustomersAsyncAction.run(() => super.getCustomers());
  }

  @override
  String toString() {
    return '''
customers: ${customers},
customerInDebt: ${customerInDebt}
    ''';
  }
}
