import '../index.dart';

class Label extends StatelessWidget {
  const Label({
    super.key,
    required this.text,
    this.color = MyColors.grayLight20,
    this.textColor = MyColors.grayLight,
    this.margin = 0,
  });

  final String text;
  final Color color;
  final Color textColor;
  final double margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(margin),
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
      ),
      child: textBuilder(
        text,
        textType: TextType.subText1,
        color: textColor,
      ),
    );
  }
}
