import '../index.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    super.key,
    required this.text,
    required this.color,
    required this.fontSize,
    required this.fontWeight,
    required this.lineHeight,
    required this.textAlign,
    required this.overflow,
    required this.letterSpacing,
    required this.textDecoration,
    required this.shadows,
  });

  final String text;
  final Color color;
  final double fontSize, lineHeight, letterSpacing;
  final FontWeight fontWeight;
  final TextAlign textAlign;
  final TextOverflow overflow;
  final TextDecoration textDecoration;
  final List<Shadow>? shadows;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: getProportionateScreenWidth(fontSize),
        fontWeight: fontWeight,
        height: lineHeight,
        letterSpacing: letterSpacing,
        decoration: textDecoration,
        shadows: shadows,
      ),
      textAlign: textAlign,
      overflow: overflow,
    );
  }
}
