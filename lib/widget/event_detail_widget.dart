import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../core/style/app_colors.dart';

class EventDetailWidget extends StatelessWidget {
  String value;
  IconData? icon;

  EventDetailWidget({super.key,required this.value,this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 28,
            color: AppColors.secondaryLightColor,
          ),
          SizedBox(height: 4.h),
          Text(
            value,
            style: Theme.of(context).textTheme.titleSmall,
          ),

        ],
      ),
    );
  }
}
