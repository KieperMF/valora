import 'package:flutter/material.dart';
import 'package:valora/feature/customer/presentation/pages/customer_list_page.dart';
import 'package:valora/feature/home/presentation/controllers/home_controller.dart';
import 'package:valora/feature/home/presentation/pages/home_page.dart';
import 'package:valora/feature/products/presentation/pages/products_list_page.dart';
import 'package:provider/provider.dart';

class HomeNavigation extends StatelessWidget {
  const HomeNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<HomeController>();

    return Scaffold(
      body: IndexedStack(
        index: controller.currentIndex,
        children: const [HomePage(), CustomerListPage(), ProductsListPage()],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: controller.currentIndex,
        onTap: controller.changeTab,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
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
