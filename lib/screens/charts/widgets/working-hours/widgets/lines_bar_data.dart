import '../../../../../index.dart';

List<LineChartBarData> linesBarData(List<FlSpot> spots) {
  return [
    LineChartBarData(
      spots: spots,
      isCurved: true,
      curveSmoothness: 0.35,
      color: MyColors.midBlue,
      barWidth: 2,
      isStrokeCapRound: true,
      dotData: const FlDotData(show: true),
      belowBarData: BarAreaData(
        show: false,
      ),
    ),
  ];
}
