import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:valora/core/routes/routes_name.dart';
import 'package:valora/feature/sales/presentation/controllers/sale_controller.dart';

class RegisterSalePage extends StatefulWidget {
  const RegisterSalePage({super.key});

  @override
  State<RegisterSalePage> createState() => _RegisterSalePageState();
}

class _RegisterSalePageState extends State<RegisterSalePage> {
  @override
  Widget build(BuildContext context) {
    final controller = context.watch<SaleController>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register Sale'),
        leading: IconButton(
          onPressed: () {
            context.go(RoutesName.home);
          },
          icon: Icon(Icons.chevron_left),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                TextField(
                  decoration: const InputDecoration(labelText: 'Product'),
                ),
                TextField(
                  decoration: const InputDecoration(labelText: 'Quantity'),
                  keyboardType: TextInputType.number,
                ),
                DropdownButton<String>(
                  value: controller.paymentMethods.first,
                  items: controller.paymentMethods
                      .map(
                        (method) => DropdownMenuItem(
                          value: method,
                          child: Text(method),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    controller.setPaymentMethod(value!);
                  },
                ),
                Align(
                  alignment: AlignmentGeometry.bottomCenter,
                  child: TextButton(
                    onPressed: () {
                      controller.registerSale(newSale: controller.saleRegister);
                    },
                    child: const Text('Register Sale'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
