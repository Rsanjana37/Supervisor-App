// --- Completed Tasks Over Time ---
//          Container(
//            padding: const EdgeInsets.all(24),
//            decoration: BoxDecoration(
//              color: Colors.white,
//              borderRadius: BorderRadius.circular(16),
//              boxShadow: [
//                BoxShadow(
//                  color: Colors.black.withOpacity(0.05),
//                  blurRadius: 10,
//                  offset: const Offset(0, 4),
//                ),
//              ],
//            ),
//            child: Column(
//              crossAxisAlignment: CrossAxisAlignment.start,
//              children: [
//                Row(
//                  children: [
//                    Container(
//                      padding: const EdgeInsets.all(8),
//                      decoration: BoxDecoration(
//                        color: const Color(0xFF06B6D4).withOpacity(0.1),
//                        borderRadius: BorderRadius.circular(8),
//                      ),
//                      child: const Icon(
//                        Icons.trending_up_rounded,
//                        color: Color(0xFF06B6D4),
//                        size: 20,
//                      ),
//                    ),
//                    const SizedBox(width: 12),
//                  ],
//                ),
//                const SizedBox(height: 24),
//                SizedBox(
//                  height: 250,
//                  child: CompletedLineChart(monthlyCounts: monthlyCounts),
//                ),
//              ],
//            ),
//          ),
// --- Line Chart Widget ---
//class CompletedLineChart extends StatelessWidget {
//  final Map<int, int> monthlyCounts;
//  const CompletedLineChart({super.key, required this.monthlyCounts});
//
//  @override
//  Widget build(BuildContext context) {
//    final spots =
//        monthlyCounts.entries
//            .map((e) => FlSpot(e.key.toDouble(), e.value.toDouble()))
//            .toList()
//          ..sort((a, b) => a.x.compareTo(b.x));
//
//    return LineChart(
//      LineChartData(
//        titlesData: FlTitlesData(
//          bottomTitles: AxisTitles(
//            sideTitles: SideTitles(
//              showTitles: true,
//              getTitlesWidget:
//                  (value, _) => Text(
//                    'M${value.toInt()}',
//                    style: const TextStyle(fontSize: 10),
//                  ),
//            ),
//          ),
//          leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: true)),
//        ),
//        lineBarsData: [
//          LineChartBarData(
//            spots: spots,
//            isCurved: true,
//            color: Colors.green,
//            dotData: FlDotData(show: true),
//          ),
//        ],
//      ),
//    );
//  }
//}
//
