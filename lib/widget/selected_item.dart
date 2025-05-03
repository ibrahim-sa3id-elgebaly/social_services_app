import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SelectedItem extends StatelessWidget {
  String selected;
  SelectedItem(this.selected);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(selected,style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            fontSize: 20.sp
        ),),
        Icon(
          Icons.check,
          size: 30,
          color: Theme.of(context).colorScheme.secondary,
        ),
      ],
    );
  }
}
