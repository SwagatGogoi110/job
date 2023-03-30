import 'package:flutter/material.dart';
import '../global_variables.dart';

class BottomNavigation extends StatefulWidget {
  late int selectedIndex;
  BottomNavigation({super.key, required this.selectedIndex});
  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  void onItemTapped(int index) {
    setState(() {
      widget.selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: navBackgroundColor,
      type: BottomNavigationBarType.fixed,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
            size: bottomNavIconSize,
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.work,
            size: bottomNavIconSize,
          ),
          label: 'Jobs',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.health_and_safety_sharp,
            size: bottomNavIconSize,
          ),
          label: 'Health',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.description,
            size: bottomNavIconSize,
          ),
          label: 'Schemes',
        ),
      ],
      currentIndex: widget.selectedIndex,
      selectedItemColor: const Color(0xff039BE5),
      unselectedItemColor: const Color(0xFF90A4AE),
      selectedFontSize: 10,
      unselectedFontSize: 10,
      unselectedLabelStyle:
          const TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
      onTap: onItemTapped,
    );
  }
}
