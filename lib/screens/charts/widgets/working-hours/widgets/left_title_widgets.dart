import '../../../../../index.dart';

Widget leftTitleWidgets(double value, TitleMeta meta) {
  const style = TextStyle(
    color: MyColors.grayLight,
    fontWeight: FontWeight.bold,
    fontSize: 14,
  );
  String text;
  switch (value.toInt()) {
    case 0:
      text = '0h';
      break;
    case 1:
      text = '4h';
      break;
    case 2:
      text = '8h';
      break;
    case 3:
      text = '16h';
      break;
    case 4:
      text = '24h';
      break;
    default:
      return Container();
  }

  return Text(text, style: style, textAlign: TextAlign.left);
}
