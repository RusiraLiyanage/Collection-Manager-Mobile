import 'package:easy_pie_chart/easy_pie_chart.dart';
import 'package:flutter_chartx/components/ChartLabeledData.dart';

class SampleResults {
  final List<PieData> pies;
  final double maxValue;
  List<ChartLabeledData> datas;
  final String chartName;

  SampleResults({
    required this.pies,
    required this.maxValue,
    required this.datas,
    required this.chartName,
  });
}
