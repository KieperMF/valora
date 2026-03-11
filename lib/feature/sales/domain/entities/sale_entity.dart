import 'package:valora/feature/sales/domain/entities/sale_items_entity.dart';

class SaleEntity {
  String? id;
  String customerId;
  String companyId;
  double totalPrice;
  int quantity;
  String paymentMethod;
  String customerName;
  List<SaleItemsEntity> items;

  SaleEntity({
    this.id,
    required this.customerId,
    required this.companyId,
    required this.totalPrice,
    required this.quantity,
    required this.paymentMethod,
    required this.customerName,
    this.items = const [],
  });

  factory SaleEntity.toEmpty() {
    return SaleEntity(
      customerId: "",
      companyId: "",
      totalPrice: 0,
      quantity: 0,
      paymentMethod: "",
      customerName: "",
      items: List.empty(),
    );
  }

  SaleEntity copyWith({
    String? paymentMethod,
    String? customerName,
    List<SaleItemsEntity>? items,
    String? id,
    String? customerId,
    String? companyId,
    double? totalPrice,
    int? quantity,
  }) {
    return SaleEntity(
      id: id,
      customerId: customerId ?? this.customerId,
      companyId: companyId ?? this.companyId,
      totalPrice: totalPrice ?? this.totalPrice,
      quantity: quantity ?? this.quantity,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      customerName: customerName ?? this.customerName,
      items: items ?? this.items,
    );
  }

  set setId(String? value) {
    id = value;
  }

  set setCustomerId(String value) {
    customerId = value;
  }

  set setCompanyId(String value) {
    companyId = value;
  }

  set setTotalPrice(double value) {
    totalPrice = value;
  }

  set setQuantity(int value) {
    quantity = value;
  }

  set setPaymentMethod(String value) {
    paymentMethod = value;
  }

  set setCustomerName(String value) {
    customerName = value;
  }
}
