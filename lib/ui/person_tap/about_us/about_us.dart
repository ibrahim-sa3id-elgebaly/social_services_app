import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/widgets.dart';

class AboutUs extends StatelessWidget {
  static const String routeName = "AboutUS";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.about_us),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/images/logo1.png'),
            ),
            SizedBox(height: 20),
            Text(
              'social services',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            SizedBox(height: 10),
            Text(
              'ServiceConnect is a social platform that helps you find, share, and connect with local service providers. Whether you need a plumber, designer, or tutor — we make connecting easy, fast, and reliable.',
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Our Team',
                style: Theme.of(context).textTheme.displayMedium,
              ),
            ),
            SizedBox(height: 10),
            ListTile(
              leading: Icon(Icons.person,),
              title: Text('Nahla Selim'),
              subtitle: Text('Flutter Developer'),
              iconColor: Theme.of(context).colorScheme.secondary,
              titleTextStyle: TextStyle(
                color: Theme.of(context).colorScheme.secondary,
              ),
              subtitleTextStyle: TextStyle(
                color: Theme.of(context).colorScheme.secondary,
              ),

            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Ibrahim Elgebaly'),
              subtitle: Text('Flutter Developer'),
              iconColor: Theme.of(context).colorScheme.secondary,
              titleTextStyle: TextStyle(
                color: Theme.of(context).colorScheme.secondary,
              ),
              subtitleTextStyle: TextStyle(
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Mohamed Mahmoud'),
              subtitle: Text('Backend Developer'),
              iconColor: Theme.of(context).colorScheme.secondary,
              titleTextStyle: TextStyle(
                color: Theme.of(context).colorScheme.secondary,
              ),
              subtitleTextStyle: TextStyle(
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
            SizedBox(height: 20),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Contact Us',
                style: Theme.of(context).textTheme.displayMedium,
              ),
            ),
            SizedBox(height: 10),
            ListTile(
              leading: Icon(Icons.email),
              title: Text('support@socialservices.com'),
              iconColor: Theme.of(context).colorScheme.secondary,
              titleTextStyle: TextStyle(
                color: Theme.of(context).colorScheme.secondary,
              ),
              subtitleTextStyle: TextStyle(
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
            ListTile(
              leading: Icon(Icons.web),
              title: Text('www.serviceconnect.app'),
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
