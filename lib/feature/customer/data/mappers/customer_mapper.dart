import 'package:my_sales/feature/customer/data/dtos/customer_dto.dart';
import 'package:my_sales/feature/customer/domain/entities/customer_entity.dart';

extension CustomerMapperDto on CustomerDto {
  CustomerEntity toEntity() {
    return CustomerEntity(
      name: name,
      phone: phone,
      bill: bill,
      id: id,
      companyId: companyId,
      totalSpend: totalSpend,
    );
  }
}

extension CustomerMapperEntity on CustomerEntity {
  CustomerDto toDto() {
    return CustomerDto(
      name: name,
      phone: phone,
      bill: bill,
      totalSpend: totalSpend,
    );
  }
}
