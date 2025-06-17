import 'package:flutter/material.dart';

class SkipButton extends StatelessWidget {
  String text;
  void Function()? onPressed;
  SkipButton({super.key,required this.onPressed,required this.text});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: TextButton(
          onPressed: onPressed,
          child: Text(text,style: TextStyle(
              color: Theme.of(context).colorScheme.secondary,
          ),)
      ),
    );
  }
}
