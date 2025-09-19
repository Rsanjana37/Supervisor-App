// screens/task_dashboard.dart
import 'package:flutter/material.dart';
import 'package:supervisor/constants/app_colors.dart';
import 'package:supervisor/home/home_structure.dart';
import '../models/task_model.dart';
import 'package:supervisor/tasks/widgets/task_report_card_widget.dart';
import 'package:supervisor/mock/mock_tasks.dart';

class TaskDashboard extends StatelessWidget {
  const TaskDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final appBarHeight = screenHeight * 0.10;
    // Dummy Data (Replace with API fetch)
    final tasks = mockTasks;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(appBarHeight),
        child: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0.5,
          backgroundColor: const Color.fromARGB(157, 248, 255, 154),
          leading: IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyHome()),
              );
            },
            icon: Icon(Icons.arrow_back),
          ),
          flexibleSpace: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(top: 4, right: 16, left: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                //mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Task Reports",
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  Text(
                    "Municipal Services Portal",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  //SizedBox(height: 4),
                ],
              ),
            ),
          ),

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(50)),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          //mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Click each report to view more details ",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: mockTasks.length,
                itemBuilder:
                    (context, index) => TaskCard(task: mockTasks[index]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
