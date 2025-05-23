import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../core/style/app_colors.dart';

typedef AuthFunction = void Function();

class CustomButton extends StatefulWidget {
  String label;
  AuthFunction onClick;

  CustomButton({super.key, required this.label, required this.onClick});

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.8.w,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(26.r),
      ),
      child: TextButton(
        onPressed: widget.onClick,
        child: Text(
          widget.label,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
