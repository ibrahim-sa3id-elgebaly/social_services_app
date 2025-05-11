import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/style/app_colors.dart';

class AboutUs extends StatelessWidget {
  static const String routeName = "AboutUS";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(AppLocalizations.of(context)!.about_us),
        centerTitle: true,
        titleTextStyle: Theme.of(context)
            .textTheme
            .titleMedium!
            .copyWith(fontSize: 22.sp),
        iconTheme: const IconThemeData(
            color: Colors.white
        ),
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // App Logo
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/images/logo1.png'),
            ),
            SizedBox(height: 20),

            // App Name
            Text(
              'social services',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),

            // App Description
            Text(
              'ServiceConnect is a social platform that helps you find, share, and connect with local service providers. Whether you need a plumber, designer, or tutor — we make connecting easy, fast, and reliable.',
              style: TextStyle(fontSize: 16, height: 1.5),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30),

            // Team Section
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Our Team',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(height: 10),

            ListTile(
              leading: Icon(Icons.person),
              title: Text('Nahla Selim'),
              subtitle: Text('Flutter Developer'),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Ibrahim Elgebaly'),
              subtitle: Text('Flutter Developer'),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Mohamed Mahmoud'),
              subtitle: Text('Backend Developer'),
            ),
            SizedBox(height: 20),

            // Contact Info
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Contact Us',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(height: 10),
            ListTile(
              leading: Icon(Icons.email),
              title: Text('support@socialservices.com'),
            ),
            ListTile(
              leading: Icon(Icons.web),
              title: Text('www.serviceconnect.app'),
            ),
          ],
        ),
      ),
    );
  }
}

