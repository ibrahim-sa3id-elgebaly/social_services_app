import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_serveces_app/ui/emergency_problem/emergency_problem_screen.dart';
import 'package:social_serveces_app/widget/custom_Emergency_card.dart';
import '../../../core/api/api_manager.dart';
import '../../emergency_details_screen/emergency_details_screen.dart';

class ForumTab extends StatefulWidget {
  const ForumTab({super.key});

  @override
  State<ForumTab> createState() => _ForumTabState();
}

class _ForumTabState extends State<ForumTab> {
  late Future emergencyData;

  @override
  void initState() {
    super.initState();
    emergencyData = ApiManager.getEmergencyProblem();
  }
  Future<void> refreshData() async {
    setState(() {
      emergencyData = ApiManager.getEmergencyProblem();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: emergencyData,
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
                      refreshData();
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
            child: emergencyModel.isNotEmpty
                ? RefreshIndicator(
              onRefresh: refreshData,
              child: ListView.separated(
                itemBuilder: (context, index) => CustomEmergencyCard(
                  emergencyModel: emergencyModel[index],
                  onPress: () {
                    Navigator.pushNamed(
                      context,
                      EmergencyDetailsScreen.routeName,
                      arguments: emergencyModel[index],
                    );
                  },
                ),
                separatorBuilder: (context, index) => const Divider(),
                itemCount: emergencyModel.length,
              ),
            )
                : Center(child: Text("No emergency problem for now")),
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
          ).then((_) {
            // Refresh when returning from the add screen
            refreshData();
          });
        },
        backgroundColor: Theme.of(context).primaryColor,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
