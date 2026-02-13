import 'package:valora/feature/sales/data/dto/sale_items_dto.dart';

class SaleDto {
  String? id;
  String customerId;
  String companyId;
  double totalPrice;
  int quantity;
  String paymentMethod;
  String customerName;
  List<SaleItemsDto> items;

  SaleDto({
    this.id,
    required this.customerId,
    required this.companyId,
    required this.totalPrice,
    required this.quantity,
    required this.paymentMethod,
    required this.customerName,
    this.items = const [],
  });

  factory SaleDto.fromJson(Map<String, dynamic> json) {
    return SaleDto(
      id: json['id'],
      customerId: json['customer_id'],
      companyId: json['company_id'],
      totalPrice: json['total'],
      quantity: json['quantity'],
      paymentMethod: json['payment_method'],
      customerName: json['customer_name'],
      items: (json['sale_items'] as List)
          .map((item) => SaleItemsDto.fromJson(item))
          .toList(),
    );
  }

  factory SaleDto.toEmpty() {
    return SaleDto(
      customerId: "",
      companyId: "",
      totalPrice: 0,
      quantity: 0,
      paymentMethod: "",
      customerName: "",
      items: [],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "customer_id": customerId,
      "company_id": companyId,
      "total": totalPrice,
      "quantity": quantity,
      "payment_method": paymentMethod,
      "customer_name": customerName,
    };
  }
}
