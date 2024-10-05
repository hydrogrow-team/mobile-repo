import 'package:crop_compass/feature/models/rain_fall.dart';
import 'package:crop_compass/feature/models/weather_model.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class RainFallWidget extends StatelessWidget {
  const RainFallWidget({super.key, required this.model});

  final RainFallModel model;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: LineChart(
        LineChartData(
          borderData: FlBorderData(show: true),
          lineBarsData: [
            LineChartBarData(
              spots: List.generate(
                model.data.length,
                    (index) => FlSpot(
                    model.data[index].day.toDouble(),
                    model.data[index].avg.toDouble()
                ),
              ),
              isCurved: true,
              barWidth: 4,
              color: Colors.blue,
              dotData: const FlDotData(show: false),
            ),
          ],
          titlesData: FlTitlesData(
            leftTitles: const AxisTitles(), // You can customize this if needed
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (value, meta) {
                  // Customize the label format with 1 decimal place
                  return Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      value.toStringAsFixed(1), // Display with one decimal place
                      style: const TextStyle(fontSize: 10),
                    ),
                  );
                },
                reservedSize: 32, // Reserve space for X-axis labels
                interval: 2, // You can control the interval between labels
              ),
            ),
          ),
          gridData: const FlGridData(show: true),
        ),
      ),
    );
  }
}

class WeatherWidget extends StatelessWidget {
  const WeatherWidget({
    super.key,
    required this.model,
    required this.isDew,
    required this.isHum,
  });

  final WeatherModel model;
  final bool isDew;
  final bool isHum;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: LineChart(
        LineChartData(
          borderData: FlBorderData(show: true),
          lineBarsData: [
            LineChartBarData(
              spots: List.generate(
                model.days.length,
                    (index) => isHum
                    ? FlSpot(index.toDouble(), model.days[index].temp.toDouble())
                    : isDew
                    ? FlSpot(index.toDouble(), model.days[index].dew.toDouble())
                    : FlSpot(index.toDouble(), model.days[index].temp.toDouble()),
              ),
              isCurved: true,
              barWidth: 4,
              color: Colors.blue,
              dotData: const FlDotData(show: false),
            ),
          ],
          titlesData: FlTitlesData(
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 40, // Reserve enough space for Y-axis labels
                getTitlesWidget: (value, meta) {
                  // Round to 1 decimal place and return as widget
                  return Text(
                    value.toStringAsFixed(1), // Adjust decimal places
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 10, // Smaller font size
                    ),
                  );
                },
              ),
            ),
            rightTitles: AxisTitles(),
            topTitles: AxisTitles(),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 22,
                getTitlesWidget: (value, meta) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      value.toInt().toString(),
                      style: const TextStyle(color: Colors.black),
                    ),
                  );
                },
              ),
            ),
          ),
          gridData: const FlGridData(show: true),
        ),
      ),
    );
  }
}


