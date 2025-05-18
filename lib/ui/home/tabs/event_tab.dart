import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/api/api_manager.dart';
import '../../../core/model/event_model.dart';
import '../../../widget/event_card.dart';
import '../../event_details_screen/event_details_screen.dart';

class EventTab extends StatefulWidget {
  const EventTab({super.key});

  @override
  State<EventTab> createState() => _EventTabState();
}

class _EventTabState extends State<EventTab> {
  @override
  Widget build(BuildContext context) {
    final filters = EventModel.getCategories(context);

    return DefaultTabController(
      length: filters.length,
      child: Column(
        children: [
          Padding(
            padding: REdgeInsets.all(16),
            child: Column(
              children: [
                TabBar(
                  isScrollable: true,
                  indicator: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    borderRadius: BorderRadius.circular(25.r),
                  ),
                  labelColor: Colors.white,
                  unselectedLabelColor:
                  Theme.of(context).colorScheme.primary,
                  tabs: filters
                      .map((event) => Tab(
                    child: Container(
                      padding: REdgeInsets.symmetric(
                          horizontal: 16, vertical: 7),
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: Theme.of(context)
                                .colorScheme
                                .primary),
                        borderRadius: BorderRadius.circular(25.r),
                      ),
                      child: Text(event.title),
                    ),
                  ))
                      .toList(),
                ),
                SizedBox(height: 16),
                SizedBox(
                  height: 600.h, // 👈 adjust height as needed
                  child: TabBarView(
                    children: filters.map((event) {
                      return FutureBuilder(
                        future: ApiManager.getServiceEvent(event.id),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Center(child: CircularProgressIndicator());
                          }
                          if (snapshot.hasError) {
                            return Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(snapshot.error?.toString() ?? "Error"),
                                  ElevatedButton(
                                      onPressed: () {
                                        setState(() {});
                                      },
                                      child: Text("Try again"))
                                ],
                              ),
                            );
                          }
                          var events = snapshot.data ?? [];
                          return ListView.separated(
                            padding: REdgeInsets.symmetric(
                                vertical: 10, horizontal: 16),
                            itemBuilder: (context, index) => EventCard(
                              eventModel: events[index],
                              onPress: () {
                                Navigator.pushNamed(
                                    context,
                                    EventDetailsScreen.routeName,
                                    arguments: [
                                      events[index],
                                      filters[index]
                                    ]
                                );
                              },
                            ),
                            separatorBuilder: (context, index) =>
                                Divider(),
                            itemCount: events.length,
                          );
                        },
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

