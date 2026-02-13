import 'package:result_dart/result_dart.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:valora/feature/sales/data/dto/sale_dto.dart';

class SalesDatasource {
  final _supa = Supabase.instance.client;

  AsyncResult<Unit> createSale({required SaleDto sale}) async {
    try {
      sale.companyId = _supa.auth.currentUser!.id;
      final insertedSale = await _supa.from("sales").insert(sale.toMap());
      final String newSaleId = insertedSale['id'];

      final itemsMap = sale.items.map((item) {
        final map = item.toMap();
        map['sale_id'] = newSaleId;
        return map;
      }).toList();
      await _supa.from('sale_items').insert(itemsMap);
      return Success(unit);
    } catch (e) {
      return Failure(Exception(e));
    }
  }

  AsyncResult<List<SaleDto>> getSales() async {
    try {
      final response = await _supa
          .from('sales')
          .select('*, sale_items(*)')
          .eq('company_id', _supa.auth.currentUser!.id);

      final sales = response.map((json) => SaleDto.fromJson(json)).toList();

      return Success(sales);
    } catch (e) {
      return Failure(Exception(e));
    }
  }
}
