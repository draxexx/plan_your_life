import '../../../../index.dart';

// ignore: must_be_immutable
class TaskStatus extends StatelessWidget {
  const TaskStatus({
    super.key,
    required this.status,
  });

  final int status;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Row(
        children: [
          const CustomAppIcon(
            icon: Icons.check_circle,
            color: MyColors.blue,
            size: 18,
          ),
          const SizedBox(width: 4),
          textBuilder(
            status == 0
                ? "Ongoing"
                : status == 1
                    ? "Pending"
                    : "Done",
            color: MyColors.blue,
            textType: TextType.subText1,
          ),
        ],
      ),
    );
  }
}
