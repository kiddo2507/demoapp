import 'package:flutter/material.dart';
import 'package:increatech_business_solution/screens/signin.dart';

String name = '';
String email = '';
String address = '';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Name: $name',
              style: const TextStyle(fontSize: 19),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Text(
              'Email: $email',
              style: const TextStyle(fontSize: 19),
            ),
            Text(
              'Address: $address',
              style: const TextStyle(fontSize: 19),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Text('Edit'),
      ),
    );
  }
}
