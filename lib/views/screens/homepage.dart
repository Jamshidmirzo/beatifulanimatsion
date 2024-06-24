import 'package:beatifulanimatsion/views/screens/planeanimation.dart';
import 'package:beatifulanimatsion/views/screens/uzumpage.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List screens = [Planeanimation(), Uzumpage()];
  int currentindex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          currentindex = value;
          setState(() {});
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.animation), label: 'Plane'),
          BottomNavigationBarItem(icon: Icon(Icons.animation), label: 'Uzum'),
        ],
      ),
      body: screens[currentindex],
    );
  }
}
