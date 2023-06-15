import '../../../../index.dart';

class TaskStatusAndSubtasks extends StatelessWidget {
  const TaskStatusAndSubtasks({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const CustomAppIcon(
              icon: Icons.check_circle,
              color: MyColors.green,
              size: 18,
            ),
            const SizedBox(width: 4),
            textBuilder(
              "Done",
              color: MyColors.green,
              textType: TextType.subText1,
            ),
          ],
        ),
        Row(
          children: [
            textBuilder(
              "SubTasks",
              textType: TextType.subText1,
              color: MyColors.grayLight,
            ),
            const CustomAppIcon(
              icon: Icons.keyboard_arrow_down,
              color: MyColors.grayLight,
              size: 18,
            ),
          ],
        ),
      ],
    );
  }
}
