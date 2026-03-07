import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:valora/core/colors/app_colors.dart';
import 'package:valora/feature/home/presentation/controllers/home_controller.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final controller = HomeController();

  @override
  Widget build(BuildContext context) {
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(children: [

              ],
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [const Text('Work in progress')],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
