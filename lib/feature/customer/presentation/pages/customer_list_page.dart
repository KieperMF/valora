import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:my_sales/core/colors/app_colors.dart';
import 'package:my_sales/core/routes/routes_name.dart';
import 'package:my_sales/feature/customer/presentation/controllers/customer_controller.dart';
import 'package:provider/provider.dart';

class CustomerListPage extends StatefulWidget {
  const CustomerListPage({super.key});

  @override
  State<CustomerListPage> createState() => _CustomerListPageState();
}

class _CustomerListPageState extends State<CustomerListPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPersistentFrameCallback((_) {
      context.read<CustomerController>().getCustomers();
    });
  }

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<CustomerController>();
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Center(
          child: const Text(
            'Clientes',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        backgroundColor: AppColors.background,
      ),
      body: Padding(
        padding: EdgeInsetsGeometry.all(12),
        child: Stack(
          children: [
            Builder(
              builder: (context) {
                return RefreshIndicator(
                  onRefresh: () => controller.getCustomers(),
                  child: Column(
                    children: [
                      controller.customers.isEmpty
                          ? Center(
                              child: Text(
                                'Nenhum cliente cadastrado.',
                                style: TextStyle(fontSize: 16),
                              ),
                            )
                          : Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color: Colors.white,
                                    ),
                                    child: Text(
                                      'Total de clientes em débito: ${controller.customerInDebt}',
                                    ),
                                  ),
                                  ...List.generate(controller.customers.length, (
                                    index,
                                  ) {
                                    final customer =
                                        controller.customers[index];
                                    return Center(
                                      child: Card(
                                        margin: EdgeInsetsGeometry.only(
                                          top: 8.h,
                                          bottom: 8.h,
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(12.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    customer.name,
                                                    style: TextStyle(
                                                      fontSize: 16.h,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  SizedBox(height: 4.h),
                                                  Text(
                                                    'Telefone: ${customer.phone.isEmpty ? 'N/A' : customer.phone}',
                                                    style: TextStyle(
                                                      fontSize: 14.h,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Text(
                                                'Débito: R\$ ${customer.bill.toStringAsFixed(2)}',
                                                style: TextStyle(
                                                  fontSize: 14.h,
                                                  color: customer.bill > 0
                                                      ? Colors.red
                                                      : Colors.green,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  }),
                                ],
                              ),
                            ),
                    ],
                  ),
                );
              },
            ),
            Align(
              alignment: AlignmentGeometry.bottomRight,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: CircleBorder(),
                  padding: EdgeInsets.all(8.h),
                  backgroundColor: AppColors.primaryBlueColor,
                ),
                onPressed: () => context.go(RoutesName.customerRegister),
                child: Icon(Icons.add, size: 32.h, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
