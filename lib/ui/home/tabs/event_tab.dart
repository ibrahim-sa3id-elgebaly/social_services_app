import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/api/api_manager.dart';
import '../../../core/model/event_model.dart';
import '../../../widget/event_card.dart';

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
                  height: 500.h, // 👈 adjust height as needed
                  child: TabBarView(
                    children: filters.map((event) {
                      return FutureBuilder(
                        future: ApiManager.getEvent(event.id),
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
                              onPress: (c) {},
                            ),
                            separatorBuilder: (context, index) =>
                                Divider(height: 16),
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


/*
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/api/api_manager.dart';
import '../../../core/model/event_api_model.dart';
import '../../../widget/event_card.dart';

class EventTab extends StatefulWidget {
  const EventTab({super.key});

  @override
  State<EventTab> createState() => _EventTabState();
}

class _EventTabState extends State<EventTab> {

  @override
  Widget build(BuildContext context) {
    final filters = EventModel.getCategories(context);

    return FutureBuilder(
        future: ApiManager.getEvent("house-renovation/events"),
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
          List<EventModel> event;
          return Column(
            children: [
              DefaultTabController(
                  length: 5,
                  child: Padding(
                    padding: REdgeInsets.all(16),
                    child: Column(
                      children: [
                        TabBar(
                            isScrollable: true,
                            indicator: BoxDecoration(
                                color: Theme.of(context).colorScheme.primary,
                                borderRadius: BorderRadius.circular(25.r)),
                            labelColor: Colors.white,
                            unselectedLabelColor: Theme.of(context).colorScheme.primary,
                            tabs: filters
                                .map((source) => Tab(
                              child: Container(
                                padding: REdgeInsets.symmetric(
                                    horizontal: 16, vertical: 7),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary),
                                    borderRadius: BorderRadius.circular(25.r)),
                                child: Text(source.name??""),
                              ),
                            ))
                                .toList()),
                        Expanded(
                          child: TabBarView(
                              children: sources.map((source) => ArticlesList(
                                  source.id??""
                              )).toList()),
                        )
                      ],
                    ),
                  )
              ),

              Padding(
                padding: REdgeInsets.symmetric(vertical: 10, horizontal: 16),
                child: ListView.separated(
                  itemBuilder: (context, index) => EventCard(
                      eventModel: event[index],
                      onPress: (c){

                      }),
                  separatorBuilder: (context, index) => Divider(),
                  itemCount: event.length,
                ),
              ),
            ],
          );
        });
  }
}

*/
