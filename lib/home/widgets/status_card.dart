import 'package:flutter/material.dart';
import 'package:supervisor/constants/app_colors.dart';
import 'package:supervisor/mock/mock_tasks.dart';

class StatusCard extends StatefulWidget {
  const StatusCard({super.key});

  @override
  State<StatusCard> createState() => _StatusCardState();
}

class _StatusCardState extends State<StatusCard> {
  final pending = mockTasks.where((t) => t.status == 'pending').length;
  final inProgress = mockTasks.where((t) => t.status == 'in_progress').length;

  final completed = mockTasks.where((t) => t.status == 'completed').length;

  @override
  Widget build(BuildContext context) {
    print("fvdf ${inProgress}");
    return Column(
      children: [
        buildStatCard(
          'Pending',
          pending,
          const Color(0xFFFBBF24),
          const Color(0xFFFEF3C7),
          Icons.schedule_rounded,
        ),
        const SizedBox(height: 16),
        buildStatCard(
          'In Progress',
          inProgress,
          const Color(0xFF3B82F6),
          const Color(0xFFDBEAFE),
          Icons.trending_up_rounded,
        ),
        const SizedBox(height: 16),
        buildStatCard(
          'Completed',
          completed,
          const Color(0xFF10B981),
          const Color(0xFFD1FAE5),
          Icons.check_circle_rounded,
        ),
        const SizedBox(height: 32),
      ],
    );
  }
}

Widget buildStatCard(
  String title,
  int count,
  Color primaryColor,
  Color backgroundColor,
  IconData icon,
) {
  return Container(
    padding: const EdgeInsets.all(20),
    decoration: BoxDecoration(
      color: AppColors.homeSearchBarColor,
      borderRadius: BorderRadius.circular(16),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(icon, color: primaryColor, size: 20),
            ),
            const SizedBox(width: 10),
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 20,
                color: Color(0xFF64748B),
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        Text(
          '$count',
          style: TextStyle(
            fontSize: 28,
            color: primaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
  );
}
