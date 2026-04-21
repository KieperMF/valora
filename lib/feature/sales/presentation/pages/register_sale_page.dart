import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:textfield_search/textfield_search.dart';
import 'package:valora/core/routes/routes_name.dart';
import 'package:valora/feature/customer/domain/entities/customer_entity.dart';
import 'package:valora/feature/sales/presentation/controllers/sale_controller.dart';

class RegisterSalePage extends StatefulWidget {
  const RegisterSalePage({super.key});

  @override
  State<RegisterSalePage> createState() => _RegisterSalePageState();
}

class _RegisterSalePageState extends State<RegisterSalePage> {
  final controller = SaleController();
  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
      body: ListenableBuilder(
        listenable: controller,
        builder: (context, _) {
          return Column(
            children: [
              Expanded(
                child: Column(
                  children: [
                    TextFieldSearch(
                      label: 'Cliente',
                      controller: searchController,

                      future: () async {
                        List<CustomerEntity> customers = await controller
                            .getCustomers(name: searchController.text);

                        return customers
                            .map(
                              (customer) => SearchItem(
                                label: customer.name,
                                value: customer,
                              ),
                            )
                            .toList();
                      },
                      getSelectedValue: (SearchItem<CustomerEntity> selected) {
                        searchController.text = selected.label;
                        debugPrint('Selected customer: ${selected.value}');
                      },
                    ),
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
                          controller.registerSale(
                            newSale: controller.saleRegister,
                          );
                        },
                        child: const Text('Register Sale'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class SearchItem<T> {
  final String label;
  final T value;

  SearchItem({required this.label, required this.value});

  @override
  String toString() => label;
}
