import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import '../../core/model/event_model.dart';
import '../../core/model/service_api_model/service_api_model.dart';
import '../../core/style/app_colors.dart';
import '../../widget/event_detail_widget.dart';

class EventDetailsScreen extends StatefulWidget {
  static const String routeName = "EventDetailsScreen";

  @override
  State<EventDetailsScreen> createState() => _EventDetailsScreenState();
}

class _EventDetailsScreenState extends State<EventDetailsScreen> {

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as List<dynamic>;
    final event = args[0] as ServiceEventApiModel;
    final category = args[1] as EventModel;

    return Scaffold(
        backgroundColor: const Color(0xFFEFEFF4),
        appBar: AppBar(
          backgroundColor: AppColors.primaryLightColor,
          title: Text(category.title),
          titleTextStyle: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          iconTheme: IconThemeData(color: Colors.white),
        ),
        body: SingleChildScrollView(
          padding: REdgeInsets.symmetric(vertical: 10, horizontal: 36),
          child: Column(
            children: [
              Text(
                event.title,
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
                        value: event.description,
                      ),
                      const Divider(),
                      EventDetailWidget(
                        icon: Icons.date_range_outlined,
                        value: DateFormat("dd/MM/yyyy").format(
                            DateTime.parse(event.date.toString())),
                      ),
                      const Divider(),
                      EventDetailWidget(
                        icon: Icons.access_time_rounded,
                        value: event.formattedTime,
                      ),
                      const Divider(),
                      EventDetailWidget(
                        icon: Icons.phone,
                        value: event.contactNumber,
                      ),
                      const Divider(),
                      EventDetailWidget(
                        icon: Icons.location_on_outlined,
                        value: event.location,
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

/*
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import '../../core/api/api_manager.dart';
import '../../core/model/event_api_model/event_api_model.dart';
import '../../core/model/event_model.dart';
import '../../core/model/service_api_model/service_api_model.dart';
import '../../core/style/app_colors.dart';
import '../../widget/event_detail_widget.dart';

class EventDetailsScreen extends StatefulWidget {

  static const String routeName = "EventDetailsScreen";

  @override
  State<EventDetailsScreen> createState() => _EventDetailsScreenState();
}

class _EventDetailsScreenState extends State<EventDetailsScreen> {
  late final ServiceApiModel serviceApiModel;

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as List<dynamic>;
    final event = args[0] as EventApiModel;
    final category = args[1] as EventModel;
    return Scaffold(
        backgroundColor: const Color(0xFFEFEFF4),
        appBar: AppBar(
          backgroundColor: AppColors.primaryLightColor,
          title: Text(category.title),
          titleTextStyle: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          iconTheme: IconThemeData(color: Colors.white),
        ),
        body: FutureBuilder(
            future: ApiManager.getEvent(category.id),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (snapshot.hasError) {
                return Center(
                  child: Container(
                    child: Column(
                      children: [
                        Text(snapshot.error?.toString() ?? ""),
                        ElevatedButton(
                            onPressed: () {
                              setState(() {});
                            },
                            child: Text("try again"))
                      ],
                    ),
                  ),
                );
              }
              // var response = snapshot.data;
              return SingleChildScrollView(
                padding: REdgeInsets.symmetric(vertical: 10, horizontal: 36),
                child: Column(
                  children: [
                    Text(
                      event.title,
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
                              value: event.description,
                            ),
                            const Divider(),
                            EventDetailWidget(
                              icon: Icons.date_range_outlined,
                              value: DateFormat("dd/MM/yyyy").format(
                                  DateTime.parse(event.date.toString())),
                            ),
                            const Divider(),
                            EventDetailWidget(
                              icon: Icons.access_time_rounded,
                              value: event.formattedTime,
                            ),
                            const Divider(),
                            EventDetailWidget(
                              icon: Icons.phone,
                              value: event.contactNumber,
                            ),
                            const Divider(),
                            EventDetailWidget(
                              icon: Icons.location_on_outlined,
                              value: event.location,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }));
  }
}
*/
