import 'package:flutter/material.dart';
import 'tabs/forum_tab.dart';
import 'tabs/home_tab.dart';
import 'tabs/event_tab.dart';
import 'tabs/person_tab.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "home";

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  SearchController controller = SearchController();
  int selectedIndex = 0;
  List<Widget> tabs = [
    const HomeTab(),
    EventTab(),
    const ForumTab(),
    const PersonTab()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.social_services),
      ),
      body: tabs[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: selectedIndex,
          onTap: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: const Icon(Icons.home),
              label: AppLocalizations.of(context)!.home,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.event),
              label: AppLocalizations.of(context)!.event,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.chat),
              label: AppLocalizations.of(context)!.forum,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.person),
              label: AppLocalizations.of(context)!.person,
            ),
          ]),
    );
  }
}
