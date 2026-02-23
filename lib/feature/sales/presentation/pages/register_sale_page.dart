import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:valora/feature/sales/domain/entities/sale_entity.dart';
import 'package:valora/feature/sales/presentation/controllers/sale_controller.dart';

class RegisterSalePage extends StatefulWidget {
  const RegisterSalePage({super.key});

  @override
  State<RegisterSalePage> createState() => _RegisterSalePageState();
}

class _RegisterSalePageState extends State<RegisterSalePage> {
  SaleEntity sale = SaleEntity.toEmpty();

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<SaleController>();
    return Scaffold(
      appBar: AppBar(title: const Text('Register Sale')),
      body: Column(
        children: [
          TextField(decoration: const InputDecoration(labelText: 'Product')),
          TextField(
            decoration: const InputDecoration(labelText: 'Quantity'),
            keyboardType: TextInputType.number,
          ),
          ElevatedButton(
            onPressed: () {
              controller.registerSale(newSale: sale);
            },
            child: const Text('Register Sale'),
          ),
        ],
      ),
    );
  }
}
