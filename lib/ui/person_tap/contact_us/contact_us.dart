import 'package:flutter/material.dart';

class ContactUs extends StatefulWidget {
  static const String routeName = "ContactUS";
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
        SnackBar(content: Text('Message Sent!')),
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
        title: Text('Contact Us'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Header
              Text(
                'We’d love to hear from you!',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'Fill out the form below or reach us through the contact info.',
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 30),

              // Contact Form
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _nameController,
                      decoration: InputDecoration(
                        labelText: 'Your Name',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) =>
                      value!.isEmpty ? 'Name is required' : null,
                    ),
                    SizedBox(height: 15),
                    TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        labelText: 'Your Email',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty)
                          return 'Email is required';
                        final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
                        if (!emailRegex.hasMatch(value))
                          return 'Enter a valid email';
                        return null;
                      },
                    ),
                    SizedBox(height: 15),
                    TextFormField(
                      controller: _messageController,
                      maxLines: 5,
                      decoration: InputDecoration(
                        labelText: 'Your Message',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) =>
                      value!.isEmpty ? 'Message cannot be empty' : null,
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: _submitForm,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                        child: Text('Send Message'),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 40),

              // Contact Info Section
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Or Contact Us Directly:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(height: 15),
              ListTile(
                leading: Icon(Icons.email),
                title: Text('support@socialservices.com'),
              ),
              ListTile(
                leading: Icon(Icons.phone),
                title: Text('+20 (155) 571-7864'),
              ),
              ListTile(
                leading: Icon(Icons.location_on),
                title: Text('123 Service Lane, Tech City, USA'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


/*
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
*/
