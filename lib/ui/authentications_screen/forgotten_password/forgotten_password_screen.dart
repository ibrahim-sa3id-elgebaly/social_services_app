import 'package:flutter/material.dart';
import '../../../core/style/app_colors.dart';


class ForgottenPasswordScreen extends StatelessWidget {
  static const String routeName = "forgotten password screen";
  const ForgottenPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryLightColor,
        title: const Text("Forgotten Password"),
        centerTitle: true,
        titleTextStyle: const TextStyle(
            color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        iconTheme: IconThemeData(
            color: Colors.white
        ),
      ),
      body: Container(
        color: Colors.red,
      ),
    );
  }
}
