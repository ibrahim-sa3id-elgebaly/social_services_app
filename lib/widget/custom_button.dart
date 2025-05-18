import 'package:flutter/material.dart';
import '../core/style/app_colors.dart';

typedef AuthFunction=void Function();
class CustomButton extends StatelessWidget {
  String label;
  AuthFunction onClick;

  CustomButton({super.key, required this.label,required this.onClick});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.8,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(26),
      ),
      child: TextButton(
        onPressed: onClick,
        child: Text(label, style: const TextStyle(color: Colors.white, fontSize: 20),),
      ),
    );
  }
}
