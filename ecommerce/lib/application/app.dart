import 'package:ecommerce/application/state_holder_bindings.dart';
import 'package:ecommerce/presentation/ui/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../presentation/ui/screen/splash_screen.dart';

class CraftBay extends StatefulWidget {
  static GlobalKey<NavigatorState> globalKey = GlobalKey<NavigatorState>();

  const CraftBay({Key? key}) : super(key: key);

  @override
  State<CraftBay> createState() => _CraftBayState();
}

class _CraftBayState extends State<CraftBay> {

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      navigatorKey: CraftBay.globalKey,
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