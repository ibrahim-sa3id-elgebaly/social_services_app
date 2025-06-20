import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButtonSettings extends StatelessWidget {
  String iconName;
  IconData icon;
  Function()? onTap;

  CustomButtonSettings({
    super.key,
    required this.onTap,
    required this.iconName,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Row(
          children: [
            SizedBox(width: 18.w),
            Icon(
              icon,
              size: 28.r,
              color: Theme.of(context).colorScheme.secondary,
            ),
            SizedBox(width: 20.w),
            Text(iconName, style: Theme.of(context).textTheme.titleLarge),
          ],
        ),
      ),
    );
  }
}
