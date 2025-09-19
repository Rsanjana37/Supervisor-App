import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class StatusPieChart extends StatelessWidget {
  final int pending;
  final int inProgress;
  final int completed;
  const StatusPieChart({
    super.key,
    required this.pending,
    required this.inProgress,
    required this.completed,
  });

  @override
  Widget build(BuildContext context) {
    final total = pending + inProgress + completed;
    print("total is ${total}");
    return PieChart(
      PieChartData(
        centerSpaceRadius: 40,
        sections: [
          PieChartSectionData(
            value: pending.toDouble(),
            title: '${((pending / total) * 100).toStringAsFixed(1)}%',
            color: const Color(0xFFFEF3C7),
            radius: 60,
          ),
          PieChartSectionData(
            value: inProgress.toDouble(),
            title: '${((inProgress / total) * 100).toStringAsFixed(1)}%',
            color: const Color(0xFFDBEAFE),
            radius: 60,
          ),
          PieChartSectionData(
            value: completed.toDouble(),
            title: '${((completed / total) * 100).toStringAsFixed(1)}%',
            color: const Color(0xFFD1FAE5),
            radius: 60,
          ),
        ],
      ),
    );
  }
}
