class CustomerDto {
  String? id;
  String? companyId;
  final String name;
  final String phone;
  final double bill;
  double totalSpend;

  CustomerDto({
    this.id,
    this.companyId,
    required this.name,
    required this.phone,
    required this.bill,
    required this.totalSpend,
  });

  factory CustomerDto.fromMap(Map<String, dynamic> map) {
    return CustomerDto(
      id: map['id'],
      name: map['name'],
      phone: map['phone'],
      bill: map['bill'],
      companyId: map['company_id'],
      totalSpend: map['total_spend'] ?? 0.0,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'company_id': companyId,
      'name': name,
      'phone': phone,
      'bill': bill,
    };
  }
}
