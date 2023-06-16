import '../../../../../index.dart';

Widget bottomTitles(double value, TitleMeta meta) {
  final titles = <String>['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];

  final Widget text = Text(
    titles[value.toInt()],
    style: const TextStyle(
      color: MyColors.grayLight,
      fontWeight: FontWeight.bold,
      fontSize: 14,
    ),
  );

  return SideTitleWidget(
    axisSide: meta.axisSide,
    space: 16, //margin top
    child: text,
  );
}
