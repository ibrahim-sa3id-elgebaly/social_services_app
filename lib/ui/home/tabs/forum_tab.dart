import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_serveces_app/ui/emergency_problem/emergency_problem_screen.dart';
import 'package:social_serveces_app/widget/custom_Emergency_card.dart';
import '../../../core/api/api_manager.dart';
import '../../service_details_screen/service_details_screen.dart';

class ForumTab extends StatefulWidget {
  const ForumTab({super.key});

  @override
  State<ForumTab> createState() => _ForumTabState();
}

class _ForumTabState extends State<ForumTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: ApiManager.getEmergencyProblem(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(snapshot.error?.toString() ?? "An error occurred"),
                  SizedBox(height: 16.h),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {});
                    },
                    child: const Text("Try again"),
                  ),
                ],
              ),
            );
          }

          final emergencyModel = snapshot.data ?? [];
          return Padding(
            padding: REdgeInsets.symmetric(vertical: 10, horizontal: 16),
            child: emergencyModel.isNotEmpty ? ListView.separated(
              itemBuilder: (context, index) => CustomEmergencyCard(
                emergencyModel: emergencyModel[index],
                onPress: () {
                  Navigator.pushNamed(
                    context,
                    ServiceDetailsScreen.routeName,
                    arguments: emergencyModel[index],
                  );
                },
              ),
              separatorBuilder: (context, index) => const Divider(),
              itemCount: emergencyModel.length,
            ):Center(child: Text("no emergency problem for now")),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const EmergencyProblemScreen(),
            ),
          );
        },
        backgroundColor: Theme.of(context).primaryColor,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}

/*
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_serveces_app/core/model/emergency_model/Emergency_model.dart';
import 'package:social_serveces_app/ui/emergency_problem/emergency_problem_screen.dart';
import 'package:social_serveces_app/widget/custom_Emergency_card.dart';

import '../../../core/api/api_manager.dart';
import '../../service_details_screen/service_details_screen.dart';

class ForumTab extends StatefulWidget {
  const ForumTab({super.key});

  @override
  State<ForumTab> createState() => _ForumTabState();
}

class _ForumTabState extends State<ForumTab> {
  @override
  Widget build(BuildContext context) {
    final emergency = ModalRoute.of(context)!.settings.arguments as EmergencyModel;
    return Scaffold(
      body: FutureBuilder(
        future: ApiManager.getEmergencyProblem(),
        builder: (context, snapshot){
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
          List<EmergencyModel> emergencyModel = response ?? [];
          return Padding(
            padding: REdgeInsets.symmetric(vertical: 10, horizontal: 16),
            child: ListView.separated(
              itemBuilder: (context, index) => CustomEmergencyCard(
                emergencyModel: emergencyModel[index],
                onPress: () {
                  Navigator.pushNamed(
                      context,
                      ServiceDetailsScreen.routeName,
                      arguments: [
                        emergencyModel[index],
                      ]
                  );
                },
              ),
              separatorBuilder: (context, index) => const Divider(),
              itemCount: emergencyModel.length,
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => EmergencyProblemScreen(),
            ),
          );
        },
        backgroundColor: Theme.of(context).primaryColor,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}*/
