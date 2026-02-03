import 'package:flutter/material.dart';
import 'package:my_sales/feature/home/domain/repositories/home_repository.dart';
import 'package:my_sales/injection.dart';

class HomeController extends ChangeNotifier {
  final _repository = sl<HomeRepository>();

  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  void changeTab(int index) {
    if (_currentIndex == index) return;
    _currentIndex = index;
    notifyListeners();
  }

  void logoutUser() {
    _repository.logoutUser();
  }
}
