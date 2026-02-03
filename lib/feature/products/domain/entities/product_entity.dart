class ProductEntity {
  String? id;
  String companyId;
  String name;
  String brand;
  double price;
  int quantity;
  String? createdAt;

  ProductEntity({
    this.id,
    required this.name,
    required this.brand,
    required this.companyId,
    required this.price,
    required this.quantity,
    required this.createdAt,
  });

  factory ProductEntity.toEmpty() {
    return ProductEntity(
      name: '',
      brand: '',
      companyId: '',
      price: 0.0,
      quantity: 0,
      createdAt: '',
    );
  }

  String setName(String value) => name = value;
  String setBrand(String value) => brand = value;
  double setPrice(double value) => price = value;
  int setQuantity(int value) => quantity = value;
}
