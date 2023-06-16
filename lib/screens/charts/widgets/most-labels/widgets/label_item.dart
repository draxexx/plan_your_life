import '../../../../../index.dart';

class LabelItem extends StatelessWidget {
  const LabelItem({
    super.key,
    required this.text,
    required this.color,
  });

  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 15,
            height: 15,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(
            width: 4,
          ),
          Expanded(
            child: textBuilder(
              text,
              textType: TextType.subText3,
            ),
          ),
        ],
      ),
    );
  }
}
