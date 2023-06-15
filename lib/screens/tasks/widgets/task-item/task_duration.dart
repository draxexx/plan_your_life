import '../../../../index.dart';

class TaskDuration extends StatelessWidget {
  const TaskDuration({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomAppIcon(
          icon: Icons.watch_later_outlined,
          size: 16,
          color: Theme.of(context).disabledColor,
        ),
        const SizedBox(width: 4),
        textBuilder(
          "3d",
          textType: TextType.subText1,
          color: Theme.of(context).disabledColor,
        ),
      ],
    );
  }
}
