import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../core/model/service_api_model/service_api_model.dart';
import 'custom_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ServiceItem extends StatelessWidget {
  final ServiceEventApiModel serviceApiModel;
  final void Function() onPress;

  const ServiceItem(
      {super.key, required this.serviceApiModel, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Card(
        margin: REdgeInsets.only(bottom: 16),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
            side: BorderSide(color: Theme.of(context).colorScheme.onPrimary, width: 2.w,)),
        child: Padding(
          padding: REdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(width: 12.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '''${serviceApiModel.title}''',
                          style: Theme.of(context).textTheme.titleSmall?.copyWith(fontSize: 18.sp),
                        ),
                        SizedBox(height: 4.h),
                        Row(
                          children: [
                            Icon(Icons.location_on,
                                size: 16, color: Colors.grey[600]),
                            Expanded(
                              child: Text(
                                serviceApiModel.location,
                                style: TextStyle(
                                  fontSize: 14.sp,
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
                            Icon(Icons.access_time,
                                size: 16, color: Colors.grey[600]),
                            Text(
                              serviceApiModel.formattedTime,
                              style: TextStyle(
                                fontSize: 14.sp,
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
                label: AppLocalizations.of(context)!.show_details,
                onClick: (){
                  onPress();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
