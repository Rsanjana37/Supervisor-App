import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:supervisor/mock/mock_tasks.dart';

class PriorityBarChart extends StatelessWidget {
  const PriorityBarChart({super.key});

  @override
  Widget build(BuildContext context) {
    final data = {
      'Critical': mockTasks.where((t) => t.priority == 'critical').length,
      'High': mockTasks.where((t) => t.priority == 'high').length,
      'Medium': mockTasks.where((t) => t.priority == 'medium').length,
      'Low': mockTasks.where((t) => t.priority == 'low').length,
    };

    final colors = [
      const Color(0xFFEF4444), // Critical - Red
      const Color(0xFFF97316), // High - Orange
      const Color(0xFFFBBF24), // Medium - Yellow
      const Color(0xFF10B981), // Low - Green
    ];

    final barGroups = <BarChartGroupData>[];
    int x = 0;

    data.forEach((label, value) {
      barGroups.add(
        BarChartGroupData(
          x: x,
          barRods: [
            BarChartRodData(
              toY: value.toDouble(),
              gradient: LinearGradient(
                colors: [colors[x].withOpacity(0.8), colors[x]],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
              width: 24,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(6),
                topRight: Radius.circular(6),
              ),
            ),
          ],
          showingTooltipIndicators: [0],
        ),
      );
      x++;
    });

    return BarChart(
      BarChartData(
        // backgroundColor: AppColors.homeIconColor,
        alignment: BarChartAlignment.spaceAround,
        maxY: (data.values.reduce((a, b) => a > b ? a : b) + 2).toDouble(),
        titlesData: FlTitlesData(
          show: true,
          rightTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          topTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 32,
              getTitlesWidget: (value, meta) {
                return Text(
                  value.toInt().toString(),
                  style: const TextStyle(
                    color: Color(0xFF64748B),
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                  ),
                );
              },
            ),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (value, _) {
                final labels = data.keys.toList();
                if (value.toInt() < labels.length) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Text(
                      labels[value.toInt()],
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF64748B),
                      ),
                    ),
                  );
                }
                return const Text('');
              },
            ),
          ),
        ),
        borderData: FlBorderData(show: false),
        barGroups: barGroups,
        gridData: FlGridData(
          show: true,
          drawVerticalLine: false,
          horizontalInterval: 1,
          getDrawingHorizontalLine: (value) {
            return FlLine(color: const Color(0xFFE2E8F0), strokeWidth: 1);
          },
        ),
      ),
    );
  }
}
