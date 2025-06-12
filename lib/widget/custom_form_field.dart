import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

typedef ValidatorType =String? Function(String?);
class CustomFormField extends StatefulWidget {
  String label;
  TextInputType keyboard;
  bool isPassword;
  String? Function(String?) validate;
  TextEditingController controller;
  int? maxLength;
  int? maxLines;

  CustomFormField({
    super.key,
    required this.label,
    required this.keyboard,
    this.isPassword = false,
    required this.validate,
    required this.controller,
    this.maxLength,
    this.maxLines=1
  });

  @override
  State<CustomFormField> createState() => _CustomFormFieldState();
}

class _CustomFormFieldState extends State<CustomFormField> {
  bool isObscured = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLength: widget.maxLength,
      maxLines: widget.maxLines,
      controller: widget.controller,
      validator: widget.validate,
      keyboardType: widget.keyboard,
      style: Theme.of(context).textTheme.labelSmall?.copyWith(fontSize: 18),
      obscuringCharacter: "*",
      obscureText: widget.isPassword == true ? isObscured : false,
      decoration: InputDecoration(
        counterText: "",
        suffixIcon: widget.isPassword
            ? IconButton(
                onPressed: () {
                  setState(() {
                    isObscured = !isObscured;
                  });
                },
                icon: Icon(
                  isObscured
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                  color: Theme.of(context).colorScheme.primary,
                  size: 25.r,
                ))
            : null,
        labelText: widget.label,
        labelStyle: Theme.of(context).textTheme.labelSmall,
          border: buildBorder(Theme.of(context).colorScheme.primary),
          focusedBorder: buildBorder(Theme.of(context).colorScheme.onPrimary)
      ),
    );
  }

  OutlineInputBorder buildBorder([color]) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(color: color ?? Colors.white),
    );
  }


}
