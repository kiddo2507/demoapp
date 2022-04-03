import 'package:flutter/material.dart';
import 'package:increatech_business_solution/screens/homepage.dart';
import 'package:increatech_business_solution/screens/loginscreen.dart';
import 'package:increatech_business_solution/screens/welcome.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.indigo,
          visualDensity: VisualDensity.adaptivePlatformDensity),
      home: const Welcome(),
    );
  }
}
