import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:social_serveces_app/core/model/services_model.dart';
import '../core/model/service_api_model/service_api_model.dart';

class ServiceCard extends StatelessWidget {
  final ServiceEventApiModel serviceApiModel;
  final ServicesModel serviceModel;
  final void Function() onPress;

  const ServiceCard({
    super.key,
    required this.serviceApiModel,
    required this.serviceModel,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Card(
        margin: REdgeInsets.only(bottom: 16),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
            side: BorderSide(color: Colors.amber, width: 2.w)),
        child: Padding(
          padding: REdgeInsets.all(12),
          child: Row(
            children: [
              Container(
                child: Image.asset(
                  serviceModel.image,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 5.w),
              // Event details
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      serviceApiModel.title,
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Row(
                      children: [
                        Icon(Icons.location_on,
                            size: 16, color: Colors.grey[600]),
                        SizedBox(width: 4.w),
                        Text(
                          serviceApiModel.location,
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 4.h),
                    Row(
                      children: [
                        Icon(Icons.access_time,
                            size: 16, color: Colors.grey[600]),
                        SizedBox(width: 4.w),
                        Text(
                          serviceApiModel.formattedTime,
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.date_range_rounded,
                            size: 16, color: Colors.grey[600]),
                        SizedBox(width: 4.w),
                        Text(
                          DateFormat('"dd/MM/yyyy"').format(DateTime.parse(
                              serviceApiModel.date.toString())),
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
