import 'package:flutter/cupertino.dart';
import 'package:valora/feature/customer/data/dtos/customer_dto.dart';
import 'package:result_dart/result_dart.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CustomerDatasource {
  final supa = Supabase.instance.client;
  AsyncResult<List<CustomerDto>> getCustomers() async {
    try {
      final response = await supa.from('customers').select();

      return Success(response.map((e) => CustomerDto.fromMap(e)).toList());
    } catch (e) {
      return Failure(Exception(e));
    }
  }

  AsyncResult<Unit> addCustomer(CustomerDto dto) async {
    try {
      dto.companyId = supa.auth.currentUser?.id;
      await supa.from('customers').insert(dto.toMap());

      return Success(unit);
    } catch (e) {
      debugPrint(e.toString());
      return Failure(Exception(e));
    }
  }
}
