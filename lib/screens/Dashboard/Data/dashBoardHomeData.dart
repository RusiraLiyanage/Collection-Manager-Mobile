import 'package:easy_pie_chart/easy_pie_chart.dart';
import 'package:flutter/material.dart';

class Dashboardhomedata {
  final List<Map<String, dynamic>> homeMainData = [
    {"label": "Male", "value": 30, "color": Colors.blue.shade900},
    {"label": "Female", "value": 17, "color": Colors.blue.shade600},
    {"label": "X", "value": 1, "color": Colors.blue.shade400},
  ];

  final List<PieData> mainPieData = [
    PieData(
      value: 30,
      color: Color(0xFF1F5890),
    ),
    PieData(
      value: 31,
      color: Color(0xFF0091D5),
    ),
    PieData(
      value: 14,
      color: Color(0xFFA5D8DD),
    ),
    PieData(
      value: 15,
      color: Color(0xFFBBEDF5),
    ),
    PieData(
      value: 22,
      color: Color(0xFFA6DEBD),
    ),
    PieData(
      value: 6,
      color: Color(0xFFA6B6DE),
    ),
  ];
}
