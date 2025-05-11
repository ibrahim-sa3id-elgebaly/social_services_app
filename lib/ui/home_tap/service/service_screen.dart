import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_serveces_app/core/api/api_manager.dart';
import '../../../core/model/service_api_model/service_api_model.dart';
import '../../../core/model/services_model.dart';
import '../../../core/style/app_colors.dart';
import '../../../widget/service_item.dart';

class ServiceScreen extends StatefulWidget {
  static const String routeName = "serviceScreen";

  ServiceScreen({super.key});

  @override
  State<ServiceScreen> createState() => _ServiceScreenState();
}

class _ServiceScreenState extends State<ServiceScreen> {
  @override
  Widget build(BuildContext context) {
    final service = ModalRoute.of(context)!.settings.arguments as ServicesModel;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          title: Text(service.title),
          titleTextStyle: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          iconTheme: IconThemeData(color: Colors.white),
        ),
        body: FutureBuilder(
            future: ApiManager.getService(service.id),
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
              var response = snapshot.data;
              List<ServiceApiModel> articles = response ?? [];
              return Padding(
                padding: REdgeInsets.symmetric(vertical: 10, horizontal: 16),
                child: ListView.separated(
                  itemBuilder: (context, index) => ServiceItem(
                    serviceApiModel: articles[index],
                    image: service.image,
                    onPress: (category) {},
                  ),
                  separatorBuilder: (context, index) => Divider(),
                  itemCount: articles.length,
                ),
              );
            }));
  }
}
