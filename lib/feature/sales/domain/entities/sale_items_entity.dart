class SaleItemsEntity {
  String? id;
  String saleId;
  String productId;
  double subTotalPrice;
  int quantity;
  double unitPrice;

  SaleItemsEntity({
    this.id,
    required this.saleId,
    required this.productId,
    required this.subTotalPrice,
    required this.quantity,
    required this.unitPrice,
  });

  factory SaleItemsEntity.toEmpty() => SaleItemsEntity(
    saleId: "",
    productId: "",
    subTotalPrice: 0,
    quantity: 0,
    unitPrice: 0,
  );
}
