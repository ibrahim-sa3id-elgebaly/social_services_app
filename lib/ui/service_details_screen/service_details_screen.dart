import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import '../../core/model/event_api_model/event_api_model.dart';
import '../../core/model/event_model.dart';
import '../../core/model/service_api_model/service_api_model.dart';
import '../../core/style/app_colors.dart';
import '../../widget/event_detail_widget.dart';

class ServiceDetailsScreen extends StatefulWidget {
  static const String routeName = "ServiceDetailsScreen";

  @override
  State<ServiceDetailsScreen> createState() => _ServiceDetailsScreenState();
}

class _ServiceDetailsScreenState extends State<ServiceDetailsScreen> {

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as List<dynamic>;
    final service = args[0] as ServiceEventApiModel;

    return Scaffold(
        backgroundColor: const Color(0xFFEFEFF4),
        appBar: AppBar(
          backgroundColor: AppColors.primaryLightColor,
          title: const Text("Service Details"),
          titleTextStyle: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          iconTheme: const IconThemeData(color: Colors.white),
        ),
        body: SingleChildScrollView(
          padding: REdgeInsets.symmetric(vertical: 10, horizontal: 36),
          child: Column(
            children: [
              Text(
                service.title,
                style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1F2937)),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              Card(
                color: Colors.white.withOpacity(0.9),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
                elevation: 5,
                shadowColor: Colors.black.withOpacity(0.1),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      EventDetailWidget(
                        icon: Icons.description_outlined,
                        value: service.description,
                      ),
                      const Divider(),
                      EventDetailWidget(
                        icon: Icons.date_range_outlined,
                        value: DateFormat("dd/MM/yyyy").format(
                            DateTime.parse(service.date.toString())),
                      ),
                      const Divider(),
                      EventDetailWidget(
                        icon: Icons.access_time_rounded,
                        value: service.formattedTime,
                      ),
                      const Divider(),
                      EventDetailWidget(
                        icon: Icons.phone,
                        value: service.contactNumber,
                      ),
                      const Divider(),
                      EventDetailWidget(
                        icon: Icons.location_on_outlined,
                        value: service.location,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
