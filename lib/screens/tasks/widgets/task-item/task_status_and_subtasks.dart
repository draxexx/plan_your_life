import '../../../../index.dart';

class TaskStatusAndSubtasks extends StatelessWidget {
  const TaskStatusAndSubtasks({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const TaskStatus(status: 0),
        PopupMenuButton(
          padding: const EdgeInsets.all(0),
          onSelected: (value) {
            if (value == "0") {
              showCustomBottomSheet(
                child: const SubTaskListBottomSheet(),
              );
            } else if (value == "1") {
              print("Delete");
            }
          },
          itemBuilder: (BuildContext bc) {
            return const [
              PopupMenuItem(
                value: '0',
                child: Text("Subtasks"),
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
