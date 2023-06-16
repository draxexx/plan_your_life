import '../../../../../index.dart';

BarChartGroupData makeGroupData(int x, double y1, double y2) {
  return BarChartGroupData(
    barsSpace: 4,
    x: x,
    barRods: [
      BarChartRodData(
        toY: y1,
        color: MyColors.midBlue,
        width: 12,
      ),
    ],
  );
}
