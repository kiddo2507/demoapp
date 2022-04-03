import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:increatech_business_solution/screens/homepage.dart';
import 'package:increatech_business_solution/screens/loginscreen.dart';
import 'package:increatech_business_solution/screens/profile.dart';
import 'package:increatech_business_solution/services/authservices.dart';

var name, email, password, token, address;

class Signin extends StatefulWidget {
  const Signin({Key? key}) : super(key: key);

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Sign In'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            decoration: const InputDecoration(
              labelText: 'Name',
            ),
            onChanged: (val) {
              name = val;
            },
          ),
          TextField(
            decoration: const InputDecoration(
              labelText: 'Email',
            ),
            onChanged: (val) {
              email = val;
            },
          ),
          TextField(
            obscureText: true,
            decoration: const InputDecoration(
              labelText: 'Password',
            ),
            onChanged: (val) {
              password = val;
            },
          ),
          TextField(
            decoration: const InputDecoration(
              labelText: 'Address',
            ),
            onChanged: (val) {
              address = val;
            },
          ),
          const SizedBox(
            height: 10.0,
          ),
          ElevatedButton(
            onPressed: () {
              AuthService().login(name, password).then((val) {
                if (val.data['success']) {
                  token = val.data['token'];
                  Fluttertoast.showToast(
                    msg: 'Autheticated',
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    backgroundColor: Colors.green,
                    timeInSecForIosWeb: 1,
                    textColor: Colors.white,
                    fontSize: 16.0,
                  );
                }
              });
            },
            child: const Text('Sign me in'),
          ),
          TextButton(
              onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ),
                  ),
              child: const Text('Login Instead'))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const HomePage(),
          ),
        ),
        child: const Text('Skip'),
      ),
    );
  }
}
