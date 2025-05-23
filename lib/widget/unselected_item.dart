import 'package:flutter/material.dart';

class UnSelectedItem extends StatelessWidget {
  String unselected;
  UnSelectedItem(this.unselected, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(unselected,style: Theme.of(context).textTheme.displayMedium?.copyWith(
      fontWeight: FontWeight.w400
    ),);
  }
}
