import 'package:valora/feature/products/data/dto/product_dto.dart';
import 'package:valora/feature/products/domain/entities/product_entity.dart';

extension ProductDtoMapper on ProductDto {
  ProductEntity toEntity() {
    return ProductEntity(
      id: id,
      name: name,
      brand: brand,
      companyId: companyId,
      price: price,
      quantity: quantity,
      createdAt: createdAt,
    );
  }
}

extension ProductEntityMapper on ProductEntity {
  ProductDto toDto() {
    return ProductDto(
      id: id,
      name: name,
      brand: brand,
      companyId: companyId,
      price: price,
      quantity: quantity,
      createdAt: createdAt,
    );
  }
}
