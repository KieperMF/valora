class SaleItemsDto {
  String? id;
  String saleId;
  String productId;
  double subTotalPrice;
  int quantity;
  double unitPrice;

  SaleItemsDto({
    this.id,
    required this.saleId,
    required this.productId,
    required this.subTotalPrice,
    required this.quantity,
    required this.unitPrice,
  });

  factory SaleItemsDto.toEmpty() => SaleItemsDto(
    saleId: "",
    productId: "",
    subTotalPrice: 0,
    quantity: 0,
    unitPrice: 0,
  );

  factory SaleItemsDto.fromJson(Map<String, dynamic> json) {
    return SaleItemsDto(
      id: json['id'],
      saleId: json['sale_id'],
      productId: json['product_id'],
      subTotalPrice: json['subtotal'],
      quantity: json['quantity'],
      unitPrice: json['unit_price'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "sale_id": saleId,
      "product_id": productId,
      "subtotal": subTotalPrice,
      "quantity": quantity,
      "unit_price": unitPrice,
    };
  }
}
