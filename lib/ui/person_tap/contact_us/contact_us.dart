import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/style/app_colors.dart';

class ContactUs extends StatefulWidget {
  static const String routeName = "ContactUS";

  const ContactUs({super.key});

  @override
  _ContactUsScreenState createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUs> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // You can integrate API/email sending logic here
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Message Sent!')),
      );

      _nameController.clear();
      _emailController.clear();
      _messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact Us'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                'We’d love to hear from you!',
                style: Theme.of(context).textTheme.displayMedium,
              ),
              const SizedBox(height: 10),
              const Text(
                'Fill out the form below or reach us through the contact info.',
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _nameController,
                      decoration: InputDecoration(
                        labelText: 'Your Name',
                        labelStyle: TextStyle(
                            color: Theme.of(context).colorScheme.secondary),
                        border: const OutlineInputBorder(),
                      ),
                      validator: (value) =>
                          value!.isEmpty ? 'Name is required' : null,
                    ),
                    const SizedBox(height: 15),
                    TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        labelText: 'Your Email',
                        labelStyle: TextStyle(
                            color: Theme.of(context).colorScheme.secondary),
                        border: const OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Email is required';
                        }
                        final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
                        if (!emailRegex.hasMatch(value)) {
                          return 'Enter a valid email';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 15),
                    TextFormField(
                      controller: _messageController,
                      maxLines: 5,
                      decoration: InputDecoration(
                        labelText: 'Your Message',
                        labelStyle: TextStyle(
                            color: Theme.of(context).colorScheme.secondary),
                        border: const OutlineInputBorder(),
                      ),
                      validator: (value) =>
                          value!.isEmpty ? 'Message cannot be empty' : null,
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: _submitForm,
                      child: Padding(
                        padding:
                            REdgeInsets.symmetric(horizontal: 30, vertical: 12),
                        child: const Text('Send Message'),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Or Contact Us Directly:',
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ),
              const SizedBox(height: 15),
              ListTile(
                leading: const Icon(Icons.email),
                title: const Text('support@socialservices.com'),
                iconColor: Theme.of(context).colorScheme.secondary,
                titleTextStyle: TextStyle(
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
              ListTile(
                leading: const Icon(Icons.phone),
                title: const Text('+20 (155) 571-7864'),
                iconColor: Theme.of(context).colorScheme.secondary,
                titleTextStyle: TextStyle(
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
              ListTile(
                leading: const Icon(Icons.location_on),
                title: const Text('123 Service Lane, Tech City, USA'),
                iconColor: Theme.of(context).colorScheme.secondary,
                titleTextStyle: TextStyle(
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
