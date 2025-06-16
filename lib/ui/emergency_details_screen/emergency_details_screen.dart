import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:social_serveces_app/core/model/emergency_model/Emergency_model.dart';
import 'package:social_serveces_app/widget/custom_button.dart';
import '../../widget/event_detail_widget.dart';

class EmergencyDetailsScreen extends StatefulWidget {
  static const String routeName = "EmergencyDetailsScreen";

  const EmergencyDetailsScreen({super.key});

  @override
  State<EmergencyDetailsScreen> createState() => _EmergencyDetailsScreenState();
}

class _EmergencyDetailsScreenState extends State<EmergencyDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final emergency = ModalRoute.of(context)!.settings.arguments as EmergencyModel;

    return Scaffold(
      backgroundColor: const Color(0xFFEFEFF4),
      appBar: AppBar(
        title: const Text("Emergency Details"),
      ),
      body: SingleChildScrollView(
        padding: REdgeInsets.symmetric(vertical: 10, horizontal: 36),
        child: Column(
          children: [
            Text(
              emergency.name,
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
                padding: REdgeInsets.all(20.0),
                child: Column(
                  children: [
                    EventDetailWidget(
                      icon: Icons.phone,
                      value: emergency.phone,
                    ),
                    const Divider(),
                    EventDetailWidget(
                      icon: Icons.date_range_outlined,
                      value: DateFormat("dd/MM/yyyy")
                          .format(DateTime.parse(emergency.createdAt.toString())),
                    ),
                    const Divider(),
                    EventDetailWidget(
                      icon: Icons.location_on_outlined,
                      value: emergency.governorate,
                    ),
                    const Divider(),
                    EventDetailWidget(
                      icon: Icons.location_on_outlined,
                      value: emergency.description,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}