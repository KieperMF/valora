import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:valora/core/routes/routes_name.dart';
import 'package:valora/feature/auth/domain/entities/user_auth_entity.dart';
import 'package:valora/feature/auth/domain/validators/user_auth_validation.dart';
import 'package:valora/feature/auth/presentation/controller/auth_controller.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final validator = UserAuthValidation();
  final user = UserAuthEntity.toEmpty();
  final _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<AuthController>();
    return Scaffold(
      body: Form(
        key: _key,
        child: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: SizedBox(
                height: double.infinity,
                child: Column(
                  children: [
                    Align(
                      alignment: AlignmentGeometry.topCenter,
                      child: Row(
                        spacing: 12,
                        mainAxisAlignment: .center,
                        children: [
                          Image.asset(
                            "assets/sales_icon.png",
                            height: 64,
                            width: 64,
                          ),
                          Text(
                            "Valora",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: .center,
                        crossAxisAlignment: .center,
                        children: [
                          TextFormField(
                            onChanged: user.setEmail,
                            validator: validator.byField(user, "email"),
                            decoration: InputDecoration(
                              constraints: BoxConstraints(maxHeight: 60),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              label: Text("E-mail"),
                            ),
                            style: TextStyle(),
                          ),
                          SizedBox(height: 32.h),
                          TextFormField(
                            onChanged: user.setPassword,
                            validator: validator.byField(user, 'password'),
                            obscureText: controller.showPassword,
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.lock),
                              suffixIcon: IconButton(
                                onPressed: controller.setShowPassword,
                                icon: Icon(
                                  controller.showPassword
                                      ? LucideIcons.eyeOff
                                      : LucideIcons.eye,
                                ),
                              ),
                              constraints: BoxConstraints(maxHeight: 60),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              label: Text("Senha"),
                            ),
                            style: TextStyle(),
                          ),
                          SizedBox(height: 40.h),
                          GestureDetector(
                            onTap: () async {
                              HapticFeedback.vibrate();

                              if (_key.currentState!.validate()) {
                                final result = await controller.login(
                                  user: user,
                                );
                                debugPrint("Login result: $result");
                                result ? context.go(RoutesName.home) : null;
                              }
                            },
                            child: Container(
                              height: 48.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: Color(0xfff1e90ff),
                              ),
                              child: Center(
                                child: Text(
                                  "Login",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 40.h),
                          TextButton(
                            onPressed: () {
                              context.go(RoutesName.signup);
                            },
                            child: Text(
                              "Criar conta",
                              style: TextStyle(color: Color(0xfff008b8b)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
