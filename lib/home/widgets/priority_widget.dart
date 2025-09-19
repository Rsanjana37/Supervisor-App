import 'package:flutter/material.dart';
import 'package:supervisor/constants/app_colors.dart';
import 'package:supervisor/home/widgets/priority_bar_chart.dart';

class PriorityWidget extends StatefulWidget {
  const PriorityWidget({super.key});

  @override
  State<PriorityWidget> createState() => _PriorityWidgetState();
}

class _PriorityWidgetState extends State<PriorityWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
                "Priority Distribution",
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF1E293B),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          const SizedBox(height: 200, child: PriorityBarChart()),
        ],
      ),
    );
  }
}
