import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:valora/feature/customer/presentation/pages/customer_list_page.dart';
import 'package:valora/feature/home/presentation/controllers/home_controller.dart';
import 'package:valora/feature/products/presentation/pages/products_list_page.dart';
import 'package:valora/feature/sales/presentation/pages/sales_list_page.dart';

class HomeNavigation extends StatelessWidget {
  HomeNavigation({super.key});
  final controller = HomeController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Observer(
        builder: (context) {
          return IndexedStack(
            index: controller.currentIndex,
            children: const [
              SalesListPage(),
              CustomerListPage(),
              ProductsListPage(),
            ],
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: controller.currentIndex,
        onTap: controller.changeTab,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.shopify_sharp),
            label: 'Vendas',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.supervisor_account),
            label: 'Clientes',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Produtos'),
        ],
      ),
    );
  }
}
