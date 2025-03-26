import 'package:easy_pie_chart/easy_pie_chart.dart';
import 'package:flutter_chartx/components/ChartLabeledData.dart';

class ProcessedTests {
  final List<PieData> pies;
  final double maxValue;
  List<ChartLabeledData> datas;
  final String chartDate;

  ProcessedTests({
    required this.pies,
    required this.maxValue,
    required this.datas,
    required this.chartDate,
  });
}
