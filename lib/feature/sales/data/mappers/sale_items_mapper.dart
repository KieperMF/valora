import 'package:valora/feature/sales/data/dto/sale_items_dto.dart';
import 'package:valora/feature/sales/domain/entities/sale_items_entity.dart';

extension SaleItemsEntityMapper on SaleItemsEntity {
  SaleItemsDto toDto() => SaleItemsDto(
    productId: productId,
    subTotalPrice: subTotalPrice,
    quantity: quantity,
    unitPrice: unitPrice,
    saleId: saleId,
    id: id,
  );
}

extension SaleItemsDtoMapper on SaleItemsDto {
  SaleItemsEntity toEntity() => SaleItemsEntity(
    productId: productId,
    subTotalPrice: subTotalPrice,
    quantity: quantity,
    unitPrice: unitPrice,
    saleId: saleId,
    id: id,
  );
}
