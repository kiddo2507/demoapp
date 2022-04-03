import 'package:flutter/material.dart';
import 'package:increatech_business_solution/screens/googlemap.dart';
import 'package:increatech_business_solution/screens/location.dart';
import 'package:increatech_business_solution/screens/profile.dart';
import 'package:location/location.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _curentindex = 0;

  final tabs = [
    const Center(
      child: Text('Home'),
    ),
    MapScreen(),
    const Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: tabs[_curentindex],
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () => Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //       builder: (context) => const GoogleMapScreen(),
        //     ),
        //   ),
        //   tooltip: 'Google Map',
        //   child: const Icon(Icons.pin_drop_outlined),
        // ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _curentindex,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.grey,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.pin_drop_outlined), label: 'Google Maps'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          ],
          onTap: (index) {
            setState(() {
              _curentindex = index;
            });
          },
        ));
  }
}
