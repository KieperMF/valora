import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
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
      appBar: AppBar(
        title: const Text('Sales List'),
        actions: [
          IconButton(
            onPressed: () async {
              await controller.logout();
            },
            icon: Icon(LucideIcons.logOut),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () => controller.featchSales(),
        child: Stack(
          children: [
            Column(
              children: [
                controller.sales.isEmpty
                    ? Expanded(
                        child: Center(
                          child: SingleChildScrollView(
                            physics: AlwaysScrollableScrollPhysics(),
                            child: SizedBox(
                              height: 200,
                              child: Center(child: Text('No sales found.')),
                            ),
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
            Align(
              alignment: AlignmentGeometry.bottomRight,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('Registrar venda'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
