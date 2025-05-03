import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  static const String routeName = "AboutUS";
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About Us"),
      ),
      body: Container(
        color: Colors.red,
      ),
    );
  }
}
