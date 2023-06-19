import '../../../../index.dart';

class SubTaskListBottomSheet extends StatelessWidget {
  const SubTaskListBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          SubTaskItem(
              task: "Subtaskkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk",
              isDone: true),
          SubTaskItem(task: "Subtask 1", isDone: true),
          SubTaskItem(task: "Subtask 1", isDone: true),
          SubTaskItem(task: "Subtask 1", isDone: true),
          SubTaskItem(task: "Subtask 1", isDone: true),
          SubTaskItem(task: "Subtask 1", isDone: true),
          SubTaskItem(task: "Subtask 1", isDone: true),
          SubTaskItem(task: "Subtask 1", isDone: true),
          SubTaskItem(task: "Subtask 1", isDone: true),
          SubTaskItem(task: "Subtask 1", isDone: true),
          SubTaskItem(task: "Subtask 1", isDone: true),
          SubTaskItem(task: "Subtask 1", isDone: true),
          SubTaskItem(task: "Subtask 1", isDone: true),
          SubTaskItem(task: "Subtask 1", isDone: true),
          SubTaskItem(task: "Subtask 1", isDone: true),
          SubTaskItem(task: "Subtask 1", isDone: true),
          SubTaskItem(task: "Subtask 1", isDone: true),
          SubTaskItem(task: "Subtask 1", isDone: true),
          SubTaskItem(task: "Subtask 1", isDone: true),
          SubTaskItem(task: "Subtask 1", isDone: true),
        ],
      ),
    );
  }
}
