// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AuthController on AuthStore, Store {
  late final _$showPasswordAtom = Atom(
    name: 'AuthStore.showPassword',
    context: context,
  );

  @override
  bool get showPassword {
    _$showPasswordAtom.reportRead();
    return super.showPassword;
  }

  @override
  set showPassword(bool value) {
    _$showPasswordAtom.reportWrite(value, super.showPassword, () {
      super.showPassword = value;
    });
  }

  late final _$showConfirmAtom = Atom(
    name: 'AuthStore.showConfirm',
    context: context,
  );

  @override
  bool get showConfirm {
    _$showConfirmAtom.reportRead();
    return super.showConfirm;
  }

  @override
  set showConfirm(bool value) {
    _$showConfirmAtom.reportWrite(value, super.showConfirm, () {
      super.showConfirm = value;
    });
  }

  late final _$isLoadingAtom = Atom(
    name: 'AuthStore.isLoading',
    context: context,
  );

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$AuthStoreActionController = ActionController(
    name: 'AuthStore',
    context: context,
  );

  @override
  void setShowPassword() {
    final _$actionInfo = _$AuthStoreActionController.startAction(
      name: 'AuthStore.setShowPassword',
    );
    try {
      return super.setShowPassword();
    } finally {
      _$AuthStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setShowConfirm() {
    final _$actionInfo = _$AuthStoreActionController.startAction(
      name: 'AuthStore.setShowConfirm',
    );
    try {
      return super.setShowConfirm();
    } finally {
      _$AuthStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
showPassword: ${showPassword},
showConfirm: ${showConfirm},
isLoading: ${isLoading}
    ''';
  }
}
