import 'package:flutter/material.dart';
import 'package:supervisor/constants/app_colors.dart';
import 'package:supervisor/home/home_screen.dart';

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  Widget activepage = HomeScreen();
  String title = '';
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    if (_selectedIndex == 0) {
      activepage = HomeScreen();
    }
    if (_selectedIndex == 1) {
      //activepage = LeafletMapScreen();
    }
    if (_selectedIndex == 2) {
      //activepage = UserReports();
    }
    if (_selectedIndex == 3) {
      //activepage = UserProfileScreen();
    }
    return Scaffold(
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: const Color.fromARGB(200, 255, 255, 220),
          //elevation: 3, // container handles shadow now
          selectedFontSize: 14,
          unselectedFontSize: 11,
          selectedItemColor:
              AppColors.buttonColor, // selected text and icon color
          unselectedItemColor: Colors.grey.shade600,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          currentIndex: _selectedIndex,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.map), label: 'Maps'),
            BottomNavigationBarItem(icon: Icon(Icons.task_alt), label: 'Tasks'),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_2),
              label: 'Profile',
            ),
          ],
        ),
      ),

      body: activepage,
    );
  }
}
