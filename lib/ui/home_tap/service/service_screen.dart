import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_serveces_app/core/api/api_manager.dart';
import 'package:social_serveces_app/ui/service_details_screen/service_details_screen.dart';
import '../../../core/model/service_api_model/service_api_model.dart';
import '../../../core/model/services_model.dart';
import '../../../widget/service_item.dart';

class ServiceScreen extends StatefulWidget {
  static const String routeName = "serviceScreen";

  const ServiceScreen({super.key});

  @override
  State<ServiceScreen> createState() => _ServiceScreenState();
}

class _ServiceScreenState extends State<ServiceScreen> {
  @override
  Widget build(BuildContext context) {
    final service = ModalRoute.of(context)!.settings.arguments as ServicesModel;
    return Scaffold(
        appBar: AppBar(
          title: Text(service.title),
        ),
        body: FutureBuilder(
            future: ApiManager.getServiceEvent(service.id),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
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
                            child: const Text("try again"))
                      ],
                    ),
                  ),
                );
              }
              var response = snapshot.data;
              List<ServiceEventApiModel> articles = response ?? [];
              return Padding(
                padding: REdgeInsets.symmetric(vertical: 10, horizontal: 16),
                child: ListView.separated(
                  itemBuilder: (context, index) => ServiceItem(
                    serviceApiModel: articles[index],
                    onPress: () {
                      Navigator.pushNamed(
                          context,
                          ServiceDetailsScreen.routeName,
                          arguments: [
                            articles[index],
                          ]
                      );
                    },
                  ),
                  separatorBuilder: (context, index) => const Divider(),
                  itemCount: articles.length,
                ),
              );
            }));
  }
}
