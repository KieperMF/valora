import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:valora/core/colors/app_colors.dart';
import 'package:valora/core/routes/routes_name.dart';
import 'package:valora/feature/customer/domain/entities/customer_entity.dart';
import 'package:valora/feature/customer/domain/validators/new_customer_validator.dart';
import 'package:valora/feature/customer/presentation/controllers/customer_controller.dart';

class CustomerRegisterPage extends StatefulWidget {
  const CustomerRegisterPage({super.key});

  @override
  State<CustomerRegisterPage> createState() => _CustomerRegisterPageState();
}

class _CustomerRegisterPageState extends State<CustomerRegisterPage> {
  final _formKey = GlobalKey<FormState>();
  CustomerEntity customer = CustomerEntity.toEmpty();
  final validator = NewCustomerValidator();
  final controller = CustomerController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Center(
          child: const Text(
            'Register Customer',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        leading: IconButton(
          onPressed: () => context.go(RoutesName.home),
          icon: Icon(LucideIcons.arrowLeft),
        ),
        backgroundColor: AppColors.background,
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextFormField(
                        onChanged: customer.setName,
                        validator: validator.byField(customer, "name"),
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
                        onChanged: customer.setPhone,
                        decoration: InputDecoration(
                          constraints: BoxConstraints(maxHeight: 60),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          label: Text("Telefone (Opcional)"),
                        ),
                        style: TextStyle(),
                      ),
                      TextFormField(
                        onChanged: (value) {
                          customer.setBill(double.tryParse(value) ?? 0.0);
                        },
                        decoration: InputDecoration(
                          constraints: BoxConstraints(maxHeight: 60),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          label: Text("Dívida (Opcional)"),
                        ),
                        style: TextStyle(),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    if (_formKey.currentState!.validate()) {
                      final result = await controller.addCustomer(
                        customer: customer,
                      );
                      result.onSuccess((onSuccess) {
                        context.go(RoutesName.home);
                      });
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
                        "Salvar Cliente",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.h,
                        ),
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
