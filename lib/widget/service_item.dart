import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../core/model/service_api_model/service_api_model.dart';

class ServiceItem extends StatelessWidget {
  String image;
  final ServiceApiModel serviceApiModel;
  final void Function(String category) onPress;

  ServiceItem(
      {super.key,
      required this.image,
      required this.serviceApiModel,
      required this.onPress});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onPress;
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            "assets/images/$image",
            width: double.infinity,
            height: 232.h,
            fit: BoxFit.cover,
          ),
          Text(serviceApiModel.name),
          Text(serviceApiModel.address),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
                serviceApiModel.workingHours ?? serviceApiModel.contactNumber),
          ),
        ],
      ),
    );
  }
}
