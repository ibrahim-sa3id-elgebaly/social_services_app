import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import '../core/model/service_api_model/service_api_model.dart';
import 'custom_button.dart';

class EventCard extends StatelessWidget {
  final ServiceEventApiModel eventModel;
  final void Function() onPress;

  const EventCard({
    super.key,
    required this.eventModel,
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
          side: BorderSide(color: Theme.of(context).colorScheme.onPrimary, width: 2.w,)
        ),
        child: Padding(
          padding: REdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      SizedBox(height: 8.h),
                      Text(
                        DateFormat('MMM d').format(DateTime.parse(eventModel.date.toString())),
                        style: Theme.of(context).textTheme.titleSmall
                      ),
                    ],
                  ),
                  SizedBox(width: 12.w),
                  // Event details
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          eventModel.title,
                          style: Theme.of(context).textTheme.titleSmall?.copyWith(fontSize: 18.sp),
                        ),
                        SizedBox(height: 4.h),
                        Row(
                          children: [
                            Icon(Icons.location_on, size: 16.r, color: Colors.grey[600],),
                            SizedBox(width: 4.w),
                            Expanded(
                              child: Text(
                                eventModel.location,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey[600],
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 4.h),
                        Row(
                          children: [
                            Icon(Icons.access_time, size: 16, color: Colors.grey[600]),
                            SizedBox(width: 4.w),
                            Text(
                              eventModel.formattedTime,
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey[600],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12.h),
              CustomButton(
                label: "Show Details",
                onClick: () => onPress,
              )
            ],
          ),
        ),
      ),
    );
  }
}