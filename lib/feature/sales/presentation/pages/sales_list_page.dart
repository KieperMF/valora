import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:valora/feature/sales/presentation/controllers/sale_controller.dart';

class SalesListPage extends StatefulWidget {
  const SalesListPage({super.key});

  @override
  State<SalesListPage> createState() => _SalesListPageState();
}

class _SalesListPageState extends State<SalesListPage> {
  @override
  Widget build(BuildContext context) {
    final controller = context.watch<SaleController>();
    return Scaffold(
      appBar: AppBar(title: const Text('Sales List')),
      body: RefreshIndicator(
        onRefresh: () => controller.featchSales(),
        child: Column(
          children: [
            controller.sales.isEmpty
                ? Center(
                    child: SingleChildScrollView(
                      physics: AlwaysScrollableScrollPhysics(),
                      child: SizedBox(
                        height: 200,
                        child: Center(child: Text('No sales found.')),
                      ),
                    ),
                  )
                : Expanded(
                    child: Column(
                      children: [
                        ListView.builder(
                          itemCount: controller.sales.length,
                          itemBuilder: (context, index) {
                            final sale = controller.sales[index];
                            return ListTile(
                              title: Text(
                                'Customer name: ${sale.customerName}',
                              ),
                              subtitle: Text('Total: \$${sale.totalPrice}'),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
