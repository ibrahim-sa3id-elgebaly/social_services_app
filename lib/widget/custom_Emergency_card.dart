import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:social_serveces_app/core/model/emergency_model/Emergency_model.dart';

class CustomEmergencyCard extends StatelessWidget {
  final EmergencyModel emergencyModel;
  final void Function() onPress;

  const CustomEmergencyCard({
    super.key,
    required this.emergencyModel,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Card(
        margin: EdgeInsets.only(bottom: 16.h),
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Name with icon
              Row(
                children: [
                  Icon(Icons.person, size: 20.w, color: Colors.black26),
                  SizedBox(width: 8.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        emergencyModel.name,
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        DateFormat('MMM d').format(DateTime.parse(emergencyModel.createdAt.toString())),
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 12.h),

              // Governorate with icon
              Row(
                children: [
                  Icon(Icons.location_on, size: 20.w, color: Colors.black26),
                  SizedBox(width: 8.w),
                  Text(
                    emergencyModel.governorate,
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8.h),

              // Description with icon
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.description, size: 20.w, color: Colors.black26),
                  SizedBox(width: 8.w),
                  Expanded(
                    child: Text(
                      emergencyModel.description,
                      style: TextStyle(fontSize: 14.sp),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12.h),
            ],
          ),
        ),
      ),
    );
  }
}