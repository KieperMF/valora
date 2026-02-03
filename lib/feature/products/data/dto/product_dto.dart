class ProductDto {
  String? id;
  String companyId;
  final String name;
  final String brand;
  final double price;
  final int quantity;
  String? createdAt;

  ProductDto({
    this.id,
    required this.name,
    required this.brand,
    required this.companyId,
    required this.price,
    required this.quantity,
    required this.createdAt,
  });

  factory ProductDto.fromJson(Map<String, dynamic> data) {
    return ProductDto(
      id: data["id"],
      name: data["name"],
      brand: data["brand"],
      companyId: data["company_id"],
      price: data["price"],
      quantity: data["quantity"],
      createdAt: data["created_at"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "brand": brand,
      "company_id": companyId,
      "price": price,
      "quantity": quantity,
    };
  }
}
