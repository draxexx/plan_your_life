import '../../../../../index.dart';

Widget leftTitles(double value, TitleMeta meta) {
  const style = TextStyle(
    color: MyColors.grayLight,
    fontWeight: FontWeight.bold,
    fontSize: 14,
  );
  String text;
  if (value == 0) {
    text = '0';
  } else if (value == 10) {
    text = '10';
  } else if (value == 19) {
    text = '20';
  } else {
    return Container();
  }
  return SideTitleWidget(
    axisSide: meta.axisSide,
    space: 0,
    child: Text(text, style: style),
  );
}
