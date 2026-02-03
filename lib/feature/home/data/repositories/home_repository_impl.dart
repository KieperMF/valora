import 'package:my_sales/feature/home/data/datasource/home_datasource.dart';
import 'package:my_sales/feature/home/domain/repositories/home_repository.dart';
import 'package:my_sales/injection.dart';
import 'package:result_dart/result_dart.dart';

class HomeRepositoryImpl implements HomeRepository {
  final _data = sl<HomeDatasource>();

  @override
  AsyncResult<Unit> logoutUser() async {
    return _data.logoutUser();
  }
}
