import '../../../index.dart';

class TaskOverviewPercent extends StatelessWidget {
  const TaskOverviewPercent({
    super.key,
    required this.status,
    required this.percent,
    required this.color,
  });

  final String status, percent;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: getProportionateScreenWidth(16),
          height: getProportionateScreenWidth(16),
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            textBuilder(
              "$percent%",
              textType: TextType.header_5,
            ),
            textBuilder(
              status,
              textType: TextType.subText4,
              color: MyColors.grayLight,
            ),
          ],
        ),
      ],
    );
  }
}
