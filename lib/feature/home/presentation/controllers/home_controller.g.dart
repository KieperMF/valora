// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeController on HomeStore, Store {
  late final _$currentIndexAtom = Atom(
    name: 'HomeStore.currentIndex',
    context: context,
  );

  @override
  int get currentIndex {
    _$currentIndexAtom.reportRead();
    return super.currentIndex;
  }

  @override
  set currentIndex(int value) {
    _$currentIndexAtom.reportWrite(value, super.currentIndex, () {
      super.currentIndex = value;
    });
  }

  late final _$HomeStoreActionController = ActionController(
    name: 'HomeStore',
    context: context,
  );

  @override
  void changeTab(int index) {
    final _$actionInfo = _$HomeStoreActionController.startAction(
      name: 'HomeStore.changeTab',
    );
    try {
      return super.changeTab(index);
    } finally {
      _$HomeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentIndex: ${currentIndex}
    ''';
  }
}
