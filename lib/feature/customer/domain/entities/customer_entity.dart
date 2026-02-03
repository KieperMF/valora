class CustomerEntity {
  String? id;
  String? companyId;
  String name;
  String phone;
  double bill;
  double totalSpend;

  CustomerEntity({
    this.id,
    this.companyId,
    required this.name,
    required this.phone,
    required this.bill,
    required this.totalSpend,
  });

  factory CustomerEntity.toEmpty() {
    return CustomerEntity(
      name: '',
      phone: '',
      bill: 0.0,
      totalSpend: double.infinity,
    );
  }

  String setName(String value) => name = value;
  String setPhone(String value) => phone = value;
  double setBill(double value) => bill = value;
}
