import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:supervisor/constants/app_colors.dart';
import 'package:supervisor/home/widgets/pie_chart_widget.dart';
import 'package:supervisor/home/widgets/priority_widget.dart';
import 'package:supervisor/home/widgets/status_card.dart';
import '../mock/mock_tasks.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final pending = mockTasks.where((t) => t.status == 'pending').length;
    final inProgress = mockTasks.where((t) => t.status == 'in_progress').length;

    final completed = mockTasks.where((t) => t.status == 'completed').length;
    final priorityCounts = {
      'critical': mockTasks.where((t) => t.priority == 'critical').length,
      'high': mockTasks.where((t) => t.priority == 'high').length,
      'medium': mockTasks.where((t) => t.priority == 'medium').length,
      'low': mockTasks.where((t) => t.priority == 'low').length,
    };

    // Completed tasks per month for line chart
    final completedTasks = mockTasks.where((t) => t.status == 'completed');
    final monthlyCounts = <int, int>{}; // month -> count
    for (var t in completedTasks) {
      final month = t.updatedAt.month;
      monthlyCounts[month] = (monthlyCounts[month] ?? 0) + 1;
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              "Dashboard",
              style: Theme.of(context).textTheme.displayMedium,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            "Analytics of Tasks",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: 20),
          StatusCard(),

          //Priority Graph
          PriorityWidget(),

          const SizedBox(height: 32),

          //Completed Tasks Over Time Graph - later add
          //pie
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: AppColors.homeSearchBarColor,
              borderRadius: BorderRadius.circular(16),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.bar_chart_rounded, color: Color(0xFF8B5CF6)),
                    const SizedBox(width: 12),
                    Text(
                      "Tasks Distribution",
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF1E293B),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Icon(Icons.circle, color: const Color(0xFFFEF3C7)),
                    SizedBox(width: 10),
                    Text(
                      "Pending",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.circle, color: const Color(0xFFDBEAFE)),
                    SizedBox(width: 10),
                    Text(
                      "In Progress",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.circle, color: const Color(0xFFD1FAE5)),
                    SizedBox(width: 10),
                    Text(
                      "Completed",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ],
                ),

                SizedBox(
                  height: 200,
                  child: StatusPieChart(
                    pending: pending,
                    inProgress: inProgress,
                    completed: completed,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
