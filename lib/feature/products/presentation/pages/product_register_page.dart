import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:valora/core/colors/app_colors.dart';
import 'package:valora/core/routes/routes_name.dart';
import 'package:valora/feature/products/domain/entities/product_entity.dart';
import 'package:valora/feature/products/domain/validators/product_validator.dart';
import 'package:valora/feature/products/presentation/controllers/product_controller.dart';
import 'package:provider/provider.dart';

class ProductRegisterPage extends StatefulWidget {
  const ProductRegisterPage({super.key});

  @override
  State<ProductRegisterPage> createState() => _ProductRegisterPageState();
}

class _ProductRegisterPageState extends State<ProductRegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final product = ProductEntity.toEmpty();
  final validator = ProductValidator();
  final quantityCtl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<ProductController>();
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        title: Center(
          child: const Text(
            'Cadastrar Produto',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        leading: IconButton(
          onPressed: () => context.go(RoutesName.home),
          icon: Icon(LucideIcons.arrowLeft),
        ),
      ),
      body: Form(
        key: _formKey,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                Expanded(
                  child: Column(
                    spacing: 12.h,
                    mainAxisAlignment: .center,
                    children: [
                      TextFormField(
                        onChanged: product.setName,
                        validator: validator.byField(product, "name"),
                        decoration: InputDecoration(
                          constraints: BoxConstraints(maxHeight: 60),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          label: Text("Nome"),
                        ),
                        style: TextStyle(),
                      ),
                      TextFormField(
                        onChanged: (value) {
                          product.setPrice(double.tryParse(value) ?? 0.0);
                        },
                        validator: validator.byField(product, "price"),
                        keyboardType: TextInputType.numberWithOptions(
                          decimal: true,
                        ),
                        decoration: InputDecoration(
                          constraints: BoxConstraints(maxHeight: 60),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          label: Text("Preço"),
                        ),
                        style: TextStyle(),
                      ),
                      TextFormField(
                        onChanged: product.setBrand,
                        validator: validator.byField(product, "brand"),
                        decoration: InputDecoration(
                          constraints: BoxConstraints(maxHeight: 60),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          label: Text("Marca"),
                        ),
                        style: TextStyle(),
                      ),
                      TextFormField(
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        onChanged: (value) {
                          product.setQuantity(int.parse(value));
                        },
                        validator: validator.byField(product, "name"),
                        keyboardType: TextInputType.numberWithOptions(
                          decimal: false,
                          signed: false,
                        ),
                        decoration: InputDecoration(
                          constraints: BoxConstraints(maxHeight: 60),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          label: Text("Quantidade"),
                        ),
                        style: TextStyle(),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    if (_formKey.currentState!.validate()) {
                      final result = await controller.registerProduct(product);
                      result.onSuccess(
                        (onSuccess) => context.go(RoutesName.home),
                      );
                    }
                  },
                  child: Container(
                    height: 48.h,
                    decoration: BoxDecoration(
                      color: AppColors.primaryBlueColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Text(
                        "Salvar Produto",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.h,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16.h),
                GestureDetector(
                  onTap: () => context.go(RoutesName.home),
                  child: Container(
                    height: 48.h,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Text(
                        "Cancelar",
                        style: TextStyle(color: Colors.black, fontSize: 16.h),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
