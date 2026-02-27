import 'package:mobx/mobx.dart';
import 'package:valora/feature/home/domain/repositories/home_repository.dart';
import 'package:valora/injection.dart';

part 'home_controller.g.dart';

class HomeController = HomeStore with _$HomeController;

abstract class HomeStore with Store {
  final _repository = sl<HomeRepository>();
  @observable
  int currentIndex = 0;

  @action
  void changeTab(int index) {
    if (currentIndex == index) return;
    currentIndex = index;
  }

  void logoutUser() {
    _repository.logoutUser();
  }
}
