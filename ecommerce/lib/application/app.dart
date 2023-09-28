
import 'package:ecommerce/application/state_holder_bindings.dart';
import 'package:ecommerce/presentation/ui/screen/splash_screen.dart';
import 'package:ecommerce/presentation/ui/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CraftBay extends StatelessWidget {
  const CraftBay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: const SplashScreen(),
      initialBinding: StateHolderBinder(),
      theme: ThemeData(
          primarySwatch:
          MaterialColor(AppColors.primaryColor.value, AppColors().color),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 12),
              textStyle: const TextStyle(
                  fontSize: 16, letterSpacing: 0.5, fontWeight: FontWeight.w600),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          inputDecorationTheme: const InputDecorationTheme(
            contentPadding: EdgeInsets.symmetric(horizontal: 16),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey)
            ),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey)
            ),
            disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey)
            ),
          )
      ),
    );
  }
}