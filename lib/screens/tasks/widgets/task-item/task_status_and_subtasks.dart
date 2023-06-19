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
        GestureDetector(
          onTap: () => showCustomBottomSheet(
            child: const SubTaskListBottomSheet(),
          ),
          child: Row(
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
        ),
        PopupMenuButton(
          padding: const EdgeInsets.all(0),
          onSelected: (value) {
            if (value == "0") {
              print("Edit");
            } else if (value == "1") {
              print("Delete");
            }
          },
          itemBuilder: (BuildContext bc) {
            return const [
              PopupMenuItem(
                value: '0',
                child: Text("Edit"),
              ),
              PopupMenuItem(
                value: '1',
                child: Text("Delete"),
              ),
            ];
          },
          child: const SizedBox(
            child: CustomAppIcon(
              icon: Icons.more_horiz,
              color: MyColors.grayLight,
            ),
          ),
        ),
      ],
    );
  }
}
