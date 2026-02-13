import 'package:valora/feature/sales/data/dto/sale_dto.dart';
import 'package:valora/feature/sales/data/mappers/sale_items_mapper.dart';
import 'package:valora/feature/sales/domain/entities/sale_entity.dart';

extension SaleEntityMapper on SaleEntity {
  SaleDto toDto() => SaleDto(
    id: id,
    totalPrice: totalPrice,
    companyId: companyId,
    customerId: customerId,
    paymentMethod: paymentMethod,
    quantity: quantity,
    customerName: customerName,
    items: items.map((item) => item.toDto()).toList(),
  );
}

extension SaleDtoMapper on SaleDto {
  SaleEntity toEntity() => SaleEntity(
    id: id,
    totalPrice: totalPrice,
    companyId: companyId,
    customerId: customerId,
    paymentMethod: paymentMethod,
    quantity: quantity,
    customerName: customerName,
    items: items.map((item) => item.toEntity()).toList(),
  );
}
