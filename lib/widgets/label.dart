import '../index.dart';

class Label extends StatelessWidget {
  const Label({
    super.key,
    required this.text,
    this.color = MyColors.grayLight20,
    this.textColor = MyColors.grayLight,
  });

  final String text;
  final Color color;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
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
