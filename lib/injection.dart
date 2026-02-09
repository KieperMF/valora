import 'package:get_it/get_it.dart';
import 'package:valora/feature/auth/data/datasource/auth_datasource.dart';
import 'package:valora/feature/auth/data/repositories/auth_repository_impl.dart';
import 'package:valora/feature/auth/domain/repositories/user_auth_repository.dart';
import 'package:valora/feature/customer/data/datasource/customer_datasource.dart';
import 'package:valora/feature/customer/data/repositories/customer_repository_impl.dart';
import 'package:valora/feature/customer/domain/repositories/customer_repository.dart';
import 'package:valora/feature/home/data/datasource/home_datasource.dart';
import 'package:valora/feature/home/data/repositories/home_repository_impl.dart';
import 'package:valora/feature/home/domain/repositories/home_repository.dart';
import 'package:valora/feature/products/data/datasource/product_datasource.dart';
import 'package:valora/feature/products/data/repositories/product_repository_impl.dart';
import 'package:valora/feature/products/domain/repositories/product_repository.dart';

final sl = GetIt.instance;

void setupDepencies() {
  //Datasource
  sl.registerSingleton<AuthDatasource>(AuthDatasource());
  sl.registerSingleton<HomeDatasource>(HomeDatasource());
  sl.registerSingleton<ProductDatasource>(ProductDatasource());
  sl.registerSingleton<CustomerDatasource>(CustomerDatasource());

  //Repositories
  sl.registerSingleton<UserAuthRepository>(AuthRepositoryImpl());
  sl.registerSingleton<HomeRepository>(HomeRepositoryImpl());
  sl.registerSingleton<ProductReository>(ProductRepositoryImpl());
  sl.registerSingleton<CustomerRepository>(CustomerRepositoryImpl());
}
