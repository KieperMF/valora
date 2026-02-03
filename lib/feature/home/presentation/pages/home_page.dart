import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:my_sales/core/colors/app_colors.dart';
import 'package:my_sales/feature/home/presentation/controllers/home_controller.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<HomeController>();
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        title: Text("home"),
        actions: [
          IconButton(
            onPressed: () => controller.logoutUser(),
            icon: Icon(LucideIcons.logOut),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            Row(children: [

              ],
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: .center,
                children: [const Text('Work in progress')],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
