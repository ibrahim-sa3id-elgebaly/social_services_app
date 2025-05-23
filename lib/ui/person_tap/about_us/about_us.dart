import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AboutUs extends StatelessWidget {
  static const String routeName = "AboutUS";

  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.about_us),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/images/logo1.png'),
            ),
            const SizedBox(height: 20),
            Text(
              'social services',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 10),
            Text(
              'ServiceConnect is a social platform that helps you find, share, and connect with local service . Whether you need a plumber, designer, or tutor — we make connecting easy, fast, and reliable.',
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Our Team',
                style: Theme.of(context).textTheme.displayMedium,
              ),
            ),
            const SizedBox(height: 10),
            ListTile(
              leading: const Icon(Icons.person,),
              title: const Text('Nahla Selim'),
              subtitle: const Text('Flutter Developer'),
              iconColor: Theme.of(context).colorScheme.secondary,
              titleTextStyle: TextStyle(
                color: Theme.of(context).colorScheme.secondary,
              ),
              subtitleTextStyle: TextStyle(
                color: Theme.of(context).colorScheme.secondary,
              ),

            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Ibrahim Elgebaly'),
              subtitle: const Text('Flutter Developer'),
              iconColor: Theme.of(context).colorScheme.secondary,
              titleTextStyle: TextStyle(
                color: Theme.of(context).colorScheme.secondary,
              ),
              subtitleTextStyle: TextStyle(
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Mohamed Mahmoud'),
              subtitle: const Text('Backend Developer'),
              iconColor: Theme.of(context).colorScheme.secondary,
              titleTextStyle: TextStyle(
                color: Theme.of(context).colorScheme.secondary,
              ),
              subtitleTextStyle: TextStyle(
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
            const SizedBox(height: 20),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Contact Us',
                style: Theme.of(context).textTheme.displayMedium,
              ),
            ),
            const SizedBox(height: 10),
            ListTile(
              leading: const Icon(Icons.email),
              title: const Text('support@socialservices.com'),
              iconColor: Theme.of(context).colorScheme.secondary,
              titleTextStyle: TextStyle(
                color: Theme.of(context).colorScheme.secondary,
              ),
              subtitleTextStyle: TextStyle(
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
