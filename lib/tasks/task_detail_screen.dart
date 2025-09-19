import 'package:flutter/material.dart';
import 'package:supervisor/constants/app_colors.dart';
import 'package:supervisor/home/home_structure.dart';
import 'package:supervisor/maps/maps_screen.dart';
import 'package:supervisor/models/task_model.dart';
import 'package:supervisor/tasks/task_reports.dart';
import 'package:supervisor/tasks/widgets/task_report_card_widget.dart';
import 'package:supervisor/mock/mock_tasks.dart'; // contains mockTasks list

class TaskDetailScreen extends StatelessWidget {
  final String taskId;
  const TaskDetailScreen({super.key, required this.taskId});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final appBarHeight = screenHeight * 0.10;
    // Find the task by ID from mock data
    final task = mockTasks.firstWhere((t) => t.id == taskId);
    // print(Text(task.id));

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(appBarHeight),
        child: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TaskDashboard()),
              );
            },
            icon: Icon(Icons.arrow_back),
          ),
          automaticallyImplyLeading: false,
          elevation: 0.5,
          backgroundColor: const Color.fromARGB(157, 248, 255, 154),
          title: Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              //mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Task Report Details",
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

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(50)),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    const Icon(Icons.file_copy, color: AppColors.buttonColor),
                    const SizedBox(width: 8),
                    Text(
                      'Task ID: ${task.id}',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Display the same TaskCard
            TaskCard(task: task),

            const SizedBox(height: 20),

            // SLA Deadline card
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    const Icon(Icons.timer, color: Colors.blue),
                    const SizedBox(width: 8),
                    Text(
                      'SLA Deadline: ${task.slaDeadline.day}/${task.slaDeadline.month}/${task.slaDeadline.year}',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color.fromARGB(186, 236, 236, 236),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Title row with refresh icon
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Location",
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ],
                  ),
                  Text(
                    "View the issue location in maps",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 16),

                  // Capture Location Button
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (_) => LeafletMapScreen(
                                lat: task.lat,
                                lng: task.lng,
                              ),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.buttonColor,
                      foregroundColor: AppColors.lightYellowColor,
                      padding: const EdgeInsets.all(16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.location_on,
                          color: AppColors.buttonArrowColor,
                        ),
                        const SizedBox(width: 8),
                        const Text("View in Maps"),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
