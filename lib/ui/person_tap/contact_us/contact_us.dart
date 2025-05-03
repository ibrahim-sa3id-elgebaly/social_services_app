import 'package:flutter/material.dart';

class ContactUs extends StatelessWidget {
  static const String routeName = "ContactUS";
  const ContactUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contact Us"),
      ),
      body: Container(
        color: Colors.red,
      ),
    );
  }
}
