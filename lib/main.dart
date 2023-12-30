import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'User Details',
      initialRoute: '/',
      routes: {
        '/': (context) => InputPage(),
        '/details': (context) => DetailsPage(),
      },
    );
  }
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _rollNoController = TextEditingController();
  TextEditingController _phoneNumberController = TextEditingController();

  void _showDetails(BuildContext context) {
    String name = _nameController.text;
    String email = _emailController.text;
    String rollNo = _rollNoController.text;
    String phoneNumber = _phoneNumberController.text;

    Navigator.pushNamed(
      context,
      '/details',
      arguments: {
        'name': name,
        'email': email,
        'rollNo': rollNo,
        'phoneNumber': phoneNumber,
      },
    ).then((_) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('User $name Logged out'),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Enter Details'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: _rollNoController,
              decoration: InputDecoration(labelText: 'Roll No'),
            ),
            TextField(
              controller: _phoneNumberController,
              decoration: InputDecoration(labelText: 'Phone Number'),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () => _showDetails(context),
              child: Text('Show Details'),
            ),
          ],
        ),
      ),
    );
  }
}

class DetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Map args = ModalRoute.of(context)!.settings.arguments as Map;
    final String name = args['name'];
    final String email = args['email'];
    final String rollNo = args['rollNo'];
    final String phoneNumber = args['phoneNumber'];

    return Scaffold(
      appBar: AppBar(
        title: Text('User Details'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Name: $name'),
            Text('Email: $email'),
            Text('Roll No: $rollNo'),
            Text('Phone Number: $phoneNumber'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pop(context),
        tooltip: 'Log Out',
        child: Icon(Icons.logout),
      ),
    );
  }
}
