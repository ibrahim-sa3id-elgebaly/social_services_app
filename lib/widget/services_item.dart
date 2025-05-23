import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../core/model/services_model.dart';

class ServicesItem extends StatelessWidget {
  final ServicesModel servicesModel;
  final int index;
  final void Function(String category) onPress;

  const ServicesItem({
    super.key,
    required this.servicesModel,
    required this.index,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return InkWell(
          onTap: () => onPress(servicesModel.id),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25.r),
            topRight: Radius.circular(25.r),
            bottomLeft: Radius.circular(index.isEven ? 25.r : 0),
            bottomRight: Radius.circular(index.isOdd ? 25.r : 0),
          ),
          child: Container(
            constraints: BoxConstraints(
              minHeight: 180.h,
              maxWidth: constraints.maxWidth,
            ),
            decoration: BoxDecoration(
              color: servicesModel.background,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25.r),
                topRight: Radius.circular(25.r),
                bottomLeft: Radius.circular(index.isEven ? 25.r : 0),
                bottomRight: Radius.circular(index.isOdd ? 25.r : 0),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: constraints.maxHeight * 0.6,
                  width: constraints.maxWidth * 0.8,
                  child: Image.asset(
                    "assets/images/${servicesModel.image}",
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(height: 10.h),
                Flexible(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.w),
                    child: Text(
                      servicesModel.title,
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
              ],
            ),
          ),
        );
      },
    );
  }
}
