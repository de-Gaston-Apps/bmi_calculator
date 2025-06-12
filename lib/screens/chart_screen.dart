import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:bmi_calculator/handlers/database_handler.dart';
import 'dart:math'; // For min/max

class ChartScreen extends StatefulWidget {
  const ChartScreen({super.key});

  @override
  State<ChartScreen> createState() => _ChartScreenState();
}

class _ChartScreenState extends State<ChartScreen> {
  List<Map<String, dynamic>> _bmiRecords = [];
  bool _isLoading = true;
  String _errorMessage = '';

  @override
  void initState() {
    super.initState();
    _fetchBmiHistory();
  }

  Future<void> _fetchBmiHistory() async {
    setState(() {
      _isLoading = true;
      _errorMessage = '';
    });
    try {
      final dbHandler = DatabaseHandler.instance;
      final data = await dbHandler.getBmiHistory();
      setState(() {
        _bmiRecords = data;
        _isLoading = false;
      });
      // For verification
      print("Fetched BMI History: $_bmiRecords");
    } catch (e) {
      print("Error fetching BMI History: $e");
      setState(() {
        _isLoading = false;
        _errorMessage = "Failed to load history. Please try again.";
      });
    }
  }

  String formatTimestampToDate(double timestamp) {
    final DateTime date = DateTime.fromMillisecondsSinceEpoch(timestamp.toInt());
    return "${date.month}/${date.day}";
  }

  String formatTimestampToDateTime(double timestamp) {
    final DateTime date = DateTime.fromMillisecondsSinceEpoch(timestamp.toInt());
    return "${date.month}/${date.day}/${date.year}";
  }

  LineChartData _buildChartData(List<Map<String, dynamic>> records) {
    List<FlSpot> spots = records.map((record) {
      return FlSpot(
        record['timestamp'].toDouble(), // X: timestamp
        record['bmi'].toDouble()        // Y: BMI
      );
    }).toList();

    if (spots.isEmpty) {
      return LineChartData(
        minX: 0,
        maxX: 1,
        minY: 0,
        maxY: 1,
        lineBarsData: [
          LineChartBarData(spots: [const FlSpot(0.5, 0.5)]) // Placeholder spot
        ],
        titlesData: FlTitlesData(
          leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: true, reservedSize: 40, getTitlesWidget: (value, meta) => Text(value.toStringAsFixed(1))))),
          bottomTitles: AxisTitles(sideTitles: SideTitles(showTitles: true, reservedSize: 30, getTitlesWidget: (value, meta) => const Text(""))),
          topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
          rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
        ),
      );
    }

    // Determine min and max timestamps for X-axis scaling and interval calculation
    double minTimestamp = spots.map((spot) => spot.x).reduce(min);
    double maxTimestamp = spots.map((spot) => spot.x).reduce(max);
    double timestampRange = maxTimestamp - minTimestamp;

    // Determine min and max BMI for Y-axis scaling
    double minBmi = spots.map((spot) => spot.y).reduce(min);
    double maxBmi = spots.map((spot) => spot.y).reduce(max);

    // Add some padding to min/max BMI for visual comfort
    minBmi = (minBmi - 2).floorToDouble();
    if (minBmi < 0) minBmi = 0; // BMI cannot be negative
    maxBmi = (maxBmi + 2).ceilToDouble();


    // Calculate a reasonable interval for bottom titles
    // Aim for about 5-7 labels on the X-axis. If range is 0, use a default.
    double bottomTitleInterval = timestampRange > 0 ? timestampRange / 5 : 1;
    if (bottomTitleInterval == 0 && spots.length == 1) { // Handle single data point
        minTimestamp = spots.first.x - Duration(days:1).inMilliseconds.toDouble(); // Show a small range
        maxTimestamp = spots.first.x + Duration(days:1).inMilliseconds.toDouble();
        bottomTitleInterval = Duration(days:1).inMilliseconds.toDouble() / 2;
    } else if (bottomTitleInterval == 0) {
        bottomTitleInterval = 1; // Default if range is still 0
    }


    return LineChartData(
      minX: minTimestamp - bottomTitleInterval * 0.5, // Add some padding
      maxX: maxTimestamp + bottomTitleInterval * 0.5, // Add some padding
      minY: minBmi,
      maxY: maxBmi,
      lineTouchData: LineTouchData(
        touchTooltipData: LineTouchTooltipData(
          getTooltipItems: (touchedSpots) {
            return touchedSpots.map((spot) {
              final timestamp = spot.x;
              final bmi = spot.y;
              return LineTooltipItem(
                'BMI: ${bmi.toStringAsFixed(1)}\nDate: ${formatTimestampToDateTime(timestamp)}',
                const TextStyle(color: Colors.white, fontSize: 12),
              );
            }).toList();
          },
          tooltipBgColor: Colors.blueGrey,
        ),
        handleBuiltInTouches: true,
      ),
      titlesData: FlTitlesData(
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            interval: bottomTitleInterval,
            getTitlesWidget: (value, meta) {
              // Do not show title for the padded areas
              if (value <= minTimestamp - bottomTitleInterval * 0.25 || value >= maxTimestamp + bottomTitleInterval * 0.25) {
                return const SizedBox.shrink();
              }
              return SideTitleWidget(
                axisSide: meta.axisSide,
                space: 8.0,
                child: Text(formatTimestampToDate(value), style: const TextStyle(fontSize: 10)),
              );
            },
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 40, // Increased reserved size for numbers like 25.5
            getTitlesWidget: (value, meta) {
               // Show titles only at reasonable intervals on Y axis
              if (value == meta.min || value == meta.max || value % 5 == 0 || value % 2.5 == 0) {
                 return Padding(
                   padding: const EdgeInsets.only(right: 6.0),
                   child: Text(value.toStringAsFixed(1), style: const TextStyle(fontSize: 10)),
                 );
              }
              return const SizedBox.shrink();
            },
            interval: 1, // Draw lines for every 1 BMI unit
          ),
        ),
        topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
        rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
      ),
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        drawHorizontalLine: true,
        verticalInterval: bottomTitleInterval,
        horizontalInterval: 1, // Grid line for every 1 BMI unit
        getDrawingHorizontalLine: (value) {
          return const FlLine(
            color: Colors.grey,
            strokeWidth: 0.5,
          );
        },
        getDrawingVerticalLine: (value) {
          return const FlLine(
            color: Colors.grey,
            strokeWidth: 0.5,
          );
        },
      ),
      borderData: FlBorderData(
        show: true,
        border: Border.all(color: const Color(0xff37434d), width: 1),
      ),
      lineBarsData: [
        LineChartBarData(
          spots: spots,
          isCurved: true,
          color: Colors.blue, // Changed from gradient for simplicity
          barWidth: 4,
          isStrokeCapRound: true,
          dotData: const FlDotData(show: true),
          belowBarData: BarAreaData(
            show: true,
            color: Colors.blue.withOpacity(0.3), // Changed from gradient
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Health History"),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _errorMessage.isNotEmpty
              ? Center(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      _errorMessage,
                      style: const TextStyle(color: Colors.red, fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
              : _bmiRecords.isEmpty
                  ? const Center(child: Text("No history yet."))
                  : Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: LineChart(_buildChartData(_bmiRecords)),
                    ),
    );
  }
}
