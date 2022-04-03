import 'package:flutter/material.dart';
import 'package:increatech_business_solution/screens/homepage.dart';
import 'package:increatech_business_solution/screens/loginscreen.dart';
import 'package:increatech_business_solution/screens/signin.dart';

class Welcome extends StatelessWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text('Welcome to demo app'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const Signin(),
          ),
        ),
        child: const Text('Next'),
      ),
    );
  }
}
