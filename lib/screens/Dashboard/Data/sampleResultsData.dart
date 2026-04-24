import 'dart:ui';

import 'package:easy_pie_chart/easy_pie_chart.dart';
import 'package:flutter_chartx/components/ChartLabeledData.dart';
import 'package:project_code_blue/screens/Dashboard/Definitions/sampleResults.dart';

class SampleResultsData {
  List<SampleResults> sampleResultsData = [
    SampleResults(
      pies: [
        PieData(
          value: 82,
          color: Color(0xFF8483AF),
        ),
        PieData(
          value: 37,
          color: Color(0xFFFBB03B),
        ),
        PieData(
          value: 20,
          color: Color(0xFFBBEDF5),
        ),
        PieData(
          value: 49,
          color: Color(0xFFA5D8DD),
        ),
        PieData(
          value: 10,
          color: Color(0xFF0091D5),
        ),
      ],
      maxValue: 198,
      datas: [
        ChartLabeledData(
          label: "Breath Alcohol Screen",
          value: 82,
          color: Color(0xFF8483AF),
        ),
        ChartLabeledData(
          label: "Urine Drug Screen",
          value: 37,
          color: Color(0xFFFBB03B),
        ),
        ChartLabeledData(
          label: "Oral Fluid Drug Screen",
          value: 20,
          color: Color(0xFFBBEDF5),
        ),
        ChartLabeledData(
          label: "Urine Drug Test",
          value: 49,
          color: Color(0xFFA5D8DD),
        ),
        ChartLabeledData(
          label: "Oral Fluid Collection",
          value: 10,
          color: Color(0xFF0091D5),
        ),
      ],
      chartName: 'Rapid Urine Drug Screen',
    ),
    SampleResults(
      pies: [
        PieData(
          value: 65,
          color: Color(0xFF8483AF),
        ),
        PieData(
          value: 42,
          color: Color(0xFFFBB03B),
        ),
        PieData(
          value: 25,
          color: Color(0xFFBBEDF5),
        ),
        PieData(
          value: 55,
          color: Color(0xFFA5D8DD),
        ),
        PieData(
          value: 15,
          color: Color(0xFF0091D5),
        ),
      ],
      maxValue: 202,
      datas: [
        ChartLabeledData(
          label: "Blood Alcohol Test",
          value: 65,
          color: Color(0xFF8483AF),
        ),
        ChartLabeledData(
          label: "Hair Drug Screen",
          value: 42,
          color: Color(0xFFFBB03B),
        ),
        ChartLabeledData(
          label: "Saliva Test",
          value: 25,
          color: Color(0xFFBBEDF5),
        ),
        ChartLabeledData(
          label: "Blood Drug Test",
          value: 55,
          color: Color(0xFFA5D8DD),
        ),
        ChartLabeledData(
          label: "Fingernail Collection",
          value: 15,
          color: Color(0xFF0091D5),
        ),
      ],
      chartName: 'Advanced Toxicology Tests',
    ),
    SampleResults(
      pies: [
        PieData(
          value: 90,
          color: Color(0xFF8483AF),
        ),
        PieData(
          value: 30,
          color: Color(0xFFFBB03B),
        ),
        PieData(
          value: 22,
          color: Color(0xFFBBEDF5),
        ),
        PieData(
          value: 60,
          color: Color(0xFFA5D8DD),
        ),
        PieData(
          value: 8,
          color: Color(0xFF0091D5),
        ),
      ],
      maxValue: 210,
      datas: [
        ChartLabeledData(
          label: "Ethyl Glucuronide Test",
          value: 90,
          color: Color(0xFF8483AF),
        ),
        ChartLabeledData(
          label: "5-Panel Drug Screen",
          value: 30,
          color: Color(0xFFFBB03B),
        ),
        ChartLabeledData(
          label: "10-Panel Drug Screen",
          value: 22,
          color: Color(0xFFBBEDF5),
        ),
        ChartLabeledData(
          label: "Comprehensive Toxicology",
          value: 60,
          color: Color(0xFFA5D8DD),
        ),
        ChartLabeledData(
          label: "Hair Follicle Test",
          value: 8,
          color: Color(0xFF0091D5),
        ),
      ],
      chartName: 'Substance Abuse Testing',
    ),
    SampleResults(
      pies: [
        PieData(
          value: 75,
          color: Color(0xFF8483AF),
        ),
        PieData(
          value: 50,
          color: Color(0xFFFBB03B),
        ),
        PieData(
          value: 30,
          color: Color(0xFFBBEDF5),
        ),
        PieData(
          value: 45,
          color: Color(0xFFA5D8DD),
        ),
        PieData(
          value: 12,
          color: Color(0xFF0091D5),
        ),
      ],
      maxValue: 212,
      datas: [
        ChartLabeledData(
          label: "Instant Drug Test",
          value: 75,
          color: Color(0xFF8483AF),
        ),
        ChartLabeledData(
          label: "Forensic Toxicology",
          value: 50,
          color: Color(0xFFFBB03B),
        ),
        ChartLabeledData(
          label: "Synthetic Drug Panel",
          value: 30,
          color: Color(0xFFBBEDF5),
        ),
        ChartLabeledData(
          label: "DOT Compliance Test",
          value: 45,
          color: Color(0xFFA5D8DD),
        ),
        ChartLabeledData(
          label: "Pregnancy Drug Test",
          value: 12,
          color: Color(0xFF0091D5),
        ),
      ],
      chartName: 'Specialized Drug Screening',
    ),
  ];

  final List<Map<String, dynamic>> sampleResultslegendItems = [
    {'color': Color(0xFF8483AF), 'text': 'Negative'},
    {'color': Color(0xFFFBB03B), 'text': 'Non Negative'},
    {'color': Color(0xFFBBEDF5), 'text': 'Invalid'},
    {'color': Color(0xFFA5D8DD), 'text': 'Sent to Lab'},
    {'color': Color(0xFF0091D5), 'text': 'Refusal'},
  ];
}
