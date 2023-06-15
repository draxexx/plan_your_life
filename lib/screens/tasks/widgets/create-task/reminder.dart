import '../../../../index.dart';

class Reminder extends StatelessWidget {
  const Reminder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: MyColors.grayLight20,
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Center(
            child: CustomAppIcon(
              icon: Icons.notifications_active,
              color: MyColors.grayLight,
              size: 32,
            ),
          ),
        ),
        const SizedBox(width: 8),
        textBuilder(
          "Set a reminder",
          textType: TextType.subText2,
        ),
      ],
    );
  }
}
