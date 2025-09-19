import 'package:flutter/material.dart';
import 'package:supervisor/constants/app_colors.dart';
import 'package:supervisor/home/home_dashboard.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final appBarHeight = screenHeight * 0.14;
    return Scaffold(
      backgroundColor: AppColors.homeAppBarBgColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(appBarHeight),
        child: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0.5,
          backgroundColor: const Color.fromARGB(157, 248, 255, 154),
          flexibleSpace: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(top: 4, right: 16, left: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                //mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Welcome, Supervisor",
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                      IconButton(
                        iconSize: 30,
                        onPressed: () {},
                        icon: Icon(
                          Icons.notification_important_rounded,
                          color: AppColors.buttonColor,
                        ),
                      ),
                    ],
                  ),
                  //SizedBox(height: 4),
                  Text(
                    "Municipal Services Portal",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
          ),

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(50)),
          ),
        ),
      ),
      body: DashboardScreen(),
    );
  }
}
