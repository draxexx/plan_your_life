import '../../../../index.dart';

class Reminder extends StatelessWidget {
  const Reminder({
    super.key,
    required this.onTap,
    this.time,
  });

  final void Function()? onTap;
  final String? time;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: MyColors.grayLight20,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: CustomAppIcon(
                icon: Icons.notifications_active,
                color: time == null ? MyColors.grayLight : MyColors.darkBlue,
                size: 32,
              ),
            ),
          ),
          const SizedBox(width: 8),
          textBuilder(
            time ?? "Set a reminder",
            textType: TextType.subText2,
          ),
        ],
      ),
    );
  }
}
