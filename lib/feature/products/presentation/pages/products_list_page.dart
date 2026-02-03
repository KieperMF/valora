import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:my_sales/core/colors/app_colors.dart';
import 'package:my_sales/core/routes/routes_name.dart';
import 'package:my_sales/feature/products/domain/entities/product_entity.dart';
import 'package:my_sales/feature/products/presentation/controllers/product_controller.dart';
import 'package:provider/provider.dart';

class ProductsListPage extends StatefulWidget {
  const ProductsListPage({super.key});

  @override
  State<ProductsListPage> createState() => _ProductsListPageState();
}

class _ProductsListPageState extends State<ProductsListPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ProductController>().fetchProducts();
    });
  }

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<ProductController>();
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        title: Center(
          child: const Text(
            'Produtos',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () => controller.fetchProducts(),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Stack(
              children: [
                Column(
                  children: [
                    controller.products.isEmpty
                        ? SingleChildScrollView(
                            physics: AlwaysScrollableScrollPhysics(),
                            child: SizedBox(
                              height: 200.h,
                              child: Center(
                                child: Text(
                                  'Nenhum produto cadastrado.',
                                  style: TextStyle(fontSize: 16.h),
                                ),
                              ),
                            ),
                          )
                        : Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                buildStockInfo(
                                  totalProducts: controller.products.length,
                                ),
                                SizedBox(height: 12.h),

                                ListView.builder(
                                  physics: AlwaysScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: controller.products.length,
                                  itemBuilder: (context, index) {
                                    final product = controller.products[index];
                                    return Padding(
                                      padding: EdgeInsetsGeometry.only(
                                        bottom: 12.h,
                                      ),
                                      child: buildProductItem(product: product),
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
                    style: ElevatedButton.styleFrom(
                      shape: CircleBorder(),
                      padding: EdgeInsets.all(8.h),
                      backgroundColor: AppColors.primaryBlueColor,
                    ),
                    onPressed: () => context.go(RoutesName.registerProduct),
                    child: Icon(Icons.add, size: 32.h, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildProductItem({required ProductEntity product}) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.h),
                ),
                SizedBox(height: 8.h),
                Text('Marca: ${product.brand}'),
                SizedBox(height: 8.h),
                Text(
                  'R\$ ${product.price.toStringAsFixed(2).replaceFirst(".", ",")}',
                ),
              ],
            ),
            Align(
              alignment: AlignmentGeometry.bottomCenter,
              child: Text("Estoque: ${product.quantity}"),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildStockInfo({required int totalProducts}) {
    return Align(
      alignment: AlignmentGeometry.topLeft,
      child: SizedBox(
        width: 230.h,
        child: Card(
          color: Colors.green,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(LucideIcons.box, color: Colors.white),
                      SizedBox(width: 8),
                      Text(
                        'Total de Produtos',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.h,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    ' $totalProducts',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.h,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
